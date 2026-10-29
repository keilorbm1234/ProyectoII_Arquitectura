# main.asm - Keilor
# Punto de entrada. En MARS se abre y se ensambla SOLO este archivo.

.include "macros.asm"     # 1. macros primero
.include "datos.asm"      # 2. constantes y variables
.include "piezas.asm"
.include "fuente.asm"

.text
.globl main
main:
    # --- One-Time Game Setup ---
    jal  initialize_playfield
    jal  draw_scene

    # --- NEW: Initialize Gravity Timer ---
    # We need to set the initial time so the first drop doesn't happen instantly.
    li   $v0, 30         # Syscall 30: System Time
    syscall              # Get current time in $a0
    la   $t0, LAST_GRAVITY_TIME
    sw   $a0, 0($t0)     # Store it as the initial time

    # --- Spawn the first piece ---
    jal  spawn_new_piece

#-----------------------------------------------------------------------------

# GENERAL NOTES

# 1. 0x00RRGGBB, where RR, GG, and BB are the hexadecimal values for
#    the red, green, and blue components.
#
#    Black: 0x00000000 
#    White: 0x00FFFFFF
#    Dark Grey: 0x001c1c1c
#    Blue: 0x000000FF 

# 2. 32x32 grid of units (256 pixels / 8 pixels per unit = 32)

#-----------------------------------------------------------------------------

# WHAT ARE TEMPORARIES DOING

# t0 - store the address of the current unit im looking at 
# t1 - stores the current color 
# t2 - Counter for units i need to pain
# t3 - will store tempories (starting wall address)

#-----------------------------------------------------------------------------


## MODIFIED: game_loop
game_loop:
    ## NEW: Check if the game is over. If so, branch to the game over loop.
    la   $t0, GAME_OVER_FLAG
    lw   $t0, 0($t0)
    bne  $t0, $zero, game_over_loop

    # Erase the screen by redrawing the entire static scene
    jal  draw_scene

    # Display the current score and the high score
    jal  draw_score
    jal  draw_high_score      ## NEW: Call the high score drawing function

    # --- Draw the current tetromino ---
    # (The rest of the original drawing logic remains the same)
    la   $s0, CURRENT_PIECE_TYPE
    lw   $s0, 0($s0)
    la   $s1, CURRENT_PIECE_ORIENTATION
        lw   $s1, 0($s1)

    sll  $t0, $s0, 2
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)
    sll  $t0, $s1, 2
    add  $a0, $t1, $t0
    lw   $a0, 0($a0)

    la   $t0, CURRENT_PIECE_X
    lw   $a1, 0($t0)
    la   $t0, CURRENT_PIECE_Y
    lw   $a2, 0($t0)

    jal  draw_tetromino

    # Handle player input and gravity
    jal  handle_input
    jal  apply_gravity

    # Frame delay
    li   $v0, 32
    li   $a0, 100
    syscall

    b    game_loop

# 3. procedimientos al final
.include "nucleo.asm"
.include "logica.asm"
.include "graficos.asm"
