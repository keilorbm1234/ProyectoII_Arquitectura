# logica.asm - Andrey
# Colisiones, fijar pieza, borrar líneas, puntaje. Prefijo log_
.text

#-----------------------------------------------------------------------------
# initialize_playfield: Clears the virtual game board by filling it with zeros.
#-----------------------------------------------------------------------------
initialize_playfield:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -4
    sw   $s0, 0($sp)

    la   $s0, PLAYFIELD      # $s0 = starting address of the playfield array
    li   $t0, 512            # $t0 = total number of cells to clear (16 * 32)
    li   $t1, 0              # The value to store (0 for empty)

init_loop:
    sw   $t1, 0($s0)         # Store 0 in the current cell
    addi $s0, $s0, 4        # Move to the next word in the array
    addi $t0, $t0, -1       # Decrement counter
    bne  $t0, $zero, init_loop # Loop until all cells are cleared

    # --- Epilogue: Restore registers ---
    lw   $s0, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
    
#-----------------------------------------------------------------------------
# check_collision: Checks if a piece at a given location would collide with
#                  walls, the floor, or frozen pieces in the playfield.
# Arguments:
#   $a0 - Pointer to the piece's shape data
#   $a1 - The potential X coordinate to check
#   $a2 - The potential Y coordinate to check
# Returns:
#   $v0 - 1 if there is a collision, 0 otherwise.
#-----------------------------------------------------------------------------
check_collision:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -20
    sw   $ra, 16($sp)
    sw   $s0, 12($sp)
    sw   $s1, 8($sp)
    sw   $s2, 4($sp)
    sw   $s3, 0($sp)

    li   $t2, 4              # Counter for the 4 blocks of the piece
    move $t7, $a0             # Use a temporary copy of the shape pointer

collision_check_loop:
    lw   $t3, 0($t7)           # rel_x
    lw   $t4, 4($t7)           # rel_y

    # Compute the absolute (x,y) of the block in the playfield
    add  $s0, $a1, $t3         # abs_x = piece_x + rel_x
    add  $s1, $a2, $t4         # abs_y = piece_y + rel_y

    # --- CHECK 1: Wall Collision ---
    # Check if abs_x is out of bounds ( < 0 or >= 16)
    blt  $s0, $zero, collision_found # if (abs_x < 0) -> collision
    li   $t0, 16
    bge  $s0, $t0, collision_found   # if (abs_x >= 16) -> collision
    
    # --- CHECK 2: Floor Collision ---
    # Check if abs_y is out of bounds ( >= 31)
    li   $t0, 31
    bge  $s1, $t0, collision_found   # if (abs_y >= 31) -> collision
    
    # --- CHECK 3: Playfield Collision ---
    # Calculate the index in the PLAYFIELD array: index = y * 16 + x
    li   $s2, 16
    mul  $s2, $s1, $s2         # y * 16
    add  $s2, $s2, $s0         # (y * 16) + x
    sll  $s2, $s2, 2           # Convert from word index to byte offset
    
    la   $s3, PLAYFIELD
    add  $s3, $s3, $s2         # $s3 = address of the cell in the playfield
    
    lw   $t0, 0($s3)           # Load the value from the playfield cell
    beq  $t0, 1, collision_found   # If the cell is 1, it's occupied -> collision

    # --- Continue to the next block ---
    addi $t7, $t7, 8           # Move to the next coordinate pair in shape data
    addi $t2, $t2, -1          # Decrement block counter
    bne  $t2, $zero, collision_check_loop

    # If we get here, all 4 blocks are in a valid position
    li   $v0, 0                # Return 0 (no collision)
    j    collision_check_done

collision_found:
    li   $v0, 1                # Return 1 (collision)

collision_check_done:
    # --- Epilogue: Restore registers ---
    lw   $s3, 0($sp)
    lw   $s2, 4($sp)
    lw   $s1, 8($sp)
    lw   $s0, 12($sp)
    lw   $ra, 16($sp)
    addi $sp, $sp, 20
    jr   $ra

#-----------------------------------------------------------------------------
# freeze_piece: Marks the current piece's position as occupied in the PLAYFIELD array.
# Arguments:
#   $a0 - Pointer to the piece's shape data
#   $a1 - The final X coordinate of the piece
#   $a2 - The final Y coordinate of the piece
#-----------------------------------------------------------------------------
freeze_piece:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    li   $t2, 4              # Counter for the 4 blocks of the piece
    move $t7, $a0             # Use a temporary copy of the shape pointer

freeze_loop:
    lw   $t3, 0($t7)           # rel_x
    lw   $t4, 4($t7)           # rel_y

    # Compute the absolute (x,y) of the block in the playfield
    add  $s0, $a1, $t3         # abs_x = piece_x + rel_x
    add  $s1, $a2, $t4         # abs_y = piece_y + rel_y

    # Calculate the index in the PLAYFIELD array: index = y * 16 + x
    li   $s2, 16
    mul  $s2, $s1, $s2
    add  $s2, $s2, $s0
    sll  $s2, $s2, 2

    la   $t0, PLAYFIELD
    add  $t0, $t0, $s2         # $t0 = address of the cell in the playfield
    
    # Mark the cell as occupied by storing a 1
    li   $t1, 1
    sw   $t1, 0($t0)

    # --- Continue to the next block ---
    addi $t7, $t7, 8
    addi $t2, $t2, -1
    bne  $t2, $zero, freeze_loop

    # --- Epilogue: Restore registers ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra

#-----------------------------------------------------------------------------
# shift_rows_down: Shifts all rows above a cleared line down by one.
# Arguments:
#   $a0 - The Y-coordinate of the line that was cleared.
#-----------------------------------------------------------------------------
shift_rows_down:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -12
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    move $s0, $a0            # $s0 = y_cleared

shift_outer_loop: # Loop through rows from y_cleared down to 1
    li   $s1, 0              # x = 0

shift_inner_loop: # Loop through each column in the row
    # Calculate address of the cell ABOVE: PLAYFIELD[y-1][x]
    move $t0, $s0            # y
    addi $t0, $t0, -1        # y - 1
    li   $t1, 16
    mul  $t0, $t0, $t1
    add  $t0, $t0, $s1       # index = (y-1) * 16 + x
    sll  $t0, $t0, 2
    la   $t2, PLAYFIELD
    add  $t2, $t2, $t0       # Address of PLAYFIELD[y-1][x]
    lw   $t3, 0($t2)         # $t3 = value from the cell above

    # Calculate address of the CURRENT cell: PLAYFIELD[y][x]
    move $t0, $s0
    li   $t1, 16
    mul  $t0, $t0, $t1
    add  $t0, $t0, $s1       # index = y * 16 + x
    sll  $t0, $t0, 2
    la   $t2, PLAYFIELD
    add  $t2, $t2, $t0       # Address of PLAYFIELD[y][x]

    # Copy the value from the cell above into the current cell
    sw   $t3, 0($t2)

    addi $s1, $s1, 1
    blt  $s1, 16, shift_inner_loop # Continue until row is copied

    addi $s0, $s0, -1
    bgt  $s0, $zero, shift_outer_loop # Continue until all rows above are shifted

    # --- NEW: Clear row 0 after shifting ---
    li   $s1, 0              # x = 0
clear_row0_loop:
    li   $t0, 0              # value = 0
    # address of PLAYFIELD[0][x]
    move $t2, $zero          # y = 0
    li   $t3, 16
    mul  $t2, $t2, $t3       # 0 * 16
    add  $t2, $t2, $s1       # x
    sll  $t2, $t2, 2
    la   $t3, PLAYFIELD
    add  $t3, $t3, $t2
    sw   $t0, 0($t3)
    addi $s1, $s1, 1
    blt  $s1, 16, clear_row0_loop

    # --- Epilogue: Restore registers ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    addi $sp, $sp, 12
    jr   $ra


## MODIFIED: check_and_clear_lines
check_and_clear_lines:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $t0, 0($sp)

    li   $s0, 30             # Start scanning from the second to last row (y=30)

check_row_loop:
    bge  $s0, $zero, continue_check_row_loop # Ensure we don't check negative rows
    j    check_lines_done                   # Exit if we've gone past the top

continue_check_row_loop:
    li   $s1, 0              # x = 0
    li   $t0, 1              # is_full_line = true (1)

check_col_loop:
    move $t1, $s0
    li   $t2, 16
    mul  $t1, $t1, $t2
    add  $t1, $t1, $s1
    sll  $t1, $t1, 2
    la   $t2, PLAYFIELD
    add  $t2, $t2, $t1
    lw   $t3, 0($t2)
    beq  $t3, $zero, line_not_full
    addi $s1, $s1, 1
    blt  $s1, 16, check_col_loop

line_is_full:
    # --- Add point to score ---
    la   $t0, SCORE
    lw   $t1, 0($t0)
    addi $t1, $t1, 1
    sw   $t1, 0($t0)

    # --- Increment lines cleared and adjust speed ---
    la   $t0, LINES_CLEARED
    lw   $t1, 0($t0)
    addi $t1, $t1, 1
    sw   $t1, 0($t0)
    jal  update_speed

    ## --- NEW: Handle clearing row 0 as a special case ---
    bne  $s0, $zero, shift_normally # If y is not 0, shift normally
    # This is row 0, so we just clear it
    jal  clear_top_row
    j    line_not_full # After clearing row 0, continue scan from row -1 (which will exit)

shift_normally:
    # --- Shift rows down ---
    move $a0, $s0
    jal  shift_rows_down
    # Re-check the same row index since it now has new blocks
    addi $s0, $s0, 1

line_not_full:
    addi $s0, $s0, -1
    j    check_row_loop

check_lines_done:
    # --- Epilogue: Restore registers ---
    lw   $t0, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
    jr   $ra
    
# Compares the final score with the high score and updates if it's greater.
update_high_score:
    la   $t0, SCORE
    lw   $s0, 0($t0) # $s0 = current score

    la   $t1, HIGH_SCORE
    lw   $s1, 0($t1) # $s1 = current high score

    bgt  $s0, $s1, new_high_score # if (score > high_score)
    jr   $ra                     # Otherwise, just return

new_high_score:
    sw   $s0, 0($t1) # Update HIGH_SCORE with the new score
    jr   $ra
    
## NEW: clear_top_row
# Manually clears the top row (y=0) of the playfield. This is a special
# case because there are no rows above it to shift down.
clear_top_row:
    la   $s0, PLAYFIELD  # $s0 = starting address of the playfield
    li   $t0, 16         # $t0 = 16 cells to clear
    li   $t1, 0          # The value to store (0 for empty)

clear_top_row_loop:
    sw   $t1, 0($s0)     # Store 0 in the current cell
    addi $s0, $s0, 4     # Move to the next word in the array
    addi $t0, $t0, -1    # Decrement counter
    bne  $t0, $zero, clear_top_row_loop # Loop until all 16 cells are cleared

    jr   $ra  
