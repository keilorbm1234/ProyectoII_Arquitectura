# main.asm - Keilor
# Punto de entrada. En MARS se abre y se ensambla SOLO este archivo.

.include "macros.asm"     # 1. macros primero
.include "datos.asm"      # 2. constantes y variables
.include "piezas.asm"
.include "fuente.asm"

.text
.globl main
main:
        jal  nuc_prueba   # llama al procedimiento de prueba
        li   $v0, 10      # syscall 10 = terminar programa
        syscall

# 3. procedimientos al final
.include "nucleo.asm"
.include "logica.asm"
.include "graficos.asm"
