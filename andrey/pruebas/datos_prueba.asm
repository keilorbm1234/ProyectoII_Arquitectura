# Standalone test data for Andrey's logic. Never include this file in main.asm.
# Production declarations remain the responsibility of datos.asm's owner.
.eqv ANCHO 10
.eqv ALTO 20
.data
.align 2
CURRENT_PIECE_X:           .word 3
CURRENT_PIECE_Y:           .word 0
CURRENT_PIECE_TYPE:        .word 0
CURRENT_PIECE_ORIENTATION: .word 0
CURRENT_PIECE_COLOR:       .word 0
SCORE:                    .word 0
LINES_CLEARED:            .word 0
HIGH_SCORE:               .word 0
GRAVITY_INTERVAL:         .word 1000 # Legacy regression fixture only
COLOR_I: .word 0x0000ffff
COLOR_J: .word 0x000000ff
COLOR_L: .word 0x00ffa500
COLOR_O: .word 0x00ffff00
COLOR_S: .word 0x0000ff00
COLOR_T: .word 0x00800080
COLOR_Z: .word 0x00ff0000

# Guards are immediately adjacent to the exact 200-word logical board.
# Tests verify that both keep their original value after each target call.
log_test_guard_before: .word 123456789
PLAYFIELD:            .space 800
log_test_guard_after: .word 123456789
