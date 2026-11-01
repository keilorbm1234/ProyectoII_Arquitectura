# ============================================================
# macros.asm  -  Macros compartidas (dueño: Jorge)
# Se incluye PRIMERO desde main.asm, antes de datos.asm.
#
# Contiene:
#   1. Constantes de geometria del Bitmap Display (GFX_*)
#   2. Macros de marco de pila (guardar_* / restaurar_*)
#   3. Macros de pantalla (direccion de celda, pintar celda)
#   4. Macros de variables globales (cargar_global / guardar_global)
#
# NOTA PARA KEILOR: GFX_BASE, GFX_LADO y GFX_LADO_LOG2 se definen
# aqui porque las macros los necesitan antes de que se incluya
# datos.asm. No volver a definirlos en datos.asm (daria error).
# ============================================================

# ---------- 1. Geometria del Bitmap Display -----------------
# Configuracion de MARS: unidad 8x8, pantalla 256x256, base 0x10008000
.eqv GFX_BASE       0x10008000   # direccion base del Bitmap Display
.eqv GFX_LADO       32           # celdas por lado (256 / 8)
.eqv GFX_LADO_LOG2  5            # 2^5 = 32, para multiplicar con sll

# ---------- 2. Marcos de pila -------------------------------
# Convencion (igual que la plantilla de la guia):
#   $ra en el desplazamiento mas alto, luego $s0, $s1, ... hacia 0.
# Cada guardar_X tiene su restaurar_X con los mismos desplazamientos.
# El "jr $ra" NO esta en la macro: lo escribe el procedimiento.
#
# Uso:
#   mi_proc:
#       guardar_ra_s0_s1
#       ...
#       restaurar_ra_s0_s1
#       jr $ra

.macro guardar_ra
    addi $sp, $sp, -4
    sw   $ra, 0($sp)
.end_macro

.macro restaurar_ra
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
.end_macro

.macro guardar_ra_s0
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $s0, 0($sp)
.end_macro

.macro restaurar_ra_s0
    lw   $s0, 0($sp)
    lw   $ra, 4($sp)
    addi $sp, $sp, 8
.end_macro

.macro guardar_ra_s0_s1
    addi $sp, $sp, -12
    sw   $ra, 8($sp)
    sw   $s0, 4($sp)
    sw   $s1, 0($sp)
.end_macro

.macro restaurar_ra_s0_s1
    lw   $s1, 0($sp)
    lw   $s0, 4($sp)
    lw   $ra, 8($sp)
    addi $sp, $sp, 12
.end_macro

.macro guardar_ra_s0_s1_s2
    addi $sp, $sp, -16
    sw   $ra, 12($sp)
    sw   $s0, 8($sp)
    sw   $s1, 4($sp)
    sw   $s2, 0($sp)
.end_macro

.macro restaurar_ra_s0_s1_s2
    lw   $s2, 0($sp)
    lw   $s1, 4($sp)
    lw   $s0, 8($sp)
    lw   $ra, 12($sp)
    addi $sp, $sp, 16
.end_macro

.macro guardar_ra_s0_s1_s2_s3
    addi $sp, $sp, -20
    sw   $ra, 16($sp)
    sw   $s0, 12($sp)
    sw   $s1, 8($sp)
    sw   $s2, 4($sp)
    sw   $s3, 0($sp)
.end_macro

.macro restaurar_ra_s0_s1_s2_s3
    lw   $s3, 0($sp)
    lw   $s2, 4($sp)
    lw   $s1, 8($sp)
    lw   $s0, 12($sp)
    lw   $ra, 16($sp)
    addi $sp, $sp, 20
.end_macro

.macro guardar_ra_s0_s1_s2_s3_s4
    addi $sp, $sp, -24
    sw   $ra, 20($sp)
    sw   $s0, 16($sp)
    sw   $s1, 12($sp)
    sw   $s2, 8($sp)
    sw   $s3, 4($sp)
    sw   $s4, 0($sp)
.end_macro

.macro restaurar_ra_s0_s1_s2_s3_s4
    lw   $s4, 0($sp)
    lw   $s3, 4($sp)
    lw   $s2, 8($sp)
    lw   $s1, 12($sp)
    lw   $s0, 16($sp)
    lw   $ra, 20($sp)
    addi $sp, $sp, 24
.end_macro

# ---------- 3. Pantalla -------------------------------------
# gfx_dir_celda(%dest, %x, %y)
#   %dest = GFX_BASE + (y * 32 + x) * 4
#   %dest, %x y %y son registros. %dest debe ser DISTINTO de %x
#   y de %y (si no, se pisa el dato antes de usarlo).
#   Solo modifica %dest.
.macro gfx_dir_celda(%dest, %x, %y)
    sll   %dest, %y, GFX_LADO_LOG2   # y * 32
    add   %dest, %dest, %x           # + x
    sll   %dest, %dest, 2            # * 4 bytes por celda
    addiu %dest, %dest, GFX_BASE     # + base (MARS lo expande solo)
.end_macro

# gfx_pintar_celda(%x, %y, %color)
#   Pinta la celda (x, y) con el color (los tres son registros).
#   OJO: usa $t9 como temporal; no lo uses para %x, %y ni %color.
.macro gfx_pintar_celda(%x, %y, %color)
    gfx_dir_celda($t9, %x, %y)
    sw    %color, 0($t9)
.end_macro

# ---------- 4. Variables globales ---------------------------
# cargar_global(%reg, %etiqueta):  %reg = valor de la variable
# guardar_global(%reg, %etiqueta): variable = %reg
# (MARS usa $at internamente al expandir lw/sw con etiqueta.)
.macro cargar_global(%reg, %etiqueta)
    lw   %reg, %etiqueta
.end_macro

.macro guardar_global(%reg, %etiqueta)
    sw   %reg, %etiqueta
.end_macro