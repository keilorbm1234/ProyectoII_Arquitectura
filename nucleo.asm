# nucleo.asm - Keilor
# Teclado, tiempo y gravedad, estados, niveles, pausa y reinicio. Prefijo nuc_
.text

#-----------------------------------------------------------------------------
# handle_input: Handles movement and safe rotation.
#-----------------------------------------------------------------------------
handle_input:
    # --- Prologue ---
    addi $sp, $sp, -24
    sw   $ra, 20($sp)
    sw   $s0, 16($sp)
    sw   $s1, 12($sp)
    sw   $s2, 8($sp)
    sw   $s3, 4($sp)
    sw   $s4, 0($sp)

    la   $t8, ADDR_KBRD
    lw   $t8, 0($t8)         # $t8 = 0xffff0000 (control del teclado)
    lw   $t9, 0($t8)         # $t9 = 1 si hay tecla nueva
    beq  $t9, $zero, input_done

    lw   $t5, 4($t8)         # $t5 = código ASCII de la tecla

    # --- Load current piece state ---
    la   $s0, CURRENT_PIECE_TYPE
    lw   $s0, 0($s0)
    la   $s1, CURRENT_PIECE_ORIENTATION
    lw   $s1, 0($s1)
    la   $s2, CURRENT_PIECE_X
    lw   $a1, 0($s2)
    la   $s3, CURRENT_PIECE_Y
    lw   $a2, 0($s3)

    # Find the pointer to the current shape data and put in $a0
    sll  $t0, $s0, 2
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)
    sll  $t0, $s1, 2
    add  $a0, $t1, $t0
    lw   $a0, 0($a0)

    # --- Check for 'w' (rotate) ---
    li   $t0, TECLA_W
    bne  $t5, $t0, check_a

    # Calculate next orientation: (current + 1) % 4
    addi $s4, $s1, 1
    li   $t0, 4
    rem  $s4, $s4, $t0 # $s4 = next_orientation

    # Get the shape data for the NEXT orientation
    sll  $t0, $s0, 2
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)
    sll  $t0, $s4, 2
    add  $a0, $t1, $t0
    lw   $a0, 0($a0) # $a0 now points to the shape data for the ROTATED piece

    # Check for collision with the rotated shape
    jal  check_collision
    bne  $v0, $zero, input_done      # If collision, do nothing
    
    # No collision, so update the orientation
    la   $t0, CURRENT_PIECE_ORIENTATION
    sw   $s4, 0($t0)
    j    input_done

check_a:
    li   $t0, TECLA_A 
    bne  $t5, $t0, check_d
    addi $a1, $a1, -1
    jal  check_collision
    bne  $v0, $zero, input_done
    sw   $a1, 0($s2)
    j    input_done

check_d:
    li   $t0, TECLA_D
    bne  $t5, $t0, check_s
    addi $a1, $a1, 1
    jal  check_collision
    bne  $v0, $zero, input_done
    sw   $a1, 0($s2)
    j    input_done

check_s:
    li   $t0, TECLA_S
    bne  $t5, $t0, check_q
    move $s4, $a2 # Save original Y
    addi $a2, $a2, 1
    jal  check_collision
    bne  $v0, $zero, land_piece
    sw   $a2, 0($s3)
    j    input_done

land_piece:
    move $a2, $s4 # Restore original Y
    jal  freeze_piece
    jal  check_and_clear_lines
    jal  spawn_new_piece
    j    input_done
    
check_q:
    li   $t0, TECLA_Q
    bne  $t5, $t0, input_done
    jal  exit_game

input_done:
    # --- Epilogue ---
    lw   $s4, 0($sp)
    lw   $s3, 4($sp)
    lw   $s2, 8($sp)
    lw   $s1, 12($sp)
    lw   $s0, 16($sp)
    lw   $ra, 20($sp)
    addi $sp, $sp, 24
    jr   $ra

#-----------------------------------------------------------------------------
# --- NEW ---
# apply_gravity: Automatically moves the piece down every second based on
#                the system clock.
#-----------------------------------------------------------------------------
apply_gravity:
    # --- Prologue: Save registers we will modify ---
    addi $sp, $sp, -28
    sw   $ra, 24($sp)
    sw   $s0, 20($sp)
    sw   $s1, 16($sp)
    sw   $s2, 12($sp)
    sw   $s3, 8($sp)
    sw   $s4, 4($sp)
    sw   $a0, 0($sp) # Save $a0 because the time syscall overwrites it

    # --- Check if one second has passed since the last drop ---
    li   $v0, 30         # Syscall 30: System Time
    syscall              # Get current time in $a0
    move $s0, $a0        # $s0 = current_time

    la   $t0, LAST_GRAVITY_TIME
    lw   $s1, 0($t0)     # $s1 = last_gravity_time

    la   $t0, GRAVITY_INTERVAL
    lw   $s2, 0($t0)     # $s2 = interval (1000)

    sub  $t0, $s0, $s1   # elapsed_time = current_time - last_gravity_time
    blt  $t0, $s2, gravity_exit # If elapsed time < interval, do nothing and exit

    # --- Time to move down! Update the timer first ---
    la   $t0, LAST_GRAVITY_TIME
    sw   $s0, 0($t0)     # last_gravity_time = current_time

    # --- Load current piece state (similar to handle_input) ---
    la   $s0, CURRENT_PIECE_TYPE
    lw   $s0, 0($s0)
    la   $s1, CURRENT_PIECE_ORIENTATION
    lw   $s1, 0($s1)
    la   $s2, CURRENT_PIECE_X
    lw   $a1, 0($s2)     # $a1 = current X
    la   $s3, CURRENT_PIECE_Y
    lw   $a2, 0($s3)     # $a2 = current Y

    # Get the pointer to the current shape data for collision check
    sll  $t0, $s0, 2
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)
    sll  $t0, $s1, 2
    add  $a0, $t1, $t0
    lw   $a0, 0($a0) # $a0 has the shape pointer

    # --- Logic to move down one step (adapted from handle_input's 's' key) ---
    move $s4, $a2          # Save original Y position in $s4
    addi $a2, $a2, 1       # Tentative new Y = current Y + 1
    
    jal  check_collision   # Check for collision at (X, new Y) with shape in $a0
    
    bne  $v0, $zero, gravity_lands_piece # If collision ($v0=1), branch to land it
    
    # No collision, so just update the Y coordinate
    sw   $a2, 0($s3)
    j    gravity_exit      # And we're done for this tick

gravity_lands_piece:
    # The piece collided with something below, so it needs to land.
    # The arguments for freeze_piece need to be (shape_ptr, X, original_Y)
    # $a0 (shape ptr) and $a1 (X) are already correct.
    # We need to use the original Y coordinate from before the downward move attempt.
    move $a2, $s4          # Restore original Y for freezing
    jal  freeze_piece
    jal  check_and_clear_lines
    jal  spawn_new_piece

gravity_exit:
    # --- Epilogue: Restore saved registers ---
    lw   $a0, 0($sp)
    lw   $s4, 4($sp)
    lw   $s3, 8($sp)
    lw   $s2, 12($sp)
    lw   $s1, 16($sp)
    lw   $s0, 20($sp)
    lw   $ra, 24($sp)
    addi $sp, $sp, 28
    jr   $ra
    
#-----------------------------------------------------------------------------
# spawn_new_piece: Randomly selects a new tetromino and resets its state.
#                  Also checks for game over (if spawn position is blocked).
#-----------------------------------------------------------------------------
spawn_new_piece:
    # --- Prologue ---
    addi $sp, $sp, -20
    sw   $ra, 16($sp)
    sw   $a0, 12($sp)  # Save input registers
    sw   $a1, 8($sp)
    sw   $a2, 4($sp)
    sw   $v0, 0($sp)

    # --- Get a random piece TYPE (0-6) ---
    li   $v0, 42          # Random syscall
    li   $a0, 0
    li   $a1, 7
    syscall               # $a0 = 0 to 6

    # Store the new piece type
    la   $t3, CURRENT_PIECE_TYPE
    sw   $a0, 0($t3)

    # --- Use the random type to get the color ---
    move $t0, $a0
    sll  $t0, $t0, 2
    la   $t1, ALL_COLORS_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)
    lw   $t2, 0($t1)
    la   $t3, CURRENT_PIECE_COLOR
    sw   $t2, 0($t3)

    # --- Reset position and orientation ---
    li   $t0, 10                      # Starting X position
    la   $t1, CURRENT_PIECE_X
    sw   $t0, 0($t1)

    li   $t0, 1                       # Starting Y position
    la   $t1, CURRENT_PIECE_Y
    sw   $t0, 0($t1)

    li   $t0, 0                       # Initial orientation
    la   $t1, CURRENT_PIECE_ORIENTATION
    sw   $t0, 0($t1)

    # --- Check for Collision Immediately After Spawn (Game Over Check) ---
    # Get shape pointer for orientation 0
    la   $t0, CURRENT_PIECE_TYPE
    lw   $t0, 0($t0)
    sll  $t0, $t0, 2
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)        # $t1 points to orientation array
    lw   $a0, 0($t1)        # $a0 = pointer to orientation 0 shape

    # Load X and Y position
    la   $t2, CURRENT_PIECE_X
    lw   $a1, 0($t2)
    la   $t2, CURRENT_PIECE_Y
    lw   $a2, 0($t2)

    # Call collision check
    jal  check_collision    # Returns 1 in $v0 if blocked

    beq  $v0, $zero, spawn_ok    # If no collision, proceed

    # --- Game Over Logic ---
    jal  update_high_score       # Optional: Save high score
    li   $t0, 1
    la   $t1, GAME_OVER_FLAG
    sw   $t0, 0($t1)             # GAME_OVER_FLAG = 1
    j    spawn_done

spawn_ok:
    # Normal continuation if no collision

spawn_done:
    # --- Epilogue ---
    lw   $v0, 0($sp)
    lw   $a2, 4($sp)
    lw   $a1, 8($sp)
    lw   $a0, 12($sp)
    lw   $ra, 16($sp)
    addi $sp, $sp, 20
    jr   $ra
    
#-----------------------------------------------------------------------------
# update_speed: Checks if the game should level up and increases gravity.
#-----------------------------------------------------------------------------
update_speed:
    # --- Prologue ---
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # --- Load required values ---
    la   $t0, LINES_CLEARED
    lw   $t0, 0($t0)      # $t0 = total lines cleared

    la   $t1, LINES_PER_LEVEL
    lw   $t1, 0($t1)      # $t1 = lines needed to level up (e.g., 5)

    # Check if LINES_CLEARED is 0 (can't divide by zero)
    beq  $t0, $zero, update_speed_exit

    # Check if LINES_CLEARED % LINES_PER_LEVEL == 0
    rem  $t2, $t0, $t1    # $t2 = remainder
    bne  $t2, $zero, update_speed_exit # If not a multiple, don't speed up

    # --- It's time to speed up! ---
    la   $t3, GRAVITY_INTERVAL
    lw   $t4, 0($t3)      # $t4 = current gravity interval

    la   $t5, MIN_GRAVITY
    lw   $t5, 0($t5)      # $t5 = minimum gravity interval

    # Don't speed up if already at max speed
    ble  $t4, $t5, update_speed_exit

    # Decrease the interval (e.g., subtract 100ms)
    addi $t4, $t4, -300
    sw   $t4, 0($t3)      # Store the new, faster interval

update_speed_exit:
    # --- Epilogue ---
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


## NEW: game_over_loop
# A separate loop that runs when the game is over. It displays the
# game over screen and waits for the player to press 'r' to retry or 'q' to quit.
game_over_loop:
    # Display the "GAME OVER" screen text
    jal draw_game_over_screen

    # Check for keyboard input
    la   $t8, ADDR_KBRD
    lw   $t8, 0($t8)
    lw   $t9, 0($t8)
    beq  $t9, $zero, wait_for_input # If no key pressed, wait

    lw   $t5, 4($t8) # Read the key press

    # Check for 'r' (retry)
    li   $t0, TECLA_R # ASCII for 'r'
    beq  $t5, $t0, do_restart

    # Check for 'q' (quit)
    li   $t0, TECLA_Q # ASCII for 'q'
    beq  $t5, $t0, exit_game

    # If another key is pressed, just keep looping
    j    wait_for_input

wait_for_input:
    # --- NEW: Add small delay to avoid CPU spinning ---
    li   $v0, 32
    li   $a0, 80
    syscall
    j    game_over_loop

do_restart:
    jal restart_game
    j game_loop # Jump back to the main game loop to start again

## NEW: restart_game
# Resets all game state variables to their initial values for a new game.
restart_game:
    # --- Prologue ---
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # Reset score and lines
    li   $t0, 0
    la   $t1, SCORE
    sw   $t0, 0($t1)
    la   $t1, LINES_CLEARED
    sw   $t0, 0($t1)

    # Reset gravity interval
    li   $t0, 1000
    la   $t1, GRAVITY_INTERVAL
    sw   $t0, 0($t1)

    # Reset the gravity timer (prevents instant drop on restart)
    li   $v0, 30
    syscall
    la   $t0, LAST_GRAVITY_TIME
    sw   $a0, 0($t0)

    # Reset the game over flag
    li   $t0, 0
    la   $t1, GAME_OVER_FLAG
    sw   $t0, 0($t1)

    # Clear the playfield
    jal initialize_playfield

    # --- Epilogue ---
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
    
#-----------------------------------------------------------------------------
# exit_game: Terminates the program.
#-----------------------------------------------------------------------------
exit_game:
    li   $v0, 10                 # Service 10 is "exit"
    syscall
