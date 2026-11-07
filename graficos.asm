# graficos.asm - Jorge
# Tablero, HUD, vista previa y pantallas. Prefijo gfx_
#
# Requiere (ya incluidos antes en main.asm): macros.asm, datos.asm,
# piezas.asm y fuente.asm.
#
# DISEÑO DE LA PANTALLA (32 x 32 celdas, cada una de 8x8 pixeles)
#
#      x: 0 1 .............. 12 13 14 ............... 30 31
#  y=0   +----------------------------------------------+
#        |  ENCABEZADO rojo:  "PTS" + puntaje            |   filas 0-4
#        |                    "REC" + record           |   filas 6-10
#  y=11  | |      | TABLERO 10x20 |      | SIGUIENTE     |   verde, filas 11-17
#        | |      | (x=2..11)     |      |  (vista previa)|
#  y=19  | |      |               |      | "NV" + nivel   |   verde, filas 19-31
#        | |      |               |      | "LN" + lineas  |
#  y=31  | +------ piso ---------+                       |
#        +----------------------------------------------+
#   Pared izquierda en x=1, pared derecha en x=12, piso en y=31.
#   Todo sale de las constantes .eqv de abajo y de ANCHO / ALTO.
#
# DOBLE BUFFER: todo el dibujo (gfx_pintar_celda) va a un buffer en memoria,
# gfx_sombra. Al final de cada ciclo main.asm llama a gfx_presentar, que copia
# a la pantalla solo las celdas que cambiaron: sin parpadeo y con muy pocas
# escrituras al Bitmap Display.

# ---------- Constantes de diseño ----------
.eqv GFX_TABLERO_X      2     # columna de pantalla de la celda (0,0) del tablero
.eqv GFX_TABLERO_Y      11    # fila de pantalla de la celda (0,0) del tablero
                              # (pared izq = TABLERO_X-1, pared der = TABLERO_X+ANCHO,
                              #  piso = TABLERO_Y+ALTO: se calculan en el codigo)

.eqv GFX_ETIQ_X         2     # x de las etiquetas "PTS" y "HI"
.eqv GFX_PTS_Y          0     # fila del puntaje
.eqv GFX_HI_Y           6     # fila del record

.eqv GFX_PANEL_X        14    # primera columna del panel derecho
.eqv GFX_PANEL_ANCHO    17    # ancho del panel derecho (columnas 14..30)
.eqv GFX_SIG_Y0         11    # zona "siguiente": filas 11..17
.eqv GFX_SIG_Y1         18    #   (limite exclusivo)
.eqv GFX_SIG_X          20    # esquina de la vista previa (caja de 4 de ancho)
.eqv GFX_SIG_Y          13    #   (las piezas ocupan 2 filas)
.eqv GFX_NIV_Y0         19    # zona "nivel y lineas": filas 19..31
.eqv GFX_NIV_Y1         32    #   (limite exclusivo)
.eqv GFX_NIV_Y          20    # fila de "NV" y el nivel
.eqv GFX_LIN_Y          26    # fila de "LN" y las lineas borradas
.eqv GFX_VAL_ETIQ_X     15    # x de las etiquetas NV y LN (2 letras = 7 de ancho)
.eqv GFX_VAL_NUM_X      23    # zona de los numeros: columnas 23..30
.eqv GFX_VAL_NUM_ANCHO  8

.eqv GFX_MSJ_Y          12    # primera linea de los mensajes (Game Over, pausa, victoria)
.eqv GFX_BANDA_Y0       11    # la banda negra de los mensajes cubre las filas 11..29
.eqv GFX_BANDA_Y1       30    #   (limite exclusivo); deja visible el encabezado
.eqv GFX_MENU_Y         1     # primera linea del menu

# ---------- Constantes de texto y pantalla ----------
.eqv GFX_CHAR_PASO      4     # ancho de una letra (3) + 1 de separacion
.eqv GFX_LINEA          6     # alto de una linea de texto (5) + 1 de separacion
.eqv GFX_GLIFO_ALTO     5     # filas de un glifo
.eqv GFX_GLIFO_COL0     2     # columna inicial al recorrer un glifo (3 columnas: 2,1,0)
.eqv GFX_BLOQUES        4     # celdas que forman una pieza
.eqv GFX_PANT_CELDAS    1024  # 32 * 32 celdas de la pantalla

.text

# ============================================================
# BASE DE DIBUJO
# ============================================================

# ------------------------------------------------------------
# gfx_limpiar_pantalla
# Pinta de negro todo el buffer de dibujo (se ve al llamar gfx_presentar).
# Argumentos: ninguno
# Retorno: ninguno
# Preserva: todo salvo $t0-$t2 (hoja)
# ------------------------------------------------------------
.globl gfx_limpiar_pantalla
gfx_limpiar_pantalla:
    cargar_global($t1, COLOR_BLACK)
    la   $t0, gfx_sombra
    li   $t2, GFX_PANT_CELDAS
gfx_lp_loop:
    sw   $t1, 0($t0)
    addi $t0, $t0, 4
    addi $t2, $t2, -1
    bne  $t2, $zero, gfx_lp_loop
    jr   $ra

# ------------------------------------------------------------
# gfx_presentar
# Copia a la pantalla las celdas del buffer que son distintas de las
# que ya hay en pantalla. Llamar UNA vez al final de cada ciclo del juego
# (en main.asm, en gl_fin). Sin esta llamada no se ve nada.
# Argumentos: ninguno
# Retorno: ninguno
# Preserva: todo salvo $t0-$t4 (hoja)
# ------------------------------------------------------------
.globl gfx_presentar
gfx_presentar:
    la   $t0, gfx_sombra                 # buffer de dibujo
    li   $t1, GFX_BASE                   # pantalla
    li   $t2, GFX_PANT_CELDAS
gfx_pr_loop:
    lw   $t3, 0($t0)
    lw   $t4, 0($t1)
    beq  $t3, $t4, gfx_pr_igual          # sin cambios: no escribir
    sw   $t3, 0($t1)
gfx_pr_igual:
    addi $t0, $t0, 4
    addi $t1, $t1, 4
    addi $t2, $t2, -1
    bne  $t2, $zero, gfx_pr_loop
    jr   $ra

# ------------------------------------------------------------
# gfx_color_celda
# Decide de que color va una celda de la pantalla en el fondo fijo
# (encabezado, paredes, piso, ajedrez del tablero, paneles).
# Argumentos: $a0 = x (0..31), $a1 = y (0..31)
# Retorno: $v0 = color
# Preserva: todo salvo $t0-$t5 y $v0 (hoja)
# ------------------------------------------------------------
gfx_color_celda:
    li   $t0, GFX_TABLERO_Y
    blt  $a1, $t0, gfx_cc_encabezado     # filas arriba del tablero: encabezado

    li   $t1, GFX_TABLERO_X
    addi $t2, $t1, -1                    # $t2 = x de la pared izquierda
    blt  $a0, $t2, gfx_cc_negro          # margen izquierdo
    addi $t3, $t1, ANCHO                 # $t3 = x de la pared derecha
    bgt  $a0, $t3, gfx_cc_panel          # a la derecha del tablero

    # --- columnas del tablero (paredes incluidas) ---
    beq  $a0, $t2, gfx_cc_pared
    beq  $a0, $t3, gfx_cc_pared
    addi $t4, $t0, ALTO                  # $t4 = y del piso
    beq  $a1, $t4, gfx_cc_pared
    bgt  $a1, $t4, gfx_cc_negro
    add  $t5, $a0, $a1                   # interior: ajedrez
    andi $t5, $t5, 1
    beq  $t5, $zero, gfx_cc_oscuro
    cargar_global($v0, COLOR_BG_GRAY_LIGHT)
    j    gfx_cc_fin
gfx_cc_oscuro:
    cargar_global($v0, COLOR_BG_GREY_DARK)
    j    gfx_cc_fin

gfx_cc_panel:
    li   $t1, GFX_PANEL_X
    blt  $a0, $t1, gfx_cc_negro
    addi $t1, $t1, GFX_PANEL_ANCHO
    bge  $a0, $t1, gfx_cc_negro         # fuera del panel (derecha)
    li   $t1, GFX_SIG_Y1
    blt  $a1, $t1, gfx_cc_verde         # zona "siguiente"
    li   $t1, GFX_NIV_Y0
    blt  $a1, $t1, gfx_cc_negro         # separacion entre zonas
    li   $t1, GFX_NIV_Y1
    blt  $a1, $t1, gfx_cc_verde         # zona "nivel"
    j    gfx_cc_negro

gfx_cc_encabezado:
    cargar_global($v0, COLOR_PANEL_SCORE)
    j    gfx_cc_fin
gfx_cc_pared:
    cargar_global($v0, COLOR_BG_WALL)
    j    gfx_cc_fin
gfx_cc_verde:
    cargar_global($v0, COLOR_PANEL_NEXT)
    j    gfx_cc_fin
gfx_cc_negro:
    cargar_global($v0, COLOR_BLACK)
gfx_cc_fin:
    jr   $ra

# ------------------------------------------------------------
# gfx_dibujar_bloques_fijos
# Pinta las celdas ocupadas del tablero (PLAYFIELD, ANCHO x ALTO,
# indice = fila * ANCHO + columna). Cada celda guarda 0 (vacia) o el
# tipo de pieza + 1 (1..7), y se pinta con el color de esa pieza.
# Argumentos: ninguno
# Retorno: ninguno
# Preserva: $ra, $s0-$s3
# ------------------------------------------------------------
gfx_dibujar_bloques_fijos:
    guardar_ra_s0_s1_s2_s3
    la   $s0, PLAYFIELD                  # puntero a la celda actual
    li   $s1, 0                          # fila
gfx_bf_fila:
    li   $s2, 0                          # columna
gfx_bf_col:
    lw   $t0, 0($s0)
    beq  $t0, $zero, gfx_bf_vacia
    addi $t0, $t0, -1                    # tipo de pieza (0..6)
    sll  $t0, $t0, 2
    la   $t3, ALL_COLORS_TABLE
    add  $t3, $t3, $t0
    lw   $t3, 0($t3)                     # direccion de la variable de color
    lw   $s3, 0($t3)                     # $s3 = color de esa pieza
    addi $t1, $s2, GFX_TABLERO_X         # x en pantalla
    addi $t2, $s1, GFX_TABLERO_Y         # y en pantalla
    gfx_pintar_celda($t1, $t2, $s3)
gfx_bf_vacia:
    addi $s0, $s0, 4
    addi $s2, $s2, 1
    blt  $s2, ANCHO, gfx_bf_col
    addi $s1, $s1, 1
    blt  $s1, ALTO, gfx_bf_fila
    restaurar_ra_s0_s1_s2_s3
    jr   $ra

# ------------------------------------------------------------
# draw_scene
# Dibuja el fondo fijo (encabezado, tablero, paneles) y los bloques
# ya fijados. No dibuja la pieza activa ni los numeros.
# Argumentos: ninguno
# Retorno: ninguno
# Preserva: $ra, $s0, $s1
# ------------------------------------------------------------
.globl draw_scene
draw_scene:
    guardar_ra_s0_s1
    li   $s1, 0                          # y
gfx_ds_y:
    li   $s0, 0                          # x
gfx_ds_x:
    move $a0, $s0
    move $a1, $s1
    jal  gfx_color_celda                 # $v0 = color de la celda
    gfx_pintar_celda($s0, $s1, $v0)
    addi $s0, $s0, 1
    blt  $s0, GFX_LADO, gfx_ds_x
    addi $s1, $s1, 1
    blt  $s1, GFX_LADO, gfx_ds_y
    jal  gfx_dibujar_bloques_fijos
    restaurar_ra_s0_s1
    jr   $ra

# ============================================================
# PIEZAS
# ============================================================

# ------------------------------------------------------------
# gfx_dibujar_pieza
# Dibuja las 4 celdas de una pieza en coordenadas de PANTALLA.
# Argumentos: $a0 = direccion de la forma (4 pares dx, dy)
#             $a1 = x de pantalla, $a2 = y de pantalla, $a3 = color
# Retorno: ninguno
# Preserva: todo salvo $t2-$t7 y $t9 (hoja)
# ------------------------------------------------------------
gfx_dibujar_pieza:
    move $t7, $a0
    li   $t2, GFX_BLOQUES
gfx_dp_loop:
    lw   $t3, 0($t7)                     # dx
    lw   $t4, 4($t7)                     # dy
    add  $t5, $a1, $t3
    add  $t6, $a2, $t4
    gfx_pintar_celda($t5, $t6, $a3)
    addi $t7, $t7, 8
    addi $t2, $t2, -1
    bne  $t2, $zero, gfx_dp_loop
    jr   $ra

# ------------------------------------------------------------
# draw_tetromino
# Dibuja la pieza activa con su color (CURRENT_PIECE_COLOR).
# Argumentos: $a0 = direccion de la forma
#             $a1 = x en el tablero (0..ANCHO-1), $a2 = y en el tablero
# Retorno: ninguno
# Preserva: $ra
# ------------------------------------------------------------
.globl draw_tetromino
draw_tetromino:
    guardar_ra
    addi $a1, $a1, GFX_TABLERO_X
    addi $a2, $a2, GFX_TABLERO_Y
    cargar_global($a3, CURRENT_PIECE_COLOR)
    jal  gfx_dibujar_pieza
    restaurar_ra
    jr   $ra

# ------------------------------------------------------------
# gfx_dibujar_siguiente
# Dibuja la pieza siguiente (rotacion 0) en la zona "siguiente".
# Llamar DESPUES de draw_scene (que pinta el fondo verde).
# Argumentos: $a0 = tipo de pieza (0=I, 1=J, 2=L, 3=O, 4=S, 5=T, 6=Z)
# Retorno: ninguno
# Preserva: $ra
# ------------------------------------------------------------
.globl gfx_dibujar_siguiente
gfx_dibujar_siguiente:
    guardar_ra
    sll  $t0, $a0, 2                     # tipo * 4 bytes
    la   $t1, ALL_COLORS_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)                     # direccion de la variable de color
    lw   $a3, 0($t1)                     # $a3 = color
    la   $t1, MASTER_SHAPE_TABLE
    add  $t1, $t1, $t0
    lw   $t1, 0($t1)                     # tabla de rotaciones de esa pieza
    lw   $a0, 0($t1)                     # forma con rotacion 0
    li   $a1, GFX_SIG_X
    li   $a2, GFX_SIG_Y
    jal  gfx_dibujar_pieza
    restaurar_ra
    jr   $ra

# ============================================================
# TEXTO Y NUMEROS
# ============================================================

# ------------------------------------------------------------
# gfx_dibujar_glifo
# Dibuja un glifo de 3x5 con su esquina superior izquierda en (x, y).
# Argumentos: $a0 = direccion del glifo (5 palabras, una por fila)
#             $a1 = x, $a2 = y, $a3 = color
# Retorno: ninguno
# Preserva: todo salvo $t0-$t7 y $t9 (hoja)
# ------------------------------------------------------------
.globl gfx_dibujar_glifo
gfx_dibujar_glifo:
    move $t4, $a0                        # puntero a la fila actual
    li   $t5, 0                          # fila (0..4)
    move $t7, $a3                        # color
gfx_glifo_fila:
    lw   $t0, 0($t4)                     # bits de la fila (3 bits)
    li   $t6, GFX_GLIFO_COL0             # columna, empieza por la derecha
gfx_glifo_col:
    andi $t1, $t0, 1
    beq  $t1, $zero, gfx_glifo_salto
    add  $t2, $a1, $t6                   # x absoluta
    add  $t3, $a2, $t5                   # y absoluta
    gfx_pintar_celda($t2, $t3, $t7)
gfx_glifo_salto:
    srl  $t0, $t0, 1
    addi $t6, $t6, -1
    bge  $t6, $zero, gfx_glifo_col
    addi $t4, $t4, 4                     # siguiente fila del glifo
    addi $t5, $t5, 1
    blt  $t5, GFX_GLIFO_ALTO, gfx_glifo_fila
    jr   $ra

# ------------------------------------------------------------
# draw_digit
# Dibuja un digito 0-9 en (x, y) con COLOR_TEXT_ORANGE.
# Argumentos: $a0 = digito (0-9), $a1 = x, $a2 = y
# Retorno: ninguno
# Preserva: $ra
# ------------------------------------------------------------
.globl draw_digit
draw_digit:
    guardar_ra
    addi $t0, $a0, GFX_FUENTE_IDX_DIGITO
    sll  $t0, $t0, 2
    la   $t1, gfx_fuente_tabla
    add  $t1, $t1, $t0
    lw   $a0, 0($t1)                     # glifo del digito
    cargar_global($a3, COLOR_TEXT_ORANGE)
    jal  gfx_dibujar_glifo
    restaurar_ra
    jr   $ra

# ------------------------------------------------------------
# draw_char
# Dibuja un caracter ASCII en (x, y) con COLOR_TEXT_ORANGE.
# Minusculas se dibujan como mayusculas; lo que no tiene glifo
# (fuera de 32..90) se dibuja como espacio.
# Argumentos: $a0 = ASCII, $a1 = x, $a2 = y
# Retorno: ninguno
# Preserva: $ra
# ------------------------------------------------------------
.globl draw_char
draw_char:
    guardar_ra
    li   $t1, 'a'
    blt  $a0, $t1, gfx_dc_rango
    li   $t1, 'z'
    bgt  $a0, $t1, gfx_dc_rango
    addi $a0, $a0, -32                   # minuscula -> mayuscula
gfx_dc_rango:
    la   $t0, gfx_g_vacio                # por defecto: espacio
    li   $t1, GFX_FUENTE_ASCII_MIN
    blt  $a0, $t1, gfx_dc_listo
    li   $t2, GFX_FUENTE_ASCII_MAX
    bgt  $a0, $t2, gfx_dc_listo
    sub  $t1, $a0, $t1                   # indice = ASCII - MIN
    sll  $t1, $t1, 2
    la   $t2, gfx_fuente_tabla
    add  $t2, $t2, $t1
    lw   $t0, 0($t2)                     # glifo
gfx_dc_listo:
    move $a0, $t0
    cargar_global($a3, COLOR_TEXT_ORANGE)
    jal  gfx_dibujar_glifo
    restaurar_ra
    jr   $ra

# ------------------------------------------------------------
# draw_string
# Dibuja un texto terminado en 0 con la esquina superior izquierda
# en (x, y).
# Argumentos: $a0 = texto, $a1 = x, $a2 = y
# Retorno: ninguno
# Preserva: $ra, $s0-$s2
# ------------------------------------------------------------
.globl draw_string
draw_string:
    guardar_ra_s0_s1_s2
    move $s0, $a0                        # puntero al caracter actual
    move $s1, $a1                        # x actual
    move $s2, $a2                        # y
gfx_dstr_loop:
    lb   $a0, 0($s0)
    beq  $a0, $zero, gfx_dstr_fin
    move $a1, $s1
    move $a2, $s2
    jal  draw_char
    addi $s1, $s1, GFX_CHAR_PASO
    addi $s0, $s0, 1
    j    gfx_dstr_loop
gfx_dstr_fin:
    restaurar_ra_s0_s1_s2
    jr   $ra

# ------------------------------------------------------------
# gfx_texto_centrado_en
# Dibuja un texto centrado horizontalmente dentro de una zona.
# Argumentos: $a0 = texto, $a1 = x izquierda de la zona,
#             $a2 = ancho de la zona, $a3 = y
# Retorno: ninguno
# Preserva: $ra
# ------------------------------------------------------------
.globl gfx_texto_centrado_en
gfx_texto_centrado_en:
    guardar_ra
    li   $t0, 0                          # longitud del texto
    move $t1, $a0
gfx_tc_len:
    lb   $t2, 0($t1)
    beq  $t2, $zero, gfx_tc_medido
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    j    gfx_tc_len
gfx_tc_medido:
    li   $t3, GFX_CHAR_PASO
    mul  $t0, $t0, $t3
    addi $t0, $t0, -1                    # ancho = 4*letras - 1
    sub  $t1, $a2, $t0
    sra  $t1, $t1, 1                     # (zona - ancho) / 2
    add  $a1, $a1, $t1                   # x final
    move $a2, $a3                        # y
    jal  draw_string
    restaurar_ra
    jr   $ra

# ------------------------------------------------------------
# count_digits
# Cuenta los digitos decimales de un numero.
# Argumentos: $a0 = valor (>= 0)
# Retorno: $v0 = cantidad de digitos (1 si el valor es 0)
# Preserva: todo salvo $t0, $t1 y $v0 (hoja)
# ------------------------------------------------------------
count_digits:
    li   $v0, 1
    move $t1, $a0
    li   $t0, 10                         # base decimal
gfx_cd_loop:
    divu $t1, $t0
    mflo $t1
    beq  $t1, $zero, gfx_cd_fin
    addi $v0, $v0, 1
    j    gfx_cd_loop
gfx_cd_fin:
    jr   $ra

# ------------------------------------------------------------
# draw_number_centered
# Dibuja un numero centrado en una zona.
# Argumentos: $a0 = valor, $a1 = x izquierda de la zona,
#             $a2 = ancho de la zona, $a3 = y
# Retorno: ninguno
# Preserva: $ra, $s0-$s4
# ------------------------------------------------------------
.globl draw_number_centered
draw_number_centered:
    guardar_ra_s0_s1_s2_s3_s4
    move $s0, $a0                        # valor
    move $s1, $a1                        # x izquierda
    move $s2, $a2                        # ancho
    move $s3, $a3                        # y

    move $a0, $s0
    jal  count_digits
    move $s4, $v0                        # cantidad de digitos

    li   $t3, GFX_CHAR_PASO
    mul  $t0, $t3, $s4
    addi $t0, $t0, -1                    # W = 4*digitos - 1

    sub  $t1, $s2, $t0
    sra  $t1, $t1, 1
    add  $t1, $s1, $t1                   # x del digito mas a la izquierda

    addi $t2, $s4, -1
    mul  $t2, $t2, $t3
    add  $s1, $t1, $t2                   # x del digito mas a la derecha

    bne  $s0, $zero, gfx_dnc_loop
    li   $a0, 0                          # caso especial: valor 0
    move $a1, $s1
    move $a2, $s3
    jal  draw_digit
    j    gfx_dnc_fin

gfx_dnc_loop:                            # dibuja de derecha a izquierda
    li   $t3, 10
    divu $s0, $t3
    mfhi $a0                             # digito = resto
    mflo $s0                             # valor = cociente
    move $a1, $s1
    move $a2, $s3
    jal  draw_digit
    li   $t3, GFX_CHAR_PASO
    sub  $s1, $s1, $t3                   # un digito a la izquierda
    bne  $s0, $zero, gfx_dnc_loop

gfx_dnc_fin:
    restaurar_ra_s0_s1_s2_s3_s4
    jr   $ra

# ============================================================
# HUD
# ============================================================

# ------------------------------------------------------------
# draw_score
# Dibuja "PTS" y el puntaje (SCORE) en el encabezado.
# Argumentos: ninguno
# Retorno: ninguno
# Preserva: $ra
# ------------------------------------------------------------
.globl draw_score
draw_score:
    guardar_ra
    la   $a0, gfx_t_pts
    li   $a1, GFX_ETIQ_X
    li   $a2, GFX_PTS_Y
    jal  draw_string
    cargar_global($a0, SCORE)
    li   $a1, GFX_PANEL_X
    li   $a2, GFX_PANEL_ANCHO
    li   $a3, GFX_PTS_Y
    jal  draw_number_centered
    restaurar_ra
    jr   $ra

# ------------------------------------------------------------
# draw_high_score
# Dibuja "REC" y el record (HIGH_SCORE) en el encabezado.
# Argumentos: ninguno
# Retorno: ninguno
# Preserva: $ra
# ------------------------------------------------------------
.globl draw_high_score
draw_high_score:
    guardar_ra
    la   $a0, gfx_t_rec
    li   $a1, GFX_ETIQ_X
    li   $a2, GFX_HI_Y
    jal  draw_string
    cargar_global($a0, HIGH_SCORE)
    li   $a1, GFX_PANEL_X
    li   $a2, GFX_PANEL_ANCHO
    li   $a3, GFX_HI_Y
    jal  draw_number_centered
    restaurar_ra
    jr   $ra

# ------------------------------------------------------------
# gfx_dibujar_nivel
# Dibuja "NV" y el numero de nivel en la zona verde de abajo.
# Argumentos: $a0 = nivel
# Retorno: ninguno
# Preserva: $ra, $s0
# ------------------------------------------------------------
.globl gfx_dibujar_nivel
gfx_dibujar_nivel:
    guardar_ra_s0
    move $s0, $a0
    la   $a0, gfx_t_nivel
    li   $a1, GFX_VAL_ETIQ_X
    li   $a2, GFX_NIV_Y
    jal  draw_string
    move $a0, $s0
    li   $a1, GFX_VAL_NUM_X
    li   $a2, GFX_VAL_NUM_ANCHO
    li   $a3, GFX_NIV_Y
    jal  draw_number_centered
    restaurar_ra_s0
    jr   $ra

# ------------------------------------------------------------
# gfx_dibujar_total_lineas
# Dibuja "LN" y el total de lineas borradas (LINES_CLEARED).
# Argumentos: ninguno
# Retorno: ninguno
# Preserva: $ra
# ------------------------------------------------------------
.globl gfx_dibujar_total_lineas
gfx_dibujar_total_lineas:
    guardar_ra
    la   $a0, gfx_t_lineas
    li   $a1, GFX_VAL_ETIQ_X
    li   $a2, GFX_LIN_Y
    jal  draw_string
    cargar_global($a0, LINES_CLEARED)
    li   $a1, GFX_VAL_NUM_X
    li   $a2, GFX_VAL_NUM_ANCHO
    li   $a3, GFX_LIN_Y
    jal  draw_number_centered
    restaurar_ra
    jr   $ra

# ============================================================
# PANTALLAS
# ============================================================

# ------------------------------------------------------------
# gfx_dibujar_lineas
# Dibuja varias lineas de texto centradas en la pantalla, una debajo
# de otra, cada GFX_LINEA filas.
# Argumentos: $a0 = tabla de direcciones de textos (termina en 0)
#             $a1 = y de la primera linea
# Retorno: ninguno
# Preserva: $ra, $s0, $s1
# ------------------------------------------------------------
gfx_dibujar_lineas:
    guardar_ra_s0_s1
    move $s0, $a0                        # puntero a la tabla
    move $s1, $a1                        # y actual
gfx_dl_loop:
    lw   $a0, 0($s0)
    beq  $a0, $zero, gfx_dl_fin
    li   $a1, 0
    li   $a2, GFX_LADO
    move $a3, $s1
    jal  gfx_texto_centrado_en
    addi $s0, $s0, 4
    addi $s1, $s1, GFX_LINEA
    j    gfx_dl_loop
gfx_dl_fin:
    restaurar_ra_s0_s1
    jr   $ra

# ------------------------------------------------------------
# gfx_dibujar_base
# Fondo del juego con puntaje, record, nivel y lineas: la base de las
# pantallas de Game Over, pausa y victoria.
# Argumentos: ninguno
# Retorno: ninguno
# Preserva: $ra
# ------------------------------------------------------------
gfx_dibujar_base:
    guardar_ra
    jal  draw_scene
    jal  draw_score
    jal  draw_high_score
    cargar_global($a0, NIVEL)
    jal  gfx_dibujar_nivel
    jal  gfx_dibujar_total_lineas
    restaurar_ra
    jr   $ra

# ------------------------------------------------------------
# gfx_banda_negra
# Pinta de negro, de lado a lado, las filas GFX_BANDA_Y0 .. GFX_BANDA_Y1-1.
# Sirve de fondo para que el texto de los mensajes se lea bien.
# Argumentos: ninguno
# Retorno: ninguno
# Preserva: todo salvo $t0, $t1, $t3 y $t9 (hoja)
# ------------------------------------------------------------
gfx_banda_negra:
    cargar_global($t3, COLOR_BLACK)
    li   $t1, GFX_BANDA_Y0               # fila
gfx_bn_y:
    li   $t0, 0                          # columna
gfx_bn_x:
    gfx_pintar_celda($t0, $t1, $t3)
    addi $t0, $t0, 1
    blt  $t0, GFX_LADO, gfx_bn_x
    addi $t1, $t1, 1
    blt  $t1, GFX_BANDA_Y1, gfx_bn_y
    jr   $ra

# ------------------------------------------------------------
# gfx_pantalla_mensaje
# Fondo del juego, banda negra y un mensaje de varias lineas centradas.
# Argumentos: $a0 = tabla de textos (termina en 0)
# Retorno: ninguno
# Preserva: $ra, $s0
# ------------------------------------------------------------
gfx_pantalla_mensaje:
    guardar_ra_s0
    move $s0, $a0
    jal  gfx_dibujar_base
    jal  gfx_banda_negra
    move $a0, $s0
    li   $a1, GFX_MSJ_Y
    jal  gfx_dibujar_lineas
    restaurar_ra_s0
    jr   $ra

# ------------------------------------------------------------
# draw_game_over_screen
# Argumentos: ninguno. Retorno: ninguno. Preserva: $ra
# ------------------------------------------------------------
.globl draw_game_over_screen
draw_game_over_screen:
    guardar_ra
    la   $a0, gfx_lineas_game_over
    jal  gfx_pantalla_mensaje
    restaurar_ra
    jr   $ra

# ------------------------------------------------------------
# gfx_pantalla_pausa
# Argumentos: ninguno. Retorno: ninguno. Preserva: $ra
# ------------------------------------------------------------
.globl gfx_pantalla_pausa
gfx_pantalla_pausa:
    guardar_ra
    la   $a0, gfx_lineas_pausa
    jal  gfx_pantalla_mensaje
    restaurar_ra
    jr   $ra

# ------------------------------------------------------------
# gfx_pantalla_victoria
# Argumentos: ninguno. Retorno: ninguno. Preserva: $ra
# ------------------------------------------------------------
.globl gfx_pantalla_victoria
gfx_pantalla_victoria:
    guardar_ra
    la   $a0, gfx_lineas_victoria
    jal  gfx_pantalla_mensaje
    restaurar_ra
    jr   $ra

# ------------------------------------------------------------
# gfx_pantalla_menu
# Pantalla negra con el titulo y la instruccion para empezar.
# Argumentos: ninguno. Retorno: ninguno. Preserva: $ra
# ------------------------------------------------------------
.globl gfx_pantalla_menu
gfx_pantalla_menu:
    guardar_ra
    jal  gfx_limpiar_pantalla
    la   $a0, gfx_lineas_menu
    li   $a1, GFX_MENU_Y
    jal  gfx_dibujar_lineas
    restaurar_ra
    jr   $ra

# ============================================================
# DATOS
# ============================================================
.data
.align 2
# Buffer de dibujo: una copia en memoria de las 32x32 celdas de la pantalla.
# Todo se dibuja aqui y gfx_presentar copia a la pantalla lo que cambio.
# Empieza en 0 (negro), igual que la pantalla al arrancar.
gfx_sombra:       .space 4096
gfx_t_pts:        .asciiz "PTS"
gfx_t_rec:        .asciiz "REC"
gfx_t_nivel:      .asciiz "NV"
gfx_t_lineas:     .asciiz "LN"
gfx_t_fin_del:    .asciiz "FIN DEL"
gfx_t_juego:      .asciiz "JUEGO"
gfx_t_vacio:      .asciiz ""
gfx_t_pausa:      .asciiz "PAUSA"
gfx_t_pausa_p:    .asciiz "(P)"
gfx_t_victoria:   .asciiz "VICTORIA"
gfx_t_reinicia:   .asciiz "REINICIA"
gfx_t_r:          .asciiz "(R)"
gfx_t_tetris:     .asciiz "TETRIS"
gfx_t_presiona:   .asciiz "PRESIONA"
gfx_t_una:        .asciiz "UNA"
gfx_t_tecla:      .asciiz "TECLA"

.align 2
# Cada tabla es una lista de direcciones de textos que termina en 0.
gfx_lineas_game_over: .word gfx_t_fin_del, gfx_t_juego, gfx_t_r, 0
gfx_lineas_pausa:     .word gfx_t_pausa, gfx_t_pausa_p, 0
gfx_lineas_victoria:  .word gfx_t_victoria, gfx_t_reinicia, gfx_t_r, 0
gfx_lineas_menu:      .word gfx_t_tetris, gfx_t_vacio, gfx_t_presiona, gfx_t_una, gfx_t_tecla, 0