# nucleo.asm - Keilor
# Teclado, tiempo y gravedad, estados, niveles, pausa y reinicio. Prefijo nuc_
.text

nuc_prueba:
        li   $v0, 4        # syscall 4 = imprimir texto
        la   $a0, PRUEBA   # $a0 = dirección del texto (está en datos.asm)
        syscall
        jr   $ra           # regresa a main, a la línea después del jal
