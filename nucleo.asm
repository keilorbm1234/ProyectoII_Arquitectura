# nucleo.asm - Keilor
# Teclado, tiempo y gravedad, estados, niveles, pausa y reinicio. Prefijo nuc_
.text

#-----------------------------------------------------------------------------
# nuc_leer_tecla: revisa el Keyboard MMIO.
# Retorna: $v0 = código ASCII de la tecla, o 0 si no hay tecla nueva.
# Procedimiento hoja (no llama a nadie): no necesita guardar $ra.
#-----------------------------------------------------------------------------
nuc_leer_tecla:
    la   $t8, ADDR_KBRD
    lw   $t8, 0($t8)          # $t8 = 0xffff0000
    lw   $t9, 0($t8)          # $t9 = 1 si hay tecla nueva
    beq  $t9, $zero, nuc_lt_nada
    lw   $v0, 4($t8)          # $v0 = código de la tecla
    jr   $ra
nuc_lt_nada:
    li   $v0, 0
    jr   $ra

#-----------------------------------------------------------------------------
# nuc_estado_jugando: un ciclo del juego (dibujar, leer teclado, gravedad).
#-----------------------------------------------------------------------------
nuc_estado_jugando:
    addi $sp, $sp, -12
    sw   $ra, 8($sp)
    sw   $s0, 4($sp)
    sw   $s1, 0($sp)

    jal  draw_scene              # fondo y bloques fijados
    jal  draw_score
    jal  draw_high_score
    la   $t0, SIGUIENTE_PIEZA
    lw   $a0, 0($t0)
    jal  gfx_dibujar_siguiente   # vista previa de la proxima pieza
    la   $t0, NIVEL
    lw   $a0, 0($t0)
    jal  gfx_dibujar_nivel       # "NV" y el numero de nivel
    jal  gfx_dibujar_total_lineas # "LN" y las lineas borradas

    # --- Dibujar la pieza actual ---
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
    lw   $a0, 0($a0)             # $a0 = forma de la pieza

    la   $t0, CURRENT_PIECE_X
    lw   $a1, 0($t0)
    la   $t0, CURRENT_PIECE_Y
    lw   $a2, 0($t0)
    jal  draw_tetromino

    jal  handle_input
    jal  apply_gravity

    lw   $s1, 0($sp)
    lw   $s0, 4($sp)
    lw   $ra, 8($sp)
    addi $sp, $sp, 12
    jr   $ra
#-----------------------------------------------------------------------------
# handle_input: W rota (wall kick), A/D mueven, S baja, espacio cae, P pausa, Q sale.
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

    jal  nuc_leer_tecla
    beq  $v0, $zero, input_done   # no hay tecla: salir
    move $t5, $v0                 # $t5 = tecla (el resto del código usa $t5)

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

    # --- W: rotar con corrimiento contra la pared (logica de Andrey) ---
    li   $t0, TECLA_W
    bne  $t5, $t0, check_a
    jal  log_rotate_with_kick     # prueba X, X-1 y X+1; guarda X y orientacion si puede
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
    bne  $t5, $t0, check_espacio
    move $s4, $a2 # Save original Y
    addi $a2, $a2, 1
    jal  check_collision
    bne  $v0, $zero, land_piece
    sw   $a2, 0($s3)
    j    input_done

land_piece:
    move $a2, $s4 # Restore original Y
    jal  freeze_piece             # guarda tipo+1 en el tablero; $v0 = 1 si la rechaza
    bne  $v0, $zero, input_done
    jal  nuc_finalizar_jugada     # lineas, puntaje, nivel y pieza nueva
    j    input_done

check_espacio:
    li   $t0, TECLA_ESPACIO
    bne  $t5, $t0, check_q
    jal  log_hard_drop            # baja la pieza hasta chocar y la fija
    bne  $v1, $zero, input_done   # $v1 = 1: no se pudo fijar
    jal  nuc_finalizar_jugada     # la pieza ya esta fijada: no llamar freeze_piece otra vez
    j    input_done
    
check_q:
    li   $t0, TECLA_Q
    bne $t5, $t0, check_p
    jal  exit_game
    
check_p:
    li   $t0, TECLA_P
    bne  $t5, $t0, input_done
    li   $t0, EST_PAUSA
    la   $t1, ESTADO
    sw   $t0, 0($t1)             # ESTADO = PAUSA

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
    bne  $v0, $zero, gravity_exit
    jal  nuc_finalizar_jugada     # lineas, puntaje, nivel y pieza nueva

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
# nuc_finalizar_jugada: cierra una jugada despues de fijar la pieza
# (con S, con la gravedad o con la caida instantanea). Se llama UNA vez.
#   1. check_and_clear_lines borra las lineas llenas y devuelve cuantas ($v0)
#      (ya las suma a LINES_CLEARED).
#   2. log_update_score da 100/300/500/800 x nivel. Se usa el nivel que
#      habia ANTES de subir.
#   3. update_speed recalcula NIVEL y velocidad, o pasa a VICTORIA.
#   4. Si no gano, reinicia el temporizador y saca la pieza siguiente.
# Argumentos: ninguno. Retorno: ninguno. Preserva: $ra
#-----------------------------------------------------------------------------
nuc_finalizar_jugada:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    jal  check_and_clear_lines    # $v0 = lineas borradas en esta jugada
    move $a0, $v0                 # $a0 = lineas (0..4)
    la   $t0, NIVEL
    lw   $a1, 0($t0)              # $a1 = nivel actual (1..10)
    jal  log_update_score         # suma los puntos a SCORE
    jal  update_speed             # nivel, velocidad o VICTORIA

    la   $t0, ESTADO
    lw   $t0, 0($t0)
    li   $t1, EST_VICTORIA
    bne  $t0, $t1, nuc_fj_seguir
    jal  update_high_score        # gano: guardar el record y no sacar pieza
    j    nuc_fj_fin

nuc_fj_seguir:
    li   $v0, 30                  # reiniciar el temporizador de gravedad para
    syscall                       # que la pieza nueva no caiga de inmediato
    la   $t0, LAST_GRAVITY_TIME
    sw   $a0, 0($t0)
    jal  spawn_new_piece

nuc_fj_fin:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra

#-----------------------------------------------------------------------------
# nuc_pieza_aleatoria: sortea un tipo de pieza.
# Retorna: $v0 = tipo al azar (0=I, 1=J, 2=L, 3=O, 4=S, 5=T, 6=Z)
# Procedimiento hoja: solo modifica $v0, $a0 y $a1.
#-----------------------------------------------------------------------------
nuc_pieza_aleatoria:
    li   $v0, 42                  # syscall 42: entero al azar en [0, $a1)
    li   $a0, 0
    li   $a1, 7
    syscall                       # $a0 = 0 a 6
    move $v0, $a0
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

    # --- La pieza nueva es la que estaba como SIGUIENTE_PIEZA ---
    la   $t3, SIGUIENTE_PIEZA
    lw   $t4, 0($t3)
    bgez $t4, spawn_hay_siguiente # -1 = primera pieza: todavia no hay siguiente
    jal  nuc_pieza_aleatoria
    move $t4, $v0
spawn_hay_siguiente:
    jal  nuc_pieza_aleatoria      # sortear la proxima pieza (Jorge la dibuja)
    la   $t3, SIGUIENTE_PIEZA
    sw   $v0, 0($t3)
    move $a0, $t4                 # $a0 = tipo de la pieza nueva

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
    li   $t0, APARICION_X             # columna de aparicion (datos.asm)
    la   $t1, CURRENT_PIECE_X
    sw   $t0, 0($t1)

    li   $t0, APARICION_Y             # fila de aparicion (datos.asm)
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
    li   $t0, EST_GAMEOVER
    la   $t1, ESTADO
    sw   $t0, 0($t1)             # ESTADO = GAME OVER
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
# update_speed: calcula el nivel según las líneas borradas y pone la
# velocidad de ese nivel. Al completar NIVEL_MAX pasa a VICTORIA.
# Procedimiento hoja: solo usa $t, no necesita pila.
#-----------------------------------------------------------------------------
update_speed:
    la   $t0, LINES_CLEARED
    lw   $t0, 0($t0)              # $t0 = líneas totales
    li   $t1, LINEAS_POR_NIVEL
    div  $t0, $t1
    mflo $t2                      # $t2 = niveles completados (líneas / 5)

    li   $t3, NIVEL_MAX
    blt  $t2, $t3, us_seguir      # todavía no completa el nivel 10
    li   $t0, EST_VICTORIA        # ¡ganó!
    la   $t1, ESTADO
    sw   $t0, 0($t1)
    jr   $ra

us_seguir:
    addi $t2, $t2, 1              # nivel = completados + 1
    la   $t3, NIVEL
    sw   $t2, 0($t3)

    addi $t2, $t2, -1             # posición en la tabla = nivel - 1
    sll  $t2, $t2, 2              # × 4 bytes por palabra
    la   $t3, TABLA_VELOCIDAD
    add  $t3, $t3, $t2
    lw   $t4, 0($t3)              # $t4 = ms de este nivel
    la   $t3, GRAVITY_INTERVAL
    sw   $t4, 0($t3)
    jr   $ra


#-----------------------------------------------------------------------------
# nuc_estado_gameover: muestra la pantalla de fin. R reinicia, Q sale.
#-----------------------------------------------------------------------------
nuc_estado_gameover:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    jal  draw_game_over_screen
    jal  nuc_leer_tecla          # $v0 = tecla o 0
    li   $t0, TECLA_R
    beq  $v0, $t0, nuc_go_reiniciar
    li   $t0, TECLA_Q
    beq  $v0, $t0, exit_game     # exit_game termina el programa
    j    nuc_go_fin

nuc_go_reiniciar:
    jal  restart_game            # deja ESTADO = JUGANDO

nuc_go_fin:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra

#-----------------------------------------------------------------------------
# nuc_estado_pausa: el juego queda congelado. P reanuda, Q sale.
#-----------------------------------------------------------------------------
nuc_estado_pausa:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    jal  gfx_pantalla_pausa
    jal  nuc_leer_tecla
    li   $t0, TECLA_P
    beq  $v0, $t0, nuc_pa_reanudar
    li   $t0, TECLA_Q
    beq  $v0, $t0, exit_game
    j    nuc_pa_fin

nuc_pa_reanudar:
    li   $t0, EST_JUGANDO
    la   $t1, ESTADO
    sw   $t0, 0($t1)             # ESTADO = JUGANDO
    li   $v0, 30                 # reiniciar el reloj de la gravedad
    syscall                      # para que la pieza no caiga de golpe
    la   $t0, LAST_GRAVITY_TIME
    sw   $a0, 0($t0)

nuc_pa_fin:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra

#-----------------------------------------------------------------------------
# nuc_estado_menu: espera una tecla para empezar. Q sale.
# (Jorge dibujará aquí la pantalla de menú)
#-----------------------------------------------------------------------------
nuc_estado_menu:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    jal  gfx_pantalla_menu
    jal  nuc_leer_tecla
    beq  $v0, $zero, nuc_me_fin  # sin tecla: seguir esperando
    li   $t0, TECLA_Q
    beq  $v0, $t0, exit_game
    jal  restart_game            # cualquier otra tecla: partida nueva

nuc_me_fin:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra

#-----------------------------------------------------------------------------
# nuc_estado_victoria: ganaste. R juega de nuevo, Q sale.
# (Jorge dibujará aquí la pantalla de victoria)
#-----------------------------------------------------------------------------
nuc_estado_victoria:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    jal  gfx_pantalla_victoria
    jal  nuc_leer_tecla
    li   $t0, TECLA_R
    beq  $v0, $t0, nuc_vi_reiniciar
    li   $t0, TECLA_Q
    beq  $v0, $t0, exit_game
    j    nuc_vi_fin
nuc_vi_reiniciar:
    jal  restart_game
nuc_vi_fin:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra

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

    # Líneas = 0, así que esto deja nivel 1 y su velocidad
    jal  update_speed

    # Reset the gravity timer (prevents instant drop on restart)
    li   $v0, 30
    syscall
    la   $t0, LAST_GRAVITY_TIME
    sw   $a0, 0($t0)

    # Volver al estado JUGANDO
    li   $t0, EST_JUGANDO
    la   $t1, ESTADO
    sw   $t0, 0($t1)

    # Clear the playfield
    jal initialize_playfield
    jal  spawn_new_piece          # pieza nueva sobre el tablero vacio

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