# ============================================================
# fuente.asm  -  Fuente de 3x5 pixeles (dueño: Jorge)
# Solo datos. Se incluye desde main.asm.
#
# Cada glifo = 5 palabras (una por fila, de arriba a abajo).
# Cada fila usa 3 bits: el bit 2 (valor 4) es la columna izquierda
# y el bit 0 (valor 1) la derecha. Ejemplo: 5 = 101 = "# #".
#
# Tabla de busqueda gfx_fuente_tabla:
#   indice = codigo ASCII - 32, para ASCII 32..90 (espacio .. 'Z')
#   Cada entrada apunta al glifo; lo que no tiene dibujo apunta
#   a gfx_g_vacio. En draw_char: pasar minusculas a mayusculas,
#   y si el caracter esta fuera de 32..90 usar gfx_g_vacio.
#
# Caracteres disponibles: A-Z, 0-9, espacio ! ( ) - . :
# ============================================================

# Constantes de la tabla (definidas antes de .data para que
# graficos.asm, que se incluye despues, las pueda usar)
.eqv GFX_FUENTE_ASCII_MIN   32   # primer caracter de la tabla (espacio)
.eqv GFX_FUENTE_ASCII_MAX   90   # ultimo caracter de la tabla ('Z')
.eqv GFX_FUENTE_IDX_DIGITO  16   # ASCII '0' (48) - ASCII_MIN (32)

.data
.align 2

# ---------- Simbolos ----------
gfx_g_vacio:    .word 0, 0, 0, 0, 0        # espacio
gfx_g_excl:     .word 2, 2, 2, 0, 2        # !
gfx_g_pari:     .word 1, 2, 2, 2, 1        # (
gfx_g_pard:     .word 4, 2, 2, 2, 4        # )
gfx_g_guion:    .word 0, 0, 7, 0, 0        # -
gfx_g_punto:    .word 0, 0, 0, 0, 2        # .
gfx_g_dospun:   .word 0, 2, 0, 2, 0        # :

# ---------- Digitos ----------
gfx_g_0: .word 7, 5, 5, 5, 7
gfx_g_1: .word 2, 6, 2, 2, 7
gfx_g_2: .word 7, 1, 7, 4, 7
gfx_g_3: .word 7, 1, 7, 1, 7
gfx_g_4: .word 5, 5, 7, 1, 1
gfx_g_5: .word 7, 4, 7, 1, 7
gfx_g_6: .word 7, 4, 7, 5, 7
gfx_g_7: .word 7, 1, 2, 2, 2
gfx_g_8: .word 7, 5, 7, 5, 7
gfx_g_9: .word 7, 5, 7, 1, 7

# ---------- Letras ----------
gfx_g_A: .word 7, 5, 7, 5, 5
gfx_g_B: .word 6, 5, 6, 5, 6
gfx_g_C: .word 7, 4, 4, 4, 7
gfx_g_D: .word 6, 5, 5, 5, 6
gfx_g_E: .word 7, 4, 6, 4, 7
gfx_g_F: .word 7, 4, 6, 4, 4
gfx_g_G: .word 7, 4, 5, 5, 7
gfx_g_H: .word 5, 5, 7, 5, 5
gfx_g_I: .word 7, 2, 2, 2, 7
gfx_g_J: .word 1, 1, 1, 5, 7
gfx_g_K: .word 5, 5, 6, 5, 5
gfx_g_L: .word 4, 4, 4, 4, 7
gfx_g_M: .word 5, 7, 7, 5, 5
gfx_g_N: .word 7, 5, 5, 5, 5
gfx_g_O: .word 7, 5, 5, 5, 7
gfx_g_P: .word 7, 5, 7, 4, 4
gfx_g_Q: .word 7, 5, 5, 7, 1
gfx_g_R: .word 7, 5, 6, 5, 5
gfx_g_S: .word 7, 4, 7, 1, 7
gfx_g_T: .word 7, 2, 2, 2, 2
gfx_g_U: .word 5, 5, 5, 5, 7
gfx_g_V: .word 5, 5, 5, 5, 2
gfx_g_W: .word 5, 5, 7, 7, 5
gfx_g_X: .word 5, 5, 2, 5, 5
gfx_g_Y: .word 5, 5, 7, 2, 2
gfx_g_Z: .word 7, 1, 2, 4, 7

# ---------- Tabla ASCII 32..90 (59 entradas) ----------
.align 2
gfx_fuente_tabla:
    # 32-39:  espacio ! " # $ % & '
    .word gfx_g_vacio, gfx_g_excl, gfx_g_vacio, gfx_g_vacio, gfx_g_vacio, gfx_g_vacio, gfx_g_vacio, gfx_g_vacio
    # 40-47:  ( ) * + , - . /
    .word gfx_g_pari, gfx_g_pard, gfx_g_vacio, gfx_g_vacio, gfx_g_vacio, gfx_g_guion, gfx_g_punto, gfx_g_vacio
    # 48-57:  0-9
    .word gfx_g_0, gfx_g_1, gfx_g_2, gfx_g_3, gfx_g_4, gfx_g_5, gfx_g_6, gfx_g_7, gfx_g_8, gfx_g_9
    # 58-64:  : ; < = > ? @
    .word gfx_g_dospun, gfx_g_vacio, gfx_g_vacio, gfx_g_vacio, gfx_g_vacio, gfx_g_vacio, gfx_g_vacio
    # 65-77:  A-M
    .word gfx_g_A, gfx_g_B, gfx_g_C, gfx_g_D, gfx_g_E, gfx_g_F, gfx_g_G, gfx_g_H, gfx_g_I, gfx_g_J, gfx_g_K, gfx_g_L, gfx_g_M
    # 78-90:  N-Z
    .word gfx_g_N, gfx_g_O, gfx_g_P, gfx_g_Q, gfx_g_R, gfx_g_S, gfx_g_T, gfx_g_U, gfx_g_V, gfx_g_W, gfx_g_X, gfx_g_Y, gfx_g_Z