# datos.asm - Keilor
# Constantes .eqv y variables globales. Cada quien escribe solo en su sección.

# ===== CONSTANTES =====
.eqv ANCHO            10     # columnas del tablero
.eqv ALTO             20     # filas del tablero
.eqv CELDAS           200    # ANCHO * ALTO
.eqv TABLERO_BYTES    800    # CELDAS * 4
.eqv NIVEL_MAX        10
.eqv LINEAS_POR_NIVEL 5
.eqv TECLA_W 0x77   # 'w'
.eqv TECLA_A 0x61   # 'a'
.eqv TECLA_S 0x73   # 's'
.eqv TECLA_D 0x64
.eqv TECLA_Q 0x71
.eqv TECLA_R 0x72
.eqv TECLA_P 0x70
.eqv TECLA_ESPACIO 0x20

# Estados del juego
.eqv EST_MENU      0
.eqv EST_JUGANDO   1
.eqv EST_PAUSA     2
.eqv EST_GAMEOVER  3
.eqv EST_VICTORIA  4
.data

# ===== NÚCLEO (Keilor) =====

# Immutable Data
ADDR_DSPL:
    .word 0x10008000
ADDR_KBRD:
    .word 0xffff0000
   
  
# Colors
COLOR_BLACK:
    .word 0x00000000
COLOR_BG_GRAY_LIGHT:
    .word 0x00606060
COLOR_BG_GREY_DARK:
    .word 0x00202020
COLOR_BG_WALL:
    .word 0x00ffee00
    #.word 0x00f9f5fe

COLOR_PANEL_NEXT:      # New color for the "Next Piece" panel
    .word 0x00008000     # Dark Green
COLOR_PANEL_SCORE:     # New color for the "Score" panel
    .word 0x00800000     # Dark Red

COLOR_FROZEN_BLOCK:
    .word 0x0022c55e     # Grey for landed pieces

# --- NEW: Tetromino Colors ---
COLOR_I: .word 0x0000ffff # Cyan
COLOR_J: .word 0x000000ff # Blue
COLOR_L: .word 0x00ffa500 # Orange
COLOR_O: .word 0x00ffff00 # Yellow
COLOR_S: .word 0x0000ff00 # Green
COLOR_T: .word 0x00800080 # Purple
COLOR_Z: .word 0x00ff0000 # Red

COLOR_TEXT_ORANGE: .word 0x00FF8800

# Game State Variables
CURRENT_PIECE_X:
    .word 10 # Updated starting X to be centered in the new play area
CURRENT_PIECE_Y:
    .word 1
# CURRENT_PIECE_ORIENTATION:
#    .word 0              # 0 = horizontal, 1 = vertical

CURRENT_PIECE_TYPE: .word 0  # 0=I, 1=J, 2=L, 3=O, 4=S, 5=T, 6=Z
CURRENT_PIECE_ORIENTATION: .word 0 # 0, 1, 2, or 3
CURRENT_PIECE_COLOR: .word 0
SCORE:              .word 0
LINES_CLEARED:      .word 0   # Total lines cleared
LINES_PER_LEVEL:    .word 1   # Speed increases every 5 lines
MIN_GRAVITY:        .word 100 # Fastest possible gravity in ms



# --- NEW: Gravity Timer ---
LAST_GRAVITY_TIME: .word 0      # Stores the system time of the last gravity drop
GRAVITY_INTERVAL:  .word 1000   # Gravity happens every 1000 ms (1 second)

## NEW: Game state, high score, and UI text data
HIGH_SCORE:     .word 0           # Persists across games
GAME_OVER_FLAG: .word 0           # 0 = playing, 1 = game over
ESTADO:         .word EST_JUGANDO   # estado actual del juego

GAMEOVER_TEXT:  .asciiz "GAME OVER"
RETRY_TEXT:     .asciiz "RETRY (R)"
HI_TEXT:        .asciiz "HI"

.align 2

# --- NEW: The Virtual Playfield ---
# An array of 512 words (16x32) to represent the game board.
# 0 = empty, 1 = occupied by a frozen piece.
PLAYFIELD:
    .space 2048  # 16 * 32 = 512 words. 512 * 4 bytes/word = 2048 bytes.

GAME_TEXT:        .asciiz "GAME"
OVER_TEXT:        .asciiz "OVER" 
RETRY_ONLY_TEXT:  .asciiz "RETRY"
R_PARENS_TEXT:    .asciiz ")R("

