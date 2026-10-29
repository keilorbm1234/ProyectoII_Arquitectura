# piezas.asm - Andrey
# Tablas de las 7 piezas y sus rotaciones (solo datos).
.data

# --- NEW ROTATION DATA STRUCTURES ---
# Master table pointing to the rotation table for each piece type
MASTER_SHAPE_TABLE:
    .word ROTATIONS_I, ROTATIONS_J, ROTATIONS_L, ROTATIONS_O, ROTATIONS_S, ROTATIONS_T, ROTATIONS_Z

# Color table (unchanged)
ALL_COLORS_TABLE:
    .word COLOR_I, COLOR_J, COLOR_L, COLOR_O, COLOR_S, COLOR_T, COLOR_Z


# --- Rotation tables for each piece ---
ROTATIONS_I: .word SHAPE_I_0, SHAPE_I_1, SHAPE_I_0, SHAPE_I_1
ROTATIONS_J: .word SHAPE_J_0, SHAPE_J_1, SHAPE_J_2, SHAPE_J_3
ROTATIONS_L: .word SHAPE_L_0, SHAPE_L_1, SHAPE_L_2, SHAPE_L_3
ROTATIONS_O: .word SHAPE_O_0, SHAPE_O_0, SHAPE_O_0, SHAPE_O_0
ROTATIONS_S: .word SHAPE_S_0, SHAPE_S_1, SHAPE_S_0, SHAPE_S_1
ROTATIONS_T: .word SHAPE_T_0, SHAPE_T_1, SHAPE_T_2, SHAPE_T_3
ROTATIONS_Z: .word SHAPE_Z_0, SHAPE_Z_1, SHAPE_Z_0, SHAPE_Z_1

# --- All Shape Data (all orientations) ---
# I-Piece
SHAPE_I_0: .word 0,1, 1,1, 2,1, 3,1 # Horizontal
SHAPE_I_1: .word 1,0, 1,1, 1,2, 1,3 # Vertical
# J-Piece
SHAPE_J_0: .word 0,0, 0,1, 1,1, 2,1
SHAPE_J_1: .word 1,0, 2,0, 1,1, 1,2
SHAPE_J_2: .word 0,1, 1,1, 2,1, 2,2
SHAPE_J_3: .word 1,0, 1,1, 0,2, 1,2
# L-Piece
SHAPE_L_0: .word 2,0, 0,1, 1,1, 2,1
SHAPE_L_1: .word 1,0, 1,1, 1,2, 2,2
SHAPE_L_2: .word 0,1, 1,1, 2,1, 0,2
SHAPE_L_3: .word 0,0, 1,0, 1,1, 1,2
# O-Piece
SHAPE_O_0: .word 0,0, 1,0, 0,1, 1,1
# S-Piece
SHAPE_S_0: .word 1,0, 2,0, 0,1, 1,1
SHAPE_S_1: .word 0,0, 0,1, 1,1, 1,2
# T-Piece
SHAPE_T_0: .word 0,1, 1,1, 2,1, 1,0
SHAPE_T_1: .word 1,0, 0,1, 1,1, 1,2
SHAPE_T_2: .word 1,2, 0,1, 1,1, 2,1
SHAPE_T_3: .word 1,0, 1,1, 2,1, 1,2
# Z-Piece
SHAPE_Z_0: .word 0,0, 1,0, 1,1, 2,1
SHAPE_Z_1: .word 1,0, 0,1, 1,1, 0,2
