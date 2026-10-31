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

## MODIFIED: game_loop
game_loop:
    la   $t0, ESTADO
    lw   $t0, 0($t0)              # $t0 = estado actual

    li   $t1, EST_JUGANDO
    beq  $t0, $t1, gl_jugando
    li   $t1, EST_PAUSA
    beq  $t0, $t1, gl_pausa
    li   $t1, EST_GAMEOVER
    beq $t0, $t1, gl_gameover
    j    gl_fin                   # menú, pausa y victoria: aún no hacen nada

gl_jugando:
    jal  nuc_estado_jugando
    j	gl_fin
    
gl_pausa:
    jal  nuc_estado_pausa
    j    gl_fin

gl_gameover:
    jal  nuc_estado_gameover

gl_fin:
    li   $v0, 32                  # esperar 100 ms
    li   $a0, 100
    syscall
    b    game_loop

# 3. procedimientos al final
.include "nucleo.asm"
.include "logica.asm"
.include "graficos.asm"
