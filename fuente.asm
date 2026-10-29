# fuente.asm - Jorge
# Mapas de bits de la fuente 3x5 (números y letras).
.data

FONT_TABLE:
    .word FONT_0, FONT_1, FONT_2, FONT_3, FONT_4, FONT_5, FONT_6, FONT_7, FONT_8, FONT_9

FONT_0: .word 7, 5, 5, 5, 7 # 0
FONT_1: .word 2, 6, 2, 2, 7 # 1
FONT_2: .word 7, 1, 7, 4, 7 # 2
FONT_3: .word 7, 1, 7, 1, 7 # 3
FONT_4: .word 5, 5, 7, 1, 1 # 4
FONT_5: .word 7, 4, 7, 1, 7 # 5
FONT_6: .word 7, 4, 7, 5, 7 # 6
FONT_7: .word 7, 1, 2, 2, 2 # 7
FONT_8: .word 7, 5, 7, 5, 7 # 8
FONT_9: .word 7, 5, 7, 1, 7 # 9
    
FONT_A: .word 7, 5, 7, 5, 5
FONT_E: .word 7, 4, 6, 4, 7
FONT_G: .word 7, 4, 5, 5, 7
FONT_H: .word 5, 5, 7, 5, 5
FONT_I: .word 7, 2, 2, 2, 7
FONT_M: .word 5, 7, 7, 5, 5
FONT_O: .word 7, 5, 5, 5, 7
FONT_R: .word 7, 5, 6, 5, 5
FONT_T: .word 7, 2, 2, 2, 2
FONT_V: .word 5, 5, 5, 5, 2
FONT_Y: .word 5, 5, 7, 2, 2
FONT_L_PAREN: .word 4, 2, 2, 2, 4   # 100,010,010,010,100
FONT_R_PAREN: .word 1, 2, 2, 2, 1   # 001,010,010,010,001
FONT_SPACE:   .word 0, 0, 0, 0, 0 # A blank character
