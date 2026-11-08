# logica.asm - Andrey
# Collisions, piece locking, line clearing and scoring. New label prefix: log_
.text

#-----------------------------------------------------------------------------
# initialize_playfield: Clears the virtual game board by filling it with zeros.
# Arguments: none; uses the global PLAYFIELD array.
# Returns: none. Clears ANCHO * ALTO word-sized cells.
# Preserves: $s0-$s7, $sp and $ra. Modifies: $t0-$t1.
#-----------------------------------------------------------------------------
initialize_playfield:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -4
    sw   $s0, 0($sp)

    la   $s0, PLAYFIELD      # $s0 = starting address of the playfield array
    li   $t0, ANCHO          # Load the number of playable columns
    li   $t1, ALTO           # Load the number of playable rows
    mul  $t0, $t0, $t1       # Total number of cells = ANCHO * ALTO
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
# Preserves: $a0-$a2, $s0-$s7, $sp and $ra.
# Modifies: $v0, $t0, $t2-$t4 and $t7.
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
    # Check if abs_x is out of bounds ( < 0 or >= ANCHO)
    blt  $s0, $zero, collision_found # if (abs_x < 0) -> collision
    li   $t0, ANCHO
    bge  $s0, $t0, collision_found   # if (abs_x >= ANCHO) -> collision
    
    # --- CHECK 2: Vertical Bounds ---
    # Reject negative rows before calculating any PLAYFIELD address.
    blt  $s1, $zero, collision_found # if (abs_y < 0) -> collision
    # The last playable row is ALTO - 1; the floor lies below it.
    li   $t0, ALTO
    bge  $s1, $t0, collision_found   # if (abs_y >= ALTO) -> collision
    
    # --- CHECK 3: Playfield Collision ---
    # Calculate the PLAYFIELD index only after both coordinates are valid.
    li   $s2, ANCHO
    mul  $s2, $s1, $s2         # y * ANCHO
    add  $s2, $s2, $s0         # (y * ANCHO) + x
    sll  $s2, $s2, 2           # Convert from word index to byte offset
    
    la   $s3, PLAYFIELD
    add  $s3, $s3, $s2         # $s3 = address of the cell in the playfield
    
    lw   $t0, 0($s3)           # Load the value from the playfield cell
    bne  $t0, $zero, collision_found # Any nonzero cell is occupied

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
# freeze_piece: stores CURRENT_PIECE_TYPE + 1 in the four PLAYFIELD cells.
# Arguments:
#   $a0 - Pointer to the piece's shape data
#   $a1 - The final X coordinate of the piece
#   $a2 - The final Y coordinate of the piece
# Returns: $v0 = 0 on success, 1 if the position or piece type is invalid.
# Preserves: $a0-$a2, $s0-$s7, $sp and $ra.
# Modifies: $v0, $t0, $t2-$t5 and $t7.
# Validates all four blocks before writing any cell; rejected pieces write nothing.
# Active types 0..6 map to stored IDs 1..7; zero remains an empty cell.
#-----------------------------------------------------------------------------
freeze_piece:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    # check_collision preserves the arguments; reload temporary state afterward.
    jal  check_collision
    bne  $v0, $zero, log_freeze_done

    # Validate the active type before converting it to a nonzero board ID.
    li   $v0, 1
    lw   $t5, CURRENT_PIECE_TYPE
    blt  $t5, $zero, log_freeze_done
    li   $t0, 7
    bge  $t5, $t0, log_freeze_done
    addi $t5, $t5, 1         # Stored ID = active type + 1
    li   $v0, 0              # All validation succeeded

    li   $t2, 4              # Counter for the 4 blocks of the piece
    move $t7, $a0             # Use a temporary copy of the shape pointer

freeze_loop:
    lw   $t3, 0($t7)           # rel_x
    lw   $t4, 4($t7)           # rel_y

    # Compute the absolute (x,y) of the block in the playfield
    add  $s0, $a1, $t3         # abs_x = piece_x + rel_x
    add  $s1, $a2, $t4         # abs_y = piece_y + rel_y

    # Calculate the index in the PLAYFIELD array: index = y * ANCHO + x
    li   $s2, ANCHO
    mul  $s2, $s1, $s2
    add  $s2, $s2, $s0
    sll  $s2, $s2, 2

    la   $t0, PLAYFIELD
    add  $t0, $t0, $s2         # $t0 = address of the cell in the playfield
    
    # Store the same piece ID in each of its four cells.
    sw   $t5, 0($t0)

    # --- Continue to the next block ---
    addi $t7, $t7, 8
    addi $t2, $t2, -1
    bne  $t2, $zero, freeze_loop

log_freeze_done:
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
# Returns: none. Rows outside 0..ALTO-1 leave the board unchanged.
# Row 0 is cleared directly; other rows receive the full values from above.
# Preserves: $a0, $s0-$s7, $sp and $ra. Modifies: $t0-$t3.
#-----------------------------------------------------------------------------
shift_rows_down:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -12
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)

    move $s0, $a0            # $s0 = y_cleared

    # Validate the row before accessing either it or the row above it.
    blt  $s0, $zero, log_shift_done
    li   $t0, ALTO
    bge  $s0, $t0, log_shift_done
    beq  $s0, $zero, log_shift_clear_top

shift_outer_loop: # Loop through rows from y_cleared down to 1
    li   $s1, 0              # x = 0

shift_inner_loop: # Loop through each column in the row
    # Calculate address of the cell ABOVE: PLAYFIELD[y-1][x]
    move $t0, $s0            # y
    addi $t0, $t0, -1        # y - 1
    li   $t1, ANCHO
    mul  $t0, $t0, $t1
    add  $t0, $t0, $s1       # index = (y-1) * ANCHO + x
    sll  $t0, $t0, 2
    la   $t2, PLAYFIELD
    add  $t2, $t2, $t0       # Address of PLAYFIELD[y-1][x]
    lw   $t3, 0($t2)         # $t3 = value from the cell above

    # Calculate address of the CURRENT cell: PLAYFIELD[y][x]
    move $t0, $s0
    li   $t1, ANCHO
    mul  $t0, $t0, $t1
    add  $t0, $t0, $s1       # index = y * ANCHO + x
    sll  $t0, $t0, 2
    la   $t2, PLAYFIELD
    add  $t2, $t2, $t0       # Address of PLAYFIELD[y][x]

    # Copy the value from the cell above into the current cell
    sw   $t3, 0($t2)

    addi $s1, $s1, 1
    li   $t0, ANCHO
    blt  $s1, $t0, shift_inner_loop # Continue until the row is copied

    addi $s0, $s0, -1
    bgt  $s0, $zero, shift_outer_loop # Continue until all rows above are shifted

log_shift_clear_top:
    # Clear row 0 after shifting, or directly when the requested row is 0.
    li   $s1, 0              # x = 0
clear_row0_loop:
    li   $t0, 0              # value = 0
    # address of PLAYFIELD[0][x]
    move $t2, $zero          # y = 0
    li   $t3, ANCHO
    mul  $t2, $t2, $t3       # 0 * ANCHO
    add  $t2, $t2, $s1       # x
    sll  $t2, $t2, 2
    la   $t3, PLAYFIELD
    add  $t3, $t3, $t2
    sw   $t0, 0($t3)
    addi $s1, $s1, 1
    li   $t0, ANCHO
    blt  $s1, $t0, clear_row0_loop

log_shift_done:
    # --- Epilogue: Restore registers ---
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    addi $sp, $sp, 12
    jr   $ra


# check_and_clear_lines: scans all playable rows and removes full lines.
# Arguments: none; uses the global PLAYFIELD and LINES_CLEARED.
# Returns: $v0 = number of lines removed in this call.
# Preserves: $s0-$s7, $sp and $ra. Modifies: $v0, $a0 and temporary registers.
# Adds the per-call count to LINES_CLEARED exactly once; does not change SCORE.
# The core must save the returned count, call log_update_score once with a valid
# level, then handle its level/speed/victory rules without adding the lines again.
check_and_clear_lines:
    # --- Prologue: Save registers ---
    addi $sp, $sp, -20
    sw   $ra, 16($sp)
    sw   $s0, 12($sp)
    sw   $s1, 8($sp)
    sw   $s2, 4($sp)
    sw   $t0, 0($sp)

    li   $s2, 0              # Number of lines removed in this move
    li   $s0, ALTO
    addi $s0, $s0, -1        # Start at the last playable row (ALTO - 1)

check_row_loop:
    bge  $s0, $zero, continue_check_row_loop # Ensure we don't check negative rows
    j    check_lines_done                   # Exit if we've gone past the top

continue_check_row_loop:
    li   $s1, 0              # x = 0

check_col_loop:
    move $t1, $s0
    li   $t2, ANCHO
    mul  $t1, $t1, $t2
    add  $t1, $t1, $s1
    sll  $t1, $t1, 2
    la   $t2, PLAYFIELD
    add  $t2, $t2, $t1
    lw   $t3, 0($t2)
    beq  $t3, $zero, line_not_full
    addi $s1, $s1, 1
    li   $t2, ANCHO
    blt  $s1, $t2, check_col_loop

line_is_full:
    addi $s2, $s2, 1         # Count the line; score the whole move afterward

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
    # Publish the total once, after all consecutive full rows have been removed.
    la   $t0, LINES_CLEARED
    lw   $t1, 0($t0)
    addu $t1, $t1, $s2
    sw   $t1, 0($t0)
    move $v0, $s2            # Return the per-move count before restoring $s2

    # --- Epilogue: Restore registers ---
    lw   $t0, 0($sp)
    lw   $s2, 4($sp)
    lw   $s1, 8($sp)
    lw   $s0, 12($sp)
    lw   $ra, 16($sp)
    addi $sp, $sp, 20
    jr   $ra

#-----------------------------------------------------------------------------
# log_update_score: awards points for the complete set of lines in one move.
# Arguments: $a0 = cleared lines (0..4), $a1 = scoring level (1..10).
# Returns: $v0 = awarded points, $v1 = 0 on success or 1 for invalid arguments.
# Invalid arguments award zero points and leave SCORE unchanged.
# Preserves: $a0-$a3, $s0-$s7, $sp and $ra. Modifies: $v0-$v1, $t0-$t2.
# The core supplies the agreed scoring level and calls this procedure once per
# completed move; no level, speed, victory or line-total state is changed here.
#-----------------------------------------------------------------------------
log_update_score:
    li   $v0, 0
    li   $v1, 1              # Assume invalid arguments until both are checked
    blt  $a0, $zero, log_score_done
    li   $t0, 4
    bgt  $a0, $t0, log_score_done
    li   $t0, 1
    blt  $a1, $t0, log_score_done
    li   $t0, 10
    bgt  $a1, $t0, log_score_done

    li   $v1, 0
    beq  $a0, $zero, log_score_done
    li   $t0, 100
    beq  $a0, 1, log_score_apply
    li   $t0, 300
    beq  $a0, 2, log_score_apply
    li   $t0, 500
    beq  $a0, 3, log_score_apply
    li   $t0, 800

log_score_apply:
    mul  $v0, $t0, $a1       # Points = base value for the whole move * level
    la   $t1, SCORE
    lw   $t2, 0($t1)
    addu $t2, $t2, $v0
    sw   $t2, 0($t1)

log_score_done:
    jr   $ra
    
# update_high_score: updates HIGH_SCORE only when SCORE is greater.
# Arguments: none; reads the global SCORE and HIGH_SCORE variables.
# Returns: none. Effect: stores a new record when needed.
# Modifies: $t0-$t3 (addresses and score values).
# Preserves: $s0-$s7, $sp and $ra; makes no procedure calls.
update_high_score:
    la   $t0, SCORE
    lw   $t2, 0($t0) # $t2 = current score

    la   $t1, HIGH_SCORE
    lw   $t3, 0($t1) # $t3 = current high score

    bgt  $t2, $t3, new_high_score # Update only for a strictly greater score
    jr   $ra                     # Keep the record if the score is equal or lower

new_high_score:
    sw   $t2, 0($t1) # Update HIGH_SCORE with the new score
    jr   $ra
    
# clear_top_row: clears the top row (y=0) of the playfield.
# Arguments: none; uses the global PLAYFIELD array.
# Returns: none. Effect: writes zero to each cell of the first row.
# Modifies: $t0 (counter), $t1 (zero) and $t2 (cell address).
# Preserves: $s0-$s7, $sp and $ra; makes no procedure calls.
clear_top_row:
    la   $t2, PLAYFIELD  # Address of the first cell in the playfield
    li   $t0, ANCHO      # Number of playable cells per row
    li   $t1, 0          # Zero represents an empty cell

clear_top_row_loop:
    sw   $t1, 0($t2)     # Store zero in the current cell
    addi $t2, $t2, 4     # Advance four bytes to the next cell
    addi $t0, $t0, -1    # Decrement the remaining cell count
    bne  $t0, $zero, clear_top_row_loop # Repeat until the row is cleared

    jr   $ra  

#-----------------------------------------------------------------------------
# log_hard_drop: drops and locks the active piece at its last valid position.
# Arguments: none; reads CURRENT_PIECE_TYPE, CURRENT_PIECE_ORIENTATION and X/Y.
# Returns: $v0 = rows descended, $v1 = 0 on success or 1 for an invalid piece.
# Success with zero distance is valid: a resting piece is locked immediately.
# Preserves: $s0-$s7, $sp and $ra. Modifies: $a0-$a2, $v0-$v1 and temporaries.
# On rejection, PLAYFIELD and the active piece state remain unchanged.
# On success, writes piece IDs to PLAYFIELD and updates CURRENT_PIECE_Y only.
# Does not clear lines, award points or spawn a piece. The core must process
# those actions once after success and skip gravity for the rest of that frame.
# Call only while a piece is active. An immediate repeat before line processing
# is rejected because the locked cells already occupy the current position.
#-----------------------------------------------------------------------------
log_hard_drop:
    addi $sp, $sp, -24
    sw   $ra, 20($sp)
    sw   $s0, 16($sp)
    sw   $s1, 12($sp)
    sw   $s2, 8($sp)
    sw   $s3, 4($sp)

    # Validate both table indices before loading the current shape pointer.
    lw   $t0, CURRENT_PIECE_TYPE
    blt  $t0, $zero, log_hard_drop_fail
    li   $t2, 7
    bge  $t0, $t2, log_hard_drop_fail
    lw   $t1, CURRENT_PIECE_ORIENTATION
    blt  $t1, $zero, log_hard_drop_fail
    li   $t2, 4
    bge  $t1, $t2, log_hard_drop_fail
    sll  $t0, $t0, 2
    la   $t2, MASTER_SHAPE_TABLE
    addu $t2, $t2, $t0
    lw   $t2, 0($t2)
    sll  $t1, $t1, 2
    addu $t2, $t2, $t1
    lw   $s0, 0($t2)         # Shape pointer survives all procedure calls
    lw   $s1, CURRENT_PIECE_X
    lw   $s2, CURRENT_PIECE_Y
    move $s3, $s2            # Original Y, used to calculate the drop distance

    # Reject blocked spawns, out-of-bounds pieces and already locked pieces.
    move $a0, $s0
    move $a1, $s1
    move $a2, $s2
    jal  check_collision
    bne  $v0, $zero, log_hard_drop_fail

log_hard_drop_step:
    move $a0, $s0
    move $a1, $s1
    addi $a2, $s2, 1         # Check only the next row; never jump over obstacles
    jal  check_collision
    bne  $v0, $zero, log_hard_drop_lock
    addi $s2, $s2, 1         # This candidate becomes the last valid Y
    j    log_hard_drop_step

log_hard_drop_lock:
    move $a0, $s0
    move $a1, $s1
    move $a2, $s2
    jal  freeze_piece
    bne  $v0, $zero, log_hard_drop_fail
    sw   $s2, CURRENT_PIECE_Y # Publish the position only after a successful lock
    subu $v0, $s2, $s3
    li   $v1, 0
    j    log_hard_drop_done

log_hard_drop_fail:
    li   $v0, 0
    li   $v1, 1

log_hard_drop_done:
    lw   $s3, 4($sp)
    lw   $s2, 8($sp)
    lw   $s1, 12($sp)
    lw   $s0, 16($sp)
    lw   $ra, 20($sp)
    addi $sp, $sp, 24
    jr   $ra

#-----------------------------------------------------------------------------
# log_rotate_with_kick: tries the next orientation at X, X-1, then X+1.
# Arguments: none; uses the active piece globals and MASTER_SHAPE_TABLE.
# Returns: $v0 = 1 if applied, 0 if cancelled or the initial state is invalid.
#          $v1 = accepted horizontal offset (-1, 0 or 1); zero on cancellation.
# Preserves: $s0-$s7, $sp and $ra. Modifies: $a0-$a2, $v0-$v1 and temporaries.
# Updates CURRENT_PIECE_X and CURRENT_PIECE_ORIENTATION only on success.
# Never changes PLAYFIELD, the piece Y/type/color, score or line totals.
# Each candidate uses check_collision; no vertical or multi-cell kicks occur.
# The core should call this instead of applying its old rotation afterward.
#-----------------------------------------------------------------------------
log_rotate_with_kick:
    addi $sp, $sp, -24
    sw   $ra, 20($sp)
    sw   $s0, 16($sp)
    sw   $s1, 12($sp)
    sw   $s2, 8($sp)
    sw   $s3, 4($sp)
    sw   $s4, 0($sp)

    lw   $t0, CURRENT_PIECE_TYPE
    blt  $t0, $zero, log_rotate_cancel
    li   $t2, 7
    bge  $t0, $t2, log_rotate_cancel
    lw   $t1, CURRENT_PIECE_ORIENTATION
    blt  $t1, $zero, log_rotate_cancel
    li   $t2, 4
    bge  $t1, $t2, log_rotate_cancel

    sll  $t0, $t0, 2
    la   $t2, MASTER_SHAPE_TABLE
    addu $t2, $t2, $t0
    lw   $s0, 0($t2)         # Rotation table pointer, kept across the first call
    sll  $t2, $t1, 2
    addu $t2, $s0, $t2
    lw   $a0, 0($t2)         # Current shape must be valid before rotating it
    addi $s3, $t1, 1
    andi $s3, $s3, 3         # Next orientation = (current + 1) modulo 4
    lw   $s1, CURRENT_PIECE_X
    lw   $s2, CURRENT_PIECE_Y
    move $a1, $s1
    move $a2, $s2
    jal  check_collision
    bne  $v0, $zero, log_rotate_cancel

    sll  $t0, $s3, 2
    addu $t0, $s0, $t0
    lw   $s0, 0($t0)         # Candidate shape pointer for all three attempts

    # Try the new orientation without moving the piece.
    move $s4, $s1
    move $a0, $s0
    move $a1, $s4
    move $a2, $s2
    jal  check_collision
    beq  $v0, $zero, log_rotate_commit

    # Both kicks are measured from the original X, not the preceding attempt.
    addi $s4, $s1, -1
    move $a0, $s0
    move $a1, $s4
    move $a2, $s2
    jal  check_collision
    beq  $v0, $zero, log_rotate_commit

    addi $s4, $s1, 1
    move $a0, $s0
    move $a1, $s4
    move $a2, $s2
    jal  check_collision
    bne  $v0, $zero, log_rotate_cancel

log_rotate_commit:
    sw   $s4, CURRENT_PIECE_X
    sw   $s3, CURRENT_PIECE_ORIENTATION
    li   $v0, 1
    subu $v1, $s4, $s1
    j    log_rotate_done

log_rotate_cancel:
    li   $v0, 0
    li   $v1, 0

log_rotate_done:
    lw   $s4, 0($sp)
    lw   $s3, 4($sp)
    lw   $s2, 8($sp)
    lw   $s1, 12($sp)
    lw   $s0, 16($sp)
    lw   $ra, 20($sp)
    addi $sp, $sp, 24
    jr   $ra
