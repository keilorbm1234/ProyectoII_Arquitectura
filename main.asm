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
    la   $t0, ESTADO
    lw   $t0, 0($t0)              # $t0 = estado actual

    li   $t1, EST_JUGANDO
    beq  $t0, $t1, gl_jugando
    li   $t1, EST_GAMEOVER
    beq  $t0, $t1, game_over_loop # temporal: lo cambiamos en el 4.4
    j    gl_fin                   # menú, pausa y victoria: aún no hacen nada

gl_jugando:
    jal  nuc_estado_jugando

gl_fin:
    li   $v0, 32                  # esperar 100 ms
    li   $a0, 100
    syscall
    b    game_loop

# 3. procedimientos al final
.include "nucleo.asm"
.include "logica.asm"
.include "graficos.asm"
