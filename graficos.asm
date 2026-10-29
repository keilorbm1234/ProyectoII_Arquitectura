# graficos.asm - Jorge
# Tablero, HUD, vista previa y pantallas. Prefijo gfx_
.text

#-----------------------------------------------------------------------------
# draw_scene: Draws the static board AND all frozen pieces from the playfield.
#-----------------------------------------------------------------------------
draw_scene:
    # --- Function Setup: Load all colors ---
    # (This part is the same as before)
    la   $t0, ADDR_DSPL
    lw   $t0, 0($t0)
    la   $t1, COLOR_BLACK
    lw   $t1, 0($t1)
    la   $t2, COLOR_BG_WALL
    lw   $t2, 0($t2)
    la   $t3, COLOR_BG_GREY_DARK
    lw   $t3, 0($t3)
    la   $t4, COLOR_BG_GRAY_LIGHT
    lw   $t4, 0($t4)
    la   $t5, COLOR_PANEL_NEXT
    lw   $t5, 0($t5)
    la   $t6, COLOR_PANEL_SCORE
    lw   $t6, 0($t6)

    # --- Draw the static background, walls, and panels ---
    # (This nested loop is the same as before)
    li   $s0, 0
scene_outer_loop:
    li   $s1, 0
scene_inner_loop:
    blt  $s1, 2, draw_black
    beq  $s1, 2, draw_wall_color
    blt  $s1, 19, handle_play_area
    beq  $s1, 19, draw_wall_color
    beq  $s1, 20, draw_black
    blt  $s1, 31, handle_side_panel
    j    draw_black
handle_play_area:
    beq  $s0, 31, draw_wall_color
    add  $t7, $s0, $s1
    andi $t7, $t7, 1
    beq  $t7, $zero, draw_dark_grey
    j    draw_light_grey
handle_side_panel:
    blt  $s0, 20, draw_green_panel
    blt  $s0, 22, draw_black
    j    draw_red_panel
draw_black:
    sw   $t1, 0($t0)
    j    scene_continue
draw_wall_color:
    sw   $t2, 0($t0)
    j    scene_continue
draw_dark_grey:
    sw   $t3, 0($t0)
    j    scene_continue
draw_light_grey:
    sw   $t4, 0($t0)
    j    scene_continue
draw_green_panel:
    sw   $t5, 0($t0)
    j    scene_continue
draw_red_panel:
    sw   $t6, 0($t0)
    j    scene_continue
scene_continue:
    addi $t0, $t0, 4
    addi $s1, $s1, 1
    blt  $s1, 32, scene_inner_loop
    addi $s0, $s0, 1
    blt  $s0, 32, scene_outer_loop

    # --- NEW: Draw all frozen pieces from the PLAYFIELD array ---
    la   $s0, PLAYFIELD              # $s0 = pointer to the start of the playfield
    li   $s1, 512                    # $s1 = counter for all 512 cells
    li   $s2, 0                      # $s2 = index of the current cell (0 to 511)
    la   $t1, COLOR_FROZEN_BLOCK
    lw   $t1, 0($t1)                 # $t1 = color for frozen blocks

draw_playfield_loop:
    lw   $t0, 0($s0)                 # Load the value from the current playfield cell
    beq  $t0, $zero, check_next_cell # If it's 0 (empty), skip drawing

    # This cell is occupied (1), so we need to draw a block.
    # Calculate the (x,y) of this cell in the playfield.
    li   $t0, 16
    divu $s2, $t0                    # Use divu for unsigned division
    mflo $t2                         # $t2 = y = index / 16
    mfhi $t3                         # $t3 = x = index % 16
    
    # Calculate the screen memory address for this (x,y)
    addi $t3, $t3, 3                 # Add screen x-offset for the playfield
    li   $t4, 32
    mul  $t4, $t2, $t4
    add  $t4, $t4, $t3
    mul  $t4, $t4, 4
    la   $t0, ADDR_DSPL
    lw   $t0, 0($t0)
    add  $t0, $t0, $t4               # $t0 = final memory address to draw
    
    # Draw the frozen block
    sw   $t1, 0($t0)

check_next_cell:
    addi $s0, $s0, 4                 # Move to the next cell in the playfield array
    addi $s2, $s2, 1                 # Increment index
    addi $s1, $s1, -1                # Decrement counter
    bne  $s1, $zero, draw_playfield_loop

    jr   $ra


#-----------------------------------------------------------------------------
# draw_line: Draws a vertical or horizontal line.
# Arguments:
#   $a0 - Starting X coordinate
#   $a1 - Starting Y coordinate
#   $a2 - Length of the line (in units)
#   $a3 - Direction (0 for horizontal, 1 for vertical)
#-----------------------------------------------------------------------------
draw_line:
    # Calculate starting memory address from (x, y) coordinates
    # address = base + (y * 32 + x) * 4
    li   $t5, 32
    mul  $t4, $a1, $t5         # $t4 = y * 32
    add  $t4, $t4, $a0         # $t4 = y * 32 + x
    mul  $t4, $t4, 4           # $t4 = (y * 32 + x) * 4 (final byte offset)

    la   $t0, ADDR_DSPL
    lw   $t0, 0($t0)           # $t0 = base address
    add  $t0, $t0, $t4         # $t0 = starting memory address for the line

    # Get the wall color
    la   $t1, COLOR_BG_WALL
    lw   $t1, 0($t1)

    # Determine address increment based on direction
    li   $t5, 4                # Default increment for horizontal lines
    bne  $a3, 1, setup_line_loop # If not vertical, skip ahead
    li   $t5, 128              # Increment for vertical lines

setup_line_loop:
    move $t2, $a2              # $t2 = line length (our counter)

line_loop:
    sw   $t1, 0($t0)           # Draw one unit of the line
    add  $t0, $t0, $t5         # Move pointer by horizontal or vertical increment
    addi $t2, $t2, -1          # Decrement counter
    bne  $t2, $zero, line_loop # Loop until line is drawn

    jr   $ra
    

#-----------------------------------------------------------------------------
# draw_tetromino: Draws the current piece with its current color and position.
# Arguments:
#   $a0 - Pointer to the piece's shape data
#   $a1 - X coordinate (within the 16-wide playfield)
#   $a2 - Y coordinate (within the 32-high playfield)
#-----------------------------------------------------------------------------
draw_tetromino:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    # Load the CURRENT piece's color
    la   $t1, CURRENT_PIECE_COLOR
    lw   $t1, 0($t1)

    li   $t2, 4
    move $t7, $a0

draw_tetromino_loop:
    lw   $t3, 0($t7)
    lw   $t4, 4($t7)

    # Compute absolute screen coordinates
    add  $s0, $a1, $t3         # abs_x = piece_x + rel_x
    add  $s1, $a2, $t4         # abs_y = piece_y + rel_y
    
    # Add the playfield's offset from the left edge of the screen
    addi $s0, $s0, 3           # The playfield starts at column 3

    # Compute final memory address from (abs_x, abs_y)
    li   $s2, 32               # Screen width is 32 units
    mul  $s2, $s1, $s2         # y_offset = abs_y * screen_width
    add  $s2, $s2, $s0         # index = y_offset + abs_x
    mul  $s2, $s2, 4           # byte_offset = index * 4

    la   $t0, ADDR_DSPL
    lw   $t0, 0($t0)
    add  $t0, $t0, $s2

    sw   $t1, 0($t0)

    addi $t7, $t7, 8
    addi $t2, $t2, -1
    bne  $t2, $zero, draw_tetromino_loop

    # --- Epilogue: Restore registers ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra

#-----------------------------------------------------------------------------
# draw_digit: Draws a single 3x5 digit at a given screen location.
#-----------------------------------------------------------------------------
draw_digit:
    # --- Prologue ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    # Get the pointer to the correct font data
    sll  $t0, $a0, 2
    la   $t1, FONT_TABLE
    add  $t1, $t1, $t0
    lw   $s0, 0($t1)      # $s0 = pointer to the font data for this digit

    li   $s1, 0           # Row index (y_offset), from 0 to 4

digit_row_loop:
    lw   $t0, 0($s0)      # $t0 = pixel data for the current row
    li   $s2, 2           # Column index starts at 2 (right)

digit_col_loop:
    andi $t1, $t0, 1      # Check the rightmost bit of the row data
    beq  $t1, $zero, skip_pixel

    # This bit is a 1, so we need to draw it.
    # Calculate screen coordinates for this pixel
    add  $t1, $a1, $s2    # screen_x = base_x + col_index
    add  $t2, $a2, $s1    # screen_y = base_y + row_index

    # Calculate final memory address
    li   $t3, 32
    mul  $t3, $t2, $t3
    add  $t3, $t3, $t1
    sll  $t3, $t3, 2
    la   $t4, ADDR_DSPL
    lw   $t4, 0($t4)
    add  $t4, $t4, $t3
    la   $t5, COLOR_TEXT_ORANGE
    lw   $t5, 0($t5)
    sw   $t5, 0($t4)

skip_pixel:
    srl  $t0, $t0, 1      # Move to the next bit (pixel) in the row data
    addi $s2, $s2, -1     # Decrement column index (move left)
    bge  $s2, $zero, digit_col_loop # Loop while column is >= 0

    addi $s0, $s0, 4      # Move to the next row of font data
    addi $s1, $s1, 1      # row_index++
    blt  $s1, 5, digit_row_loop

    # --- Epilogue ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra

#-----------------------------------------------------------------------------
# draw_score: Displays the current score in the side panel.
# This is a robust version that handles scores of any length.
#-----------------------------------------------------------------------------
## REPLACE ENTIRE FUNCTION
draw_score:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    la   $t0, SCORE
    lw   $a0, 0($t0)        # value
    li   $a1, 21            # panel left
    li   $a2, 10            # panel width
    li   $a3, 24            # vertically centered
    jal  draw_number_centered

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


extract_and_draw:
    li   $t0, 10          # Must be reset before each division
    divu $s0, $t0         # Divide score by 10
    mflo $s0              # New score = quotient
    mfhi $a0              # Digit to draw = remainder

    move $a1, $s1         # X position
    move $a2, $s2         # Y position
    jal  draw_digit       # Draw the digit

    addi $s1, $s1, -4     # Move left for the next digit

    bne  $s0, $zero, extract_and_draw

draw_score_cleanup:
    # --- Epilogue ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra
    
## NEW: draw_high_score
# Displays the "HI" text and the high score value in the top right panel.

## REPLACE ENTIRE FUNCTION
## REPLACE ENTIRE FUNCTION
draw_high_score:
    addi $sp, $sp, -12
    sw   $ra, 8($sp)
    sw   $s0, 4($sp)
    sw   $s1, 0($sp)

    # "HI" centered in 10-wide panel: label width=8 -> x = 21 + (10-8)/2 = 22
    la   $a0, HI_TEXT
    li   $a1, 22            # x
    li   $a2, 2             # y
    jal  draw_string

    # value on next line, centered
    la   $t0, HIGH_SCORE
    lw   $a0, 0($t0)        # value
    li   $a1, 21            # panel left
    li   $a2, 10            # panel width
    li   $a3, 8             # y = 2 + 6 (5px high + 1px gap)
    jal  draw_number_centered

    lw   $s1, 0($sp)
    lw   $s0, 4($sp)
    lw   $ra, 8($sp)
    addi $sp, $sp, 12
    jr   $ra




####


draw_game_over_screen:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # Redraw background
    jal  draw_scene

    # Keep panels stable during game over
    jal  draw_score
    jal  draw_high_score

    # --- Centered text with 6-row spacing ---
    # Choose a base so all 4 lines fit: 8,14,20,26 (each line is 5px tall)
    # "GAME" width = 4 chars * 4 stride = 16 -> center x = (32-16)/2 = 8
    la   $a0, GAME_TEXT
    li   $a1, 8       # x
    li   $a2, 8       # y
    jal  draw_string

    la   $a0, OVER_TEXT
    li   $a1, 8       # x
    li   $a2, 14      # y = 8 + 6
    jal  draw_string

    # "RETRY" width = 5*4 = 20 -> center x = 6
    la   $a0, RETRY_ONLY_TEXT
    li   $a1, 6
    li   $a2, 20      # y = 14 + 6
    jal  draw_string

    # "(R)" width = 3*4 = 12 -> center x = 10
    la   $a0, R_PARENS_TEXT
    li   $a1, 10
    li   $a2, 26      # y = 20 + 6
    jal  draw_string

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra



## NEW: draw_string
# Draws a null-terminated string at a given screen location.
# Arguments:
#   $a0 - Address of the null-terminated string
#   $a1 - Starting X coordinate (in units)
#   $a2 - Starting Y coordinate (in units)
draw_string:
    # --- Prologue ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp) # String address
    sw   $s1, 4($sp) # Current X
    sw   $s2, 0($sp) # Current Y

    move $s0, $a0
    move $s1, $a1
    move $s2, $a2

draw_string_loop:
    lb   $a0, 0($s0) # Load character
    beq  $a0, $zero, draw_string_done # If null terminator, we're done

    # Prepare arguments for draw_char
    # $a0 already has the character
    move $a1, $s1
    move $a2, $s2
    jal  draw_char

    addi $s1, $s1, 4  # Move X position right for the next character (3px wide + 1px space)
    addi $s0, $s0, 1  # Move to next char in string
    j    draw_string_loop

draw_string_done:
    # --- Epilogue ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra

## FIXED: draw_char
# Draws a single character. This is a helper for draw_string.
# It uses a big if-else chain to find the right font data.
# Arguments:
#   $a0 - The ASCII character to draw
#   $a1 - X coordinate
#   $a2 - Y coordinate

## REPLACEMENT FUNCTION: draw_char
draw_char:
    # Save original X/Y
    addi $sp, $sp, -8
    sw   $a1, 4($sp)
    sw   $a2, 0($sp)

    move $t6, $a0           # keep ASCII char for comparisons
    la   $a0, FONT_SPACE    # default font (space)

    # Map ASCII to font pointer (compare against $t6)
    li   $t0, 'A'
    beq  $t6, $t0, char_is_A
    li   $t0, 'E'
    beq  $t6, $t0, char_is_E
    li   $t0, 'G'
    beq  $t6, $t0, char_is_G
    li   $t0, 'H'
    beq  $t6, $t0, char_is_H
    li   $t0, 'I'
    beq  $t6, $t0, char_is_I
    li   $t0, 'M'
    beq  $t6, $t0, char_is_M
    li   $t0, 'O'
    beq  $t6, $t0, char_is_O
    li   $t0, 'R'
    beq  $t6, $t0, char_is_R
    li   $t0, 'T'
    beq  $t6, $t0, char_is_T
    li   $t0, 'V'
    beq  $t6, $t0, char_is_V
    li   $t0, 'Y'
    beq  $t6, $t0, char_is_Y
    li   $t0, '('
    beq  $t6, $t0, char_is_LParen
    li   $t0, ')'
    beq  $t6, $t0, char_is_RParen
    li   $t0, ' '
    beq  $t6, $t0, char_is_Space
    j    draw_char_found_font

char_is_A:
    la   $a0, FONT_A
    j    draw_char_found_font
char_is_E:
    la   $a0, FONT_E
    j    draw_char_found_font
char_is_G:
    la   $a0, FONT_G
    j    draw_char_found_font
char_is_H:
    la   $a0, FONT_H
    j    draw_char_found_font
char_is_I:
    la   $a0, FONT_I
    j    draw_char_found_font
char_is_M:
    la   $a0, FONT_M
    j    draw_char_found_font
char_is_O:
    la   $a0, FONT_O
    j    draw_char_found_font
char_is_R:
    la   $a0, FONT_R
    j    draw_char_found_font
char_is_T:
    la   $a0, FONT_T
    j    draw_char_found_font
char_is_V:
    la   $a0, FONT_V
    j    draw_char_found_font
char_is_Y:
    la   $a0, FONT_Y
    j    draw_char_found_font
char_is_LParen:
    la   $a0, FONT_L_PAREN
    j    draw_char_found_font
char_is_RParen:
    la   $a0, FONT_R_PAREN
    j    draw_char_found_font
char_is_Space:
    la   $a0, FONT_SPACE
    j    draw_char_found_font

draw_char_found_font:
    move $t0, $a0
    lw   $a1, 4($sp)       # restore X
    lw   $a2, 0($sp)       # restore Y

    # Inline draw loop with COLOR_TEXT_ORANGE
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    move $s0, $t0
    li   $s1, 0

char_row_loop:
    lw   $t0, 0($s0)
    li   $s2, 2

char_col_loop:
    andi $t1, $t0, 1
    beq  $t1, $zero, char_skip
    add  $t1, $a1, $s2
    add  $t2, $a2, $s1
    li   $t3, 32
    mul  $t3, $t2, $t3
    add  $t3, $t3, $t1
    sll  $t3, $t3, 2
    la   $t4, ADDR_DSPL
    lw   $t4, 0($t4)
    add  $t4, $t4, $t3
    la   $t5, COLOR_TEXT_ORANGE
    lw   $t5, 0($t5)
    sw   $t5, 0($t4)

char_skip:
    srl  $t0, $t0, 1
    addi $s2, $s2, -1
    bge  $s2, $zero, char_col_loop
    addi $s0, $s0, 4
    addi $s1, $s1, 1
    blt  $s1, 5, char_row_loop

    # Epilogue
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16

    addi $sp, $sp, 8
    jr   $ra

# a0 = nonnegative value
# v0 = digit count (1 if value==0)
count_digits:
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $a0, 0($sp)

    bne  $a0, $zero, cd_loop_prep
    li   $v0, 1
    j    cd_done
cd_loop_prep:
    li   $v0, 0
cd_loop:
    addi $v0, $v0, 1
    li   $t0, 10
    divu $a0, $t0
    mflo $a0
    bne  $a0, $zero, cd_loop

cd_done:
    lw   $a0, 0($sp)
    lw   $ra, 4($sp)
    addi $sp, $sp, 8
    jr   $ra

# Draw number centered in a panel.
# a0=value, a1=panel_left_x, a2=panel_width, a3=y
draw_number_centered:
    addi $sp, $sp, -24
    sw   $ra, 20($sp)
    sw   $s0, 16($sp)   # value
    sw   $s1, 12($sp)   # left
    sw   $s2, 8($sp)    # width
    sw   $s3, 4($sp)    # y
    sw   $s4, 0($sp)    # digit count

    move $s0, $a0
    move $s1, $a1
    move $s2, $a2
    move $s3, $a3

    move $a0, $s0
    jal  count_digits
    move $s4, $v0               # digits

    # W = 4*digits - 1  (each digit is 3 wide + 1 space, except last)
    li   $t0, 4
    mul  $t0, $t0, $s4
    addi $t0, $t0, -1           # t0 = W

    # leftmost_x = left + ((panel_width - W)/2)
    sub  $t1, $s2, $t0
    sra  $t1, $t1, 1
    add  $t1, $s1, $t1          # t1 = leftmost_x

    # rightmost digit's left x = leftmost_x + 4*(digits-1)
    addi $t2, $s4, -1
    li   $t3, 4
    mul  $t2, $t2, $t3
    add  $s1, $t1, $t2          # s1 = current x (rightmost digit pos)

    # Draw right-to-left
    bne  $s0, $zero, dnc_loop
    li   $a0, 0                 # special case value==0
    move $a1, $s1
    move $a2, $s3
    jal  draw_digit
    j    dnc_done

dnc_loop:
    li   $t3, 10
    divu $s0, $t3
    mfhi $a0                    # remainder = digit
    mflo $s0                    # quotient
    move $a1, $s1
    move $a2, $s3
    jal  draw_digit
    addi $s1, $s1, -4
    bne  $s0, $zero, dnc_loop

dnc_done:
    lw   $s4, 0($sp)
    lw   $s3, 4($sp)
    lw   $s2, 8($sp)
    lw   $s1, 12($sp)
    lw   $s0, 16($sp)
    lw   $ra, 20($sp)
    addi $sp, $sp, 24
    jr   $ra   