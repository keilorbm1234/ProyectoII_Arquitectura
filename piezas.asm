# piezas.asm - Andrey
# Seven tetrominoes and their rotation tables (data only).
# Active type order: 0=I, 1=J, 2=L, 3=O, 4=S, 5=T, 6=Z.
# Board IDs use type + 1: 1=I, 2=J, 3=L, 4=O, 5=S, 6=T, 7=Z.
# In PLAYFIELD only, zero means empty; active type zero still denotes I.
.data

.align 2

# --- Shape lookup ---
# MASTER_SHAPE_TABLE[type] points to a table of four orientation pointers.
# ROTATIONS_*[orientation] points to four (dx, dy) pairs for that shape.
# Each pointer/coordinate is a 4-byte word. A pair takes 8 bytes and a full
# shape takes 32 bytes. Add each pair to the piece origin to get board cells.
# Both table indices use index * 4; shape pairs are traversed in steps of 8.
# Callers must provide an active type in 0..6 and an orientation in 0..3.
MASTER_SHAPE_TABLE:
    .word ROTATIONS_I, ROTATIONS_J, ROTATIONS_L, ROTATIONS_O, ROTATIONS_S, ROTATIONS_T, ROTATIONS_Z

# Each entry is a pointer to a COLOR_* word in datos.asm, not the RGB value.
# Active pieces index by type. Frozen cells index by stored ID - 1.
ALL_COLORS_TABLE:
    .word COLOR_I, COLOR_J, COLOR_L, COLOR_O, COLOR_S, COLOR_T, COLOR_Z


# --- Rotation tables for each piece ---
# I, S and Z repeat their two distinct orientations; O repeats its only shape.
# J, L and T have four distinct orientations. Existing shapes are preserved.
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
