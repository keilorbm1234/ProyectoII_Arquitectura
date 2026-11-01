# Portable standalone tests for Andrey; assemble this file alone.
# Original cases and expected values are retained; shared assertions reduce repetition.
.include "datos_prueba.asm"
.include "../../piezas.asm"
.text
.globl main
main:
sw $sp, log_test_saved_sp
li $s0, 1000
li $s1, 1001
li $s2, 1002
li $s3, 1003
li $s4, 1004
li $s5, 1005
li $s6, 1006
li $s7, 1007
la $t8, PLAYFIELD
li $t9, 123456789
sw $t9, -4($t8)
la $t8, PLAYFIELD
li $t9, 123456789
sw $t9, 800($t8)
# Case 1: Type 0, orientation 0: exact stored ID and shape
log_test_case_001:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 0($t8)
lw $a0, 0($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 12
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 13
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 14
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 16
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 17
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 19
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 20
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 21
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 22
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 23
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 24
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 25
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 26
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_001
li $a1, 200
li $a2, 27
jal log_test_assert_board
la $a0, SHAPE_I_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 227
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 228
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 229
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 230
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 231
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 232
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 233
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 234
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 235
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 236
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 237
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 238
jal log_test_assert_equal
# Case 2: Type 0, orientation 1: exact stored ID and shape
log_test_case_002:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 239
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 240
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 241
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 242
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 243
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 244
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 245
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 246
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 247
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 248
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 249
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 0($t8)
lw $a0, 4($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 250
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 251
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 252
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 253
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 254
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 255
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 256
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 257
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 258
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 259
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 260
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 261
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 262
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 263
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 264
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_002
li $a1, 200
li $a2, 265
jal log_test_assert_board
la $a0, SHAPE_I_1
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 465
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 466
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 467
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 468
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 469
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 470
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 471
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 472
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 473
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 474
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 475
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 476
jal log_test_assert_equal
# Case 3: Type 0, orientation 2: exact stored ID and shape
log_test_case_003:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 477
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 478
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 479
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 480
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 481
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 482
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 483
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 484
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 485
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 486
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 487
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 0($t8)
lw $a0, 8($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 488
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 489
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 490
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 491
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 492
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 493
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 494
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 495
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 496
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 497
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 498
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 499
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 500
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 501
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 502
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_001
li $a1, 200
li $a2, 503
jal log_test_assert_board
la $a0, SHAPE_I_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 703
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 704
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 705
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 706
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 707
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 708
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 709
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 710
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 711
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 712
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 713
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 714
jal log_test_assert_equal
# Case 4: Type 0, orientation 3: exact stored ID and shape
log_test_case_004:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 715
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 716
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 717
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 718
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 719
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 720
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 721
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 722
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 723
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 724
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 725
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 0($t8)
lw $a0, 12($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 726
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 727
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 728
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 729
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 730
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 731
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 732
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 733
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 734
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 735
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 736
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 737
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 738
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 739
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 740
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_002
li $a1, 200
li $a2, 741
jal log_test_assert_board
la $a0, SHAPE_I_1
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 941
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 942
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 943
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 944
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 945
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 946
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 947
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 948
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 949
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 950
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 951
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 952
jal log_test_assert_equal
# Case 5: Type 1, orientation 0: exact stored ID and shape
log_test_case_005:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 953
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 954
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 955
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 956
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 957
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 958
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 959
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 960
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 961
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 962
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 963
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 4($t8)
lw $a0, 0($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 964
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 965
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 966
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 967
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 968
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 969
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 970
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 971
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 972
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 973
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 974
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 975
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 976
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 977
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 978
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_003
li $a1, 200
li $a2, 979
jal log_test_assert_board
la $a0, SHAPE_J_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1179
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1180
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1181
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1182
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1183
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1184
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1185
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1186
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1187
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1188
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1189
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 1190
jal log_test_assert_equal
# Case 6: Type 1, orientation 1: exact stored ID and shape
log_test_case_006:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1191
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1192
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1193
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1194
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1195
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1196
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1197
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1198
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1199
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1200
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1201
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 4($t8)
lw $a0, 4($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1202
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1203
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1204
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1205
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1206
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1207
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1208
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1209
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1210
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1211
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1212
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 1213
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 1214
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 1215
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 1216
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_004
li $a1, 200
li $a2, 1217
jal log_test_assert_board
la $a0, SHAPE_J_1
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1417
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1418
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1419
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1420
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1421
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1422
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1423
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1424
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1425
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1426
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1427
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 1428
jal log_test_assert_equal
# Case 7: Type 1, orientation 2: exact stored ID and shape
log_test_case_007:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1429
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1430
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1431
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1432
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1433
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1434
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1435
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1436
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1437
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1438
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1439
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 4($t8)
lw $a0, 8($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1440
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1441
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1442
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1443
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1444
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1445
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1446
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1447
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1448
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1449
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1450
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 1451
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 1452
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 1453
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 1454
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_005
li $a1, 200
li $a2, 1455
jal log_test_assert_board
la $a0, SHAPE_J_2
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1655
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1656
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1657
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1658
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1659
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1660
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1661
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1662
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1663
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1664
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1665
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 1666
jal log_test_assert_equal
# Case 8: Type 1, orientation 3: exact stored ID and shape
log_test_case_008:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1667
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1668
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1669
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1670
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1671
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1672
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1673
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1674
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1675
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1676
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1677
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 4($t8)
lw $a0, 12($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1678
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1679
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1680
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1681
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1682
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1683
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1684
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1685
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1686
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1687
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1688
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 1689
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 1690
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 1691
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 1692
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_006
li $a1, 200
li $a2, 1693
jal log_test_assert_board
la $a0, SHAPE_J_3
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1893
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1894
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1895
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1896
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1897
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1898
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1899
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1900
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1901
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1902
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1903
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 1904
jal log_test_assert_equal
# Case 9: Type 2, orientation 0: exact stored ID and shape
log_test_case_009:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1905
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1906
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1907
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1908
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1909
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1910
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1911
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1912
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1913
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1914
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1915
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 8($t8)
lw $a0, 0($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 1916
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1917
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1918
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1919
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1920
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1921
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1922
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1923
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1924
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1925
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1926
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 1927
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 1928
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 1929
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 1930
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_007
li $a1, 200
li $a2, 1931
jal log_test_assert_board
la $a0, SHAPE_L_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2131
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2132
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2133
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2134
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2135
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2136
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2137
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2138
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2139
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2140
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2141
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 2142
jal log_test_assert_equal
# Case 10: Type 2, orientation 1: exact stored ID and shape
log_test_case_010:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2143
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2144
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2145
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2146
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2147
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2148
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2149
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2150
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2151
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2152
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2153
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 8($t8)
lw $a0, 4($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2154
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2155
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2156
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2157
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2158
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2159
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2160
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2161
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2162
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2163
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2164
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 2165
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 2166
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 2167
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 2168
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_008
li $a1, 200
li $a2, 2169
jal log_test_assert_board
la $a0, SHAPE_L_1
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2369
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2370
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2371
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2372
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2373
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2374
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2375
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2376
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2377
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2378
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2379
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 2380
jal log_test_assert_equal
# Case 11: Type 2, orientation 2: exact stored ID and shape
log_test_case_011:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2381
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2382
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2383
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2384
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2385
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2386
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2387
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2388
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2389
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2390
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2391
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 8($t8)
lw $a0, 8($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2392
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2393
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2394
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2395
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2396
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2397
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2398
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2399
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2400
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2401
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2402
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 2403
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 2404
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 2405
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 2406
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_009
li $a1, 200
li $a2, 2407
jal log_test_assert_board
la $a0, SHAPE_L_2
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2607
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2608
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2609
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2610
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2611
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2612
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2613
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2614
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2615
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2616
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2617
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 2618
jal log_test_assert_equal
# Case 12: Type 2, orientation 3: exact stored ID and shape
log_test_case_012:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2619
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2620
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2621
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2622
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2623
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2624
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2625
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2626
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2627
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2628
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2629
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 8($t8)
lw $a0, 12($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2630
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2631
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2632
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2633
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2634
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2635
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2636
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2637
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2638
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2639
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2640
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 2641
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 2642
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 2643
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 2644
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_010
li $a1, 200
li $a2, 2645
jal log_test_assert_board
la $a0, SHAPE_L_3
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2845
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2846
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2847
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2848
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2849
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2850
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2851
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2852
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2853
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2854
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2855
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 2856
jal log_test_assert_equal
# Case 13: Type 3, orientation 0: exact stored ID and shape
log_test_case_013:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2857
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2858
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2859
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2860
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2861
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2862
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2863
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2864
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2865
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2866
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2867
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 12($t8)
lw $a0, 0($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 2868
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2869
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2870
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2871
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2872
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2873
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2874
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2875
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2876
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2877
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2878
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 2879
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 2880
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 2881
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 2882
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 2883
jal log_test_assert_board
la $a0, SHAPE_O_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3083
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3084
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3085
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3086
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3087
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3088
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3089
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3090
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3091
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3092
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3093
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 3094
jal log_test_assert_equal
# Case 14: Type 3, orientation 1: exact stored ID and shape
log_test_case_014:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3095
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3096
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3097
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3098
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3099
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3100
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3101
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3102
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3103
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3104
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3105
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 12($t8)
lw $a0, 4($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3106
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3107
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3108
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3109
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3110
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3111
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3112
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3113
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3114
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3115
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3116
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 3117
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 3118
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 3119
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 3120
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 3121
jal log_test_assert_board
la $a0, SHAPE_O_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3321
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3322
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3323
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3324
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3325
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3326
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3327
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3328
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3329
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3330
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3331
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 3332
jal log_test_assert_equal
# Case 15: Type 3, orientation 2: exact stored ID and shape
log_test_case_015:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3333
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3334
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3335
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3336
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3337
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3338
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3339
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3340
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3341
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3342
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3343
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 12($t8)
lw $a0, 8($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3344
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3345
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3346
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3347
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3348
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3349
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3350
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3351
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3352
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3353
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3354
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 3355
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 3356
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 3357
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 3358
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 3359
jal log_test_assert_board
la $a0, SHAPE_O_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3559
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3560
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3561
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3562
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3563
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3564
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3565
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3566
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3567
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3568
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3569
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 3570
jal log_test_assert_equal
# Case 16: Type 3, orientation 3: exact stored ID and shape
log_test_case_016:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3571
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3572
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3573
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3574
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3575
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3576
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3577
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3578
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3579
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3580
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3581
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 12($t8)
lw $a0, 12($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3582
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3583
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3584
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3585
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3586
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3587
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3588
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3589
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3590
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3591
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3592
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 3593
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 3594
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 3595
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 3596
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 3597
jal log_test_assert_board
la $a0, SHAPE_O_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3797
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3798
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3799
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3800
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3801
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3802
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3803
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3804
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3805
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3806
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3807
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 3808
jal log_test_assert_equal
# Case 17: Type 4, orientation 0: exact stored ID and shape
log_test_case_017:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3809
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3810
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3811
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3812
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3813
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3814
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3815
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3816
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3817
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3818
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3819
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 16($t8)
lw $a0, 0($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 3820
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3821
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3822
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3823
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3824
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3825
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3826
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3827
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3828
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3829
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3830
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 3831
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 3832
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 3833
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 3834
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_012
li $a1, 200
li $a2, 3835
jal log_test_assert_board
la $a0, SHAPE_S_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4035
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4036
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4037
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4038
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4039
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4040
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4041
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4042
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4043
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4044
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4045
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 4046
jal log_test_assert_equal
# Case 18: Type 4, orientation 1: exact stored ID and shape
log_test_case_018:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4047
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4048
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4049
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4050
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4051
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4052
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4053
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4054
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4055
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4056
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4057
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 16($t8)
lw $a0, 4($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4058
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4059
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4060
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4061
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4062
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4063
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4064
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4065
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4066
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4067
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4068
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 4069
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 4070
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 4071
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 4072
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_013
li $a1, 200
li $a2, 4073
jal log_test_assert_board
la $a0, SHAPE_S_1
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4273
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4274
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4275
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4276
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4277
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4278
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4279
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4280
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4281
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4282
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4283
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 4284
jal log_test_assert_equal
# Case 19: Type 4, orientation 2: exact stored ID and shape
log_test_case_019:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4285
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4286
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4287
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4288
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4289
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4290
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4291
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4292
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4293
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4294
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4295
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 16($t8)
lw $a0, 8($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4296
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4297
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4298
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4299
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4300
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4301
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4302
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4303
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4304
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4305
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4306
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 4307
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 4308
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 4309
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 4310
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_012
li $a1, 200
li $a2, 4311
jal log_test_assert_board
la $a0, SHAPE_S_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4511
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4512
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4513
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4514
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4515
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4516
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4517
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4518
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4519
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4520
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4521
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 4522
jal log_test_assert_equal
# Case 20: Type 4, orientation 3: exact stored ID and shape
log_test_case_020:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4523
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4524
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4525
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4526
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4527
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4528
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4529
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4530
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4531
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4532
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4533
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 16($t8)
lw $a0, 12($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4534
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4535
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4536
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4537
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4538
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4539
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4540
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4541
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4542
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4543
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4544
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 4545
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 4546
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 4547
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 4548
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_013
li $a1, 200
li $a2, 4549
jal log_test_assert_board
la $a0, SHAPE_S_1
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4749
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4750
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4751
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4752
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4753
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4754
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4755
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4756
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4757
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4758
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4759
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 4760
jal log_test_assert_equal
# Case 21: Type 5, orientation 0: exact stored ID and shape
log_test_case_021:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4761
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4762
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4763
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4764
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4765
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4766
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4767
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4768
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4769
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4770
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4771
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 20($t8)
lw $a0, 0($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4772
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4773
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4774
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4775
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4776
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4777
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4778
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4779
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4780
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4781
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4782
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 4783
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 4784
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 4785
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 4786
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_014
li $a1, 200
li $a2, 4787
jal log_test_assert_board
la $a0, SHAPE_T_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4987
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4988
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4989
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4990
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4991
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4992
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4993
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4994
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4995
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4996
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4997
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 4998
jal log_test_assert_equal
# Case 22: Type 5, orientation 1: exact stored ID and shape
log_test_case_022:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 4999
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5000
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5001
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5002
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5003
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5004
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5005
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5006
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5007
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5008
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5009
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 20($t8)
lw $a0, 4($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5010
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5011
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5012
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5013
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5014
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5015
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5016
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5017
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5018
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5019
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5020
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 5021
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 5022
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 5023
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 5024
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_015
li $a1, 200
li $a2, 5025
jal log_test_assert_board
la $a0, SHAPE_T_1
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5225
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5226
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5227
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5228
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5229
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5230
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5231
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5232
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5233
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5234
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5235
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 5236
jal log_test_assert_equal
# Case 23: Type 5, orientation 2: exact stored ID and shape
log_test_case_023:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5237
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5238
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5239
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5240
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5241
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5242
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5243
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5244
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5245
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5246
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5247
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 20($t8)
lw $a0, 8($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5248
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5249
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5250
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5251
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5252
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5253
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5254
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5255
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5256
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5257
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5258
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 5259
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 5260
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 5261
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 5262
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_016
li $a1, 200
li $a2, 5263
jal log_test_assert_board
la $a0, SHAPE_T_2
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5463
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5464
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5465
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5466
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5467
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5468
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5469
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5470
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5471
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5472
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5473
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 5474
jal log_test_assert_equal
# Case 24: Type 5, orientation 3: exact stored ID and shape
log_test_case_024:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5475
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5476
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5477
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5478
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5479
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5480
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5481
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5482
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5483
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5484
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5485
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 20($t8)
lw $a0, 12($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5486
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5487
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5488
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5489
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5490
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5491
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5492
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5493
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5494
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5495
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5496
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 5497
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 5498
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 5499
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 5500
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_017
li $a1, 200
li $a2, 5501
jal log_test_assert_board
la $a0, SHAPE_T_3
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5701
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5702
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5703
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5704
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5705
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5706
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5707
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5708
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5709
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5710
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5711
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 5712
jal log_test_assert_equal
# Case 25: Type 6, orientation 0: exact stored ID and shape
log_test_case_025:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5713
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5714
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5715
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5716
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5717
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5718
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5719
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5720
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5721
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5722
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5723
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 24($t8)
lw $a0, 0($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5724
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5725
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5726
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5727
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5728
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5729
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5730
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5731
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5732
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5733
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5734
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 5735
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 5736
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 5737
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 5738
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_018
li $a1, 200
li $a2, 5739
jal log_test_assert_board
la $a0, SHAPE_Z_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5939
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5940
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5941
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5942
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5943
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5944
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5945
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5946
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5947
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5948
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5949
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 5950
jal log_test_assert_equal
# Case 26: Type 6, orientation 1: exact stored ID and shape
log_test_case_026:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5951
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5952
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5953
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5954
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5955
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5956
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5957
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5958
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5959
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5960
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5961
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 24($t8)
lw $a0, 4($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 5962
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5963
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5964
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5965
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5966
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5967
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5968
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5969
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5970
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5971
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5972
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 5973
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 5974
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 5975
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 5976
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_019
li $a1, 200
li $a2, 5977
jal log_test_assert_board
la $a0, SHAPE_Z_1
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6177
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6178
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6179
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6180
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6181
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6182
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6183
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6184
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6185
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6186
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6187
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 6188
jal log_test_assert_equal
# Case 27: Type 6, orientation 2: exact stored ID and shape
log_test_case_027:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6189
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6190
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6191
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6192
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6193
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6194
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6195
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6196
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6197
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6198
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6199
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 24($t8)
lw $a0, 8($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6200
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6201
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6202
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6203
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6204
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6205
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6206
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6207
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6208
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6209
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6210
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 6211
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 6212
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 6213
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 6214
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_018
li $a1, 200
li $a2, 6215
jal log_test_assert_board
la $a0, SHAPE_Z_0
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6415
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6416
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6417
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6418
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6419
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6420
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6421
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6422
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6423
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6424
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6425
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 6426
jal log_test_assert_equal
# Case 28: Type 6, orientation 3: exact stored ID and shape
log_test_case_028:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6427
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6428
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6429
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6430
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6431
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6432
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6433
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6434
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6435
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6436
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6437
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
la $t8, MASTER_SHAPE_TABLE
lw $t8, 24($t8)
lw $a0, 12($t8)
li $a1, 3
li $a2, 4
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6438
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6439
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6440
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6441
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6442
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6443
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6444
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6445
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6446
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6447
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6448
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 6449
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 6450
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 6451
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 4
li $a2, 6452
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_019
li $a1, 200
li $a2, 6453
jal log_test_assert_board
la $a0, SHAPE_Z_1
li $a1, 3
li $a2, 4
jal check_collision
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6653
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6654
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6655
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6656
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6657
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6658
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6659
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6660
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6661
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6662
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6663
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 6664
jal log_test_assert_equal
# Case 29: Invalid active type -1 writes no cells
log_test_case_029:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6665
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6666
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6667
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6668
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6669
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6670
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6671
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6672
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6673
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6674
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6675
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, -1
sw $t8, CURRENT_PIECE_TYPE
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6676
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6677
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6678
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6679
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6680
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6681
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6682
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6683
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6684
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6685
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6686
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 6687
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_020
li $a1, 200
li $a2, 6688
jal log_test_assert_board
# Case 30: Invalid active type 7 writes no cells
log_test_case_030:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6888
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6889
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6890
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6891
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6892
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6893
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6894
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6895
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6896
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6897
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6898
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 7
sw $t8, CURRENT_PIECE_TYPE
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 6899
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6900
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6901
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6902
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6903
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6904
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6905
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6906
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6907
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6908
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6909
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 6910
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_020
li $a1, 200
li $a2, 6911
jal log_test_assert_board
# Case 31: Invalid active type 100 writes no cells
log_test_case_031:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7111
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7112
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7113
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7114
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7115
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7116
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7117
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7118
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7119
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7120
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7121
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 100
sw $t8, CURRENT_PIECE_TYPE
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal freeze_piece
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7122
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7123
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7124
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7125
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7126
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7127
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7128
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7129
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7130
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7131
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7132
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 7133
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_020
li $a1, 200
li $a2, 7134
jal log_test_assert_board
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7334
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7335
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7336
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7337
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7338
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7339
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7340
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7341
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7342
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7343
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7344
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 200($t8)
# Case 32: Scoring 0 lines at level 1
log_test_case_032:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 1
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7345
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7346
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7347
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7348
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7349
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7350
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7351
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7352
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7353
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7354
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7355
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 7356
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7357
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7358
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7359
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 0
li $a2, 7360
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 1
li $a2, 7361
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7362
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7363
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7364
jal log_test_assert_equal
# Case 33: Scoring 1 lines at level 1
log_test_case_033:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 1
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7365
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7366
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7367
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7368
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7369
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7370
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7371
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7372
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7373
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7374
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7375
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 100
li $a2, 7376
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7377
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1334
li $a2, 7378
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7379
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 1
li $a2, 7380
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 1
li $a2, 7381
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7382
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7383
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7384
jal log_test_assert_equal
# Case 34: Scoring 2 lines at level 1
log_test_case_034:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 2
li $a1, 1
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7385
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7386
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7387
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7388
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7389
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7390
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7391
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7392
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7393
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7394
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7395
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 300
li $a2, 7396
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7397
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1534
li $a2, 7398
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7399
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 2
li $a2, 7400
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 1
li $a2, 7401
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7402
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7403
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7404
jal log_test_assert_equal
# Case 35: Scoring 3 lines at level 1
log_test_case_035:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 3
li $a1, 1
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7405
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7406
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7407
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7408
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7409
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7410
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7411
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7412
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7413
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7414
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7415
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 500
li $a2, 7416
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7417
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1734
li $a2, 7418
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7419
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 3
li $a2, 7420
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 1
li $a2, 7421
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7422
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7423
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7424
jal log_test_assert_equal
# Case 36: Scoring 4 lines at level 1
log_test_case_036:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 4
li $a1, 1
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7425
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7426
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7427
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7428
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7429
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7430
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7431
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7432
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7433
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7434
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7435
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 800
li $a2, 7436
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7437
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2034
li $a2, 7438
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7439
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 4
li $a2, 7440
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 1
li $a2, 7441
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7442
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7443
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7444
jal log_test_assert_equal
# Case 37: Scoring 0 lines at level 2
log_test_case_037:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 2
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7445
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7446
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7447
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7448
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7449
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7450
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7451
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7452
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7453
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7454
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7455
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 7456
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7457
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7458
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7459
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 0
li $a2, 7460
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 2
li $a2, 7461
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7462
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7463
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7464
jal log_test_assert_equal
# Case 38: Scoring 1 lines at level 2
log_test_case_038:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 2
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7465
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7466
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7467
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7468
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7469
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7470
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7471
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7472
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7473
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7474
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7475
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 200
li $a2, 7476
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7477
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1434
li $a2, 7478
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7479
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 1
li $a2, 7480
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 2
li $a2, 7481
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7482
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7483
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7484
jal log_test_assert_equal
# Case 39: Scoring 2 lines at level 2
log_test_case_039:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 2
li $a1, 2
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7485
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7486
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7487
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7488
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7489
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7490
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7491
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7492
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7493
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7494
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7495
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 600
li $a2, 7496
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7497
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1834
li $a2, 7498
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7499
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 2
li $a2, 7500
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 2
li $a2, 7501
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7502
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7503
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7504
jal log_test_assert_equal
# Case 40: Scoring 3 lines at level 2
log_test_case_040:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 3
li $a1, 2
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7505
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7506
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7507
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7508
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7509
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7510
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7511
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7512
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7513
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7514
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7515
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1000
li $a2, 7516
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7517
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2234
li $a2, 7518
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7519
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 3
li $a2, 7520
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 2
li $a2, 7521
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7522
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7523
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7524
jal log_test_assert_equal
# Case 41: Scoring 4 lines at level 2
log_test_case_041:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 4
li $a1, 2
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7525
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7526
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7527
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7528
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7529
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7530
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7531
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7532
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7533
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7534
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7535
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1600
li $a2, 7536
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7537
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2834
li $a2, 7538
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7539
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 4
li $a2, 7540
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 2
li $a2, 7541
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7542
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7543
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7544
jal log_test_assert_equal
# Case 42: Scoring 0 lines at level 3
log_test_case_042:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 3
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7545
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7546
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7547
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7548
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7549
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7550
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7551
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7552
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7553
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7554
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7555
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 7556
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7557
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7558
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7559
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 0
li $a2, 7560
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 7561
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7562
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7563
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7564
jal log_test_assert_equal
# Case 43: Scoring 1 lines at level 3
log_test_case_043:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 3
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7565
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7566
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7567
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7568
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7569
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7570
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7571
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7572
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7573
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7574
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7575
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 300
li $a2, 7576
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7577
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1534
li $a2, 7578
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7579
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 1
li $a2, 7580
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 7581
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7582
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7583
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7584
jal log_test_assert_equal
# Case 44: Scoring 2 lines at level 3
log_test_case_044:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 2
li $a1, 3
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7585
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7586
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7587
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7588
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7589
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7590
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7591
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7592
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7593
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7594
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7595
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 900
li $a2, 7596
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7597
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2134
li $a2, 7598
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7599
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 2
li $a2, 7600
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 7601
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7602
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7603
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7604
jal log_test_assert_equal
# Case 45: Scoring 3 lines at level 3
log_test_case_045:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 3
li $a1, 3
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7605
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7606
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7607
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7608
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7609
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7610
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7611
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7612
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7613
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7614
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7615
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1500
li $a2, 7616
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7617
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2734
li $a2, 7618
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7619
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 3
li $a2, 7620
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 7621
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7622
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7623
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7624
jal log_test_assert_equal
# Case 46: Scoring 4 lines at level 3
log_test_case_046:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 4
li $a1, 3
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7625
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7626
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7627
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7628
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7629
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7630
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7631
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7632
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7633
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7634
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7635
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 2400
li $a2, 7636
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7637
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 3634
li $a2, 7638
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7639
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 4
li $a2, 7640
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 3
li $a2, 7641
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7642
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7643
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7644
jal log_test_assert_equal
# Case 47: Scoring 0 lines at level 4
log_test_case_047:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 4
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7645
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7646
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7647
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7648
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7649
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7650
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7651
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7652
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7653
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7654
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7655
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 7656
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7657
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7658
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7659
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 0
li $a2, 7660
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 4
li $a2, 7661
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7662
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7663
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7664
jal log_test_assert_equal
# Case 48: Scoring 1 lines at level 4
log_test_case_048:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 4
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7665
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7666
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7667
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7668
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7669
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7670
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7671
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7672
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7673
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7674
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7675
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 400
li $a2, 7676
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7677
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1634
li $a2, 7678
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7679
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 1
li $a2, 7680
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 4
li $a2, 7681
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7682
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7683
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7684
jal log_test_assert_equal
# Case 49: Scoring 2 lines at level 4
log_test_case_049:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 2
li $a1, 4
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7685
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7686
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7687
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7688
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7689
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7690
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7691
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7692
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7693
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7694
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7695
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1200
li $a2, 7696
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7697
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2434
li $a2, 7698
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7699
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 2
li $a2, 7700
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 4
li $a2, 7701
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7702
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7703
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7704
jal log_test_assert_equal
# Case 50: Scoring 3 lines at level 4
log_test_case_050:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 3
li $a1, 4
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7705
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7706
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7707
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7708
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7709
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7710
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7711
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7712
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7713
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7714
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7715
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 2000
li $a2, 7716
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7717
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 3234
li $a2, 7718
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7719
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 3
li $a2, 7720
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 4
li $a2, 7721
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7722
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7723
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7724
jal log_test_assert_equal
# Case 51: Scoring 4 lines at level 4
log_test_case_051:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 4
li $a1, 4
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7725
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7726
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7727
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7728
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7729
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7730
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7731
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7732
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7733
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7734
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7735
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 3200
li $a2, 7736
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7737
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 4434
li $a2, 7738
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7739
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 4
li $a2, 7740
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 4
li $a2, 7741
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7742
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7743
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7744
jal log_test_assert_equal
# Case 52: Scoring 0 lines at level 5
log_test_case_052:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 5
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7745
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7746
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7747
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7748
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7749
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7750
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7751
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7752
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7753
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7754
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7755
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 7756
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7757
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7758
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7759
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 0
li $a2, 7760
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 5
li $a2, 7761
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7762
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7763
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7764
jal log_test_assert_equal
# Case 53: Scoring 1 lines at level 5
log_test_case_053:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 5
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7765
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7766
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7767
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7768
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7769
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7770
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7771
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7772
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7773
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7774
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7775
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 500
li $a2, 7776
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7777
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1734
li $a2, 7778
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7779
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 1
li $a2, 7780
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 5
li $a2, 7781
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7782
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7783
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7784
jal log_test_assert_equal
# Case 54: Scoring 2 lines at level 5
log_test_case_054:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 2
li $a1, 5
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7785
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7786
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7787
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7788
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7789
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7790
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7791
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7792
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7793
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7794
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7795
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1500
li $a2, 7796
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7797
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2734
li $a2, 7798
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7799
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 2
li $a2, 7800
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 5
li $a2, 7801
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7802
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7803
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7804
jal log_test_assert_equal
# Case 55: Scoring 3 lines at level 5
log_test_case_055:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 3
li $a1, 5
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7805
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7806
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7807
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7808
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7809
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7810
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7811
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7812
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7813
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7814
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7815
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 2500
li $a2, 7816
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7817
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 3734
li $a2, 7818
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7819
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 3
li $a2, 7820
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 5
li $a2, 7821
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7822
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7823
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7824
jal log_test_assert_equal
# Case 56: Scoring 4 lines at level 5
log_test_case_056:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 4
li $a1, 5
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7825
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7826
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7827
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7828
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7829
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7830
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7831
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7832
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7833
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7834
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7835
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 4000
li $a2, 7836
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7837
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 5234
li $a2, 7838
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7839
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 4
li $a2, 7840
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 5
li $a2, 7841
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7842
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7843
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7844
jal log_test_assert_equal
# Case 57: Scoring 0 lines at level 6
log_test_case_057:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 6
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7845
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7846
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7847
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7848
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7849
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7850
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7851
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7852
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7853
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7854
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7855
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 7856
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7857
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7858
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7859
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 0
li $a2, 7860
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 6
li $a2, 7861
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7862
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7863
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7864
jal log_test_assert_equal
# Case 58: Scoring 1 lines at level 6
log_test_case_058:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 6
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7865
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7866
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7867
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7868
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7869
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7870
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7871
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7872
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7873
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7874
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7875
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 600
li $a2, 7876
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7877
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1834
li $a2, 7878
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7879
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 1
li $a2, 7880
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 6
li $a2, 7881
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7882
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7883
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7884
jal log_test_assert_equal
# Case 59: Scoring 2 lines at level 6
log_test_case_059:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 2
li $a1, 6
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7885
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7886
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7887
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7888
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7889
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7890
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7891
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7892
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7893
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7894
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7895
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1800
li $a2, 7896
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7897
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 3034
li $a2, 7898
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7899
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 2
li $a2, 7900
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 6
li $a2, 7901
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7902
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7903
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7904
jal log_test_assert_equal
# Case 60: Scoring 3 lines at level 6
log_test_case_060:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 3
li $a1, 6
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7905
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7906
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7907
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7908
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7909
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7910
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7911
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7912
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7913
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7914
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7915
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 3000
li $a2, 7916
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7917
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 4234
li $a2, 7918
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7919
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 3
li $a2, 7920
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 6
li $a2, 7921
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7922
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7923
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7924
jal log_test_assert_equal
# Case 61: Scoring 4 lines at level 6
log_test_case_061:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 4
li $a1, 6
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7925
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7926
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7927
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7928
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7929
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7930
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7931
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7932
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7933
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7934
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7935
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 4800
li $a2, 7936
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7937
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 6034
li $a2, 7938
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7939
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 4
li $a2, 7940
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 6
li $a2, 7941
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7942
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7943
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7944
jal log_test_assert_equal
# Case 62: Scoring 0 lines at level 7
log_test_case_062:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 7
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7945
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7946
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7947
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7948
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7949
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7950
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7951
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7952
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7953
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7954
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7955
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 7956
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7957
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7958
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7959
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 0
li $a2, 7960
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 7
li $a2, 7961
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7962
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7963
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7964
jal log_test_assert_equal
# Case 63: Scoring 1 lines at level 7
log_test_case_063:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 7
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7965
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7966
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7967
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7968
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7969
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7970
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7971
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7972
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7973
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7974
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7975
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 700
li $a2, 7976
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7977
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1934
li $a2, 7978
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7979
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 1
li $a2, 7980
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 7
li $a2, 7981
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 7982
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 7983
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 7984
jal log_test_assert_equal
# Case 64: Scoring 2 lines at level 7
log_test_case_064:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 2
li $a1, 7
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 7985
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7986
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7987
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7988
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7989
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7990
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7991
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7992
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7993
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7994
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7995
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 2100
li $a2, 7996
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7997
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 3334
li $a2, 7998
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 7999
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 2
li $a2, 8000
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 7
li $a2, 8001
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8002
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8003
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8004
jal log_test_assert_equal
# Case 65: Scoring 3 lines at level 7
log_test_case_065:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 3
li $a1, 7
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8005
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8006
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8007
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8008
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8009
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8010
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8011
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8012
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8013
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8014
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8015
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 3500
li $a2, 8016
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8017
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 4734
li $a2, 8018
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8019
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 3
li $a2, 8020
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 7
li $a2, 8021
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8022
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8023
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8024
jal log_test_assert_equal
# Case 66: Scoring 4 lines at level 7
log_test_case_066:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 4
li $a1, 7
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8025
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8026
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8027
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8028
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8029
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8030
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8031
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8032
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8033
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8034
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8035
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 5600
li $a2, 8036
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8037
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 6834
li $a2, 8038
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8039
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 4
li $a2, 8040
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 7
li $a2, 8041
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8042
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8043
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8044
jal log_test_assert_equal
# Case 67: Scoring 0 lines at level 8
log_test_case_067:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 8
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8045
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8046
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8047
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8048
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8049
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8050
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8051
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8052
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8053
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8054
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8055
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8056
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8057
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8058
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8059
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 0
li $a2, 8060
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 8
li $a2, 8061
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8062
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8063
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8064
jal log_test_assert_equal
# Case 68: Scoring 1 lines at level 8
log_test_case_068:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 8
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8065
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8066
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8067
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8068
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8069
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8070
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8071
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8072
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8073
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8074
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8075
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 800
li $a2, 8076
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8077
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2034
li $a2, 8078
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8079
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 1
li $a2, 8080
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 8
li $a2, 8081
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8082
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8083
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8084
jal log_test_assert_equal
# Case 69: Scoring 2 lines at level 8
log_test_case_069:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 2
li $a1, 8
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8085
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8086
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8087
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8088
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8089
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8090
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8091
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8092
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8093
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8094
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8095
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 2400
li $a2, 8096
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8097
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 3634
li $a2, 8098
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8099
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 2
li $a2, 8100
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 8
li $a2, 8101
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8102
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8103
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8104
jal log_test_assert_equal
# Case 70: Scoring 3 lines at level 8
log_test_case_070:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 3
li $a1, 8
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8105
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8106
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8107
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8108
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8109
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8110
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8111
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8112
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8113
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8114
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8115
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 4000
li $a2, 8116
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8117
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 5234
li $a2, 8118
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8119
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 3
li $a2, 8120
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 8
li $a2, 8121
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8122
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8123
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8124
jal log_test_assert_equal
# Case 71: Scoring 4 lines at level 8
log_test_case_071:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 4
li $a1, 8
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8125
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8126
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8127
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8128
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8129
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8130
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8131
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8132
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8133
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8134
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8135
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 6400
li $a2, 8136
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8137
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 7634
li $a2, 8138
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8139
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 4
li $a2, 8140
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 8
li $a2, 8141
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8142
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8143
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8144
jal log_test_assert_equal
# Case 72: Scoring 0 lines at level 9
log_test_case_072:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 9
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8145
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8146
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8147
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8148
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8149
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8150
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8151
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8152
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8153
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8154
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8155
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8156
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8157
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8158
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8159
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 0
li $a2, 8160
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 9
li $a2, 8161
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8162
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8163
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8164
jal log_test_assert_equal
# Case 73: Scoring 1 lines at level 9
log_test_case_073:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 9
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8165
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8166
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8167
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8168
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8169
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8170
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8171
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8172
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8173
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8174
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8175
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 900
li $a2, 8176
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8177
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2134
li $a2, 8178
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8179
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 1
li $a2, 8180
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 9
li $a2, 8181
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8182
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8183
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8184
jal log_test_assert_equal
# Case 74: Scoring 2 lines at level 9
log_test_case_074:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 2
li $a1, 9
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8185
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8186
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8187
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8188
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8189
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8190
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8191
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8192
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8193
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8194
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8195
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 2700
li $a2, 8196
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8197
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 3934
li $a2, 8198
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8199
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 2
li $a2, 8200
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 9
li $a2, 8201
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8202
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8203
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8204
jal log_test_assert_equal
# Case 75: Scoring 3 lines at level 9
log_test_case_075:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 3
li $a1, 9
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8205
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8206
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8207
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8208
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8209
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8210
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8211
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8212
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8213
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8214
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8215
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 4500
li $a2, 8216
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8217
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 5734
li $a2, 8218
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8219
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 3
li $a2, 8220
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 9
li $a2, 8221
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8222
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8223
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8224
jal log_test_assert_equal
# Case 76: Scoring 4 lines at level 9
log_test_case_076:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 4
li $a1, 9
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8225
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8226
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8227
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8228
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8229
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8230
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8231
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8232
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8233
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8234
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8235
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 7200
li $a2, 8236
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8237
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 8434
li $a2, 8238
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8239
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 4
li $a2, 8240
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 9
li $a2, 8241
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8242
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8243
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8244
jal log_test_assert_equal
# Case 77: Scoring 0 lines at level 10
log_test_case_077:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 10
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8245
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8246
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8247
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8248
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8249
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8250
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8251
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8252
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8253
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8254
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8255
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8256
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8257
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8258
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8259
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 0
li $a2, 8260
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 10
li $a2, 8261
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8262
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8263
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8264
jal log_test_assert_equal
# Case 78: Scoring 1 lines at level 10
log_test_case_078:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 10
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8265
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8266
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8267
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8268
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8269
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8270
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8271
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8272
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8273
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8274
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8275
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1000
li $a2, 8276
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8277
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2234
li $a2, 8278
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8279
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 1
li $a2, 8280
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 10
li $a2, 8281
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8282
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8283
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8284
jal log_test_assert_equal
# Case 79: Scoring 2 lines at level 10
log_test_case_079:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 2
li $a1, 10
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8285
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8286
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8287
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8288
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8289
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8290
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8291
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8292
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8293
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8294
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8295
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 3000
li $a2, 8296
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8297
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 4234
li $a2, 8298
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8299
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 2
li $a2, 8300
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 10
li $a2, 8301
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8302
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8303
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8304
jal log_test_assert_equal
# Case 80: Scoring 3 lines at level 10
log_test_case_080:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 3
li $a1, 10
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8305
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8306
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8307
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8308
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8309
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8310
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8311
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8312
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8313
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8314
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8315
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 5000
li $a2, 8316
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8317
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 6234
li $a2, 8318
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8319
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 3
li $a2, 8320
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 10
li $a2, 8321
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8322
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8323
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8324
jal log_test_assert_equal
# Case 81: Scoring 4 lines at level 10
log_test_case_081:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 4
li $a1, 10
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8325
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8326
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8327
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8328
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8329
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8330
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8331
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8332
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8333
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8334
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8335
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 8000
li $a2, 8336
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8337
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 9234
li $a2, 8338
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8339
jal log_test_assert_equal
lw $a0, log_test_arg0
move $a0, $a0
li $a1, 4
li $a2, 8340
jal log_test_assert_equal
lw $a0, log_test_arg1
move $a0, $a0
li $a1, 10
li $a2, 8341
jal log_test_assert_equal
lw $a0, log_test_arg2
move $a0, $a0
li $a1, 2222
li $a2, 8342
jal log_test_assert_equal
lw $a0, log_test_arg3
move $a0, $a0
li $a1, 3333
li $a2, 8343
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 200($t8)
move $a0, $a0
li $a1, 6
li $a2, 8344
jal log_test_assert_equal
# Case 82: Invalid scoring arguments -1, 1
log_test_case_082:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, -1
li $a1, 1
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8345
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8346
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8347
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8348
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8349
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8350
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8351
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8352
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8353
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8354
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8355
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8356
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 8357
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8358
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8359
jal log_test_assert_equal
# Case 83: Invalid scoring arguments 5, 1
log_test_case_083:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 5
li $a1, 1
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8360
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8361
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8362
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8363
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8364
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8365
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8366
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8367
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8368
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8369
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8370
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8371
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 8372
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8373
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8374
jal log_test_assert_equal
# Case 84: Invalid scoring arguments 20, 1
log_test_case_084:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 20
li $a1, 1
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8375
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8376
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8377
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8378
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8379
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8380
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8381
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8382
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8383
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8384
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8385
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8386
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 8387
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8388
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8389
jal log_test_assert_equal
# Case 85: Invalid scoring arguments 1, 0
log_test_case_085:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 0
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8390
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8391
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8392
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8393
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8394
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8395
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8396
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8397
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8398
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8399
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8400
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8401
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 8402
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8403
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8404
jal log_test_assert_equal
# Case 86: Invalid scoring arguments 1, -1
log_test_case_086:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, -1
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8405
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8406
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8407
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8408
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8409
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8410
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8411
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8412
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8413
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8414
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8415
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8416
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 8417
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8418
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8419
jal log_test_assert_equal
# Case 87: Invalid scoring arguments 1, 11
log_test_case_087:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 1
li $a1, 11
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8420
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8421
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8422
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8423
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8424
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8425
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8426
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8427
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8428
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8429
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8430
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8431
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 8432
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8433
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8434
jal log_test_assert_equal
# Case 88: Invalid scoring arguments 0, 0
log_test_case_088:
li $t8, 1234
sw $t8, SCORE
li $t8, 17
sw $t8, LINES_CLEARED
li $a0, 0
li $a1, 0
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8435
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8436
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8437
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8438
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8439
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8440
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8441
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8442
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8443
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8444
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8445
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8446
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 8447
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8448
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8449
jal log_test_assert_equal
# Case 89: Consecutive scoring calls add points without changing line totals
log_test_case_089:
li $t8, 0
sw $t8, SCORE
li $a0, 1
li $a1, 2
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8450
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8451
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8452
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8453
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8454
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8455
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8456
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8457
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8458
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8459
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8460
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 200
li $a2, 8461
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8462
jal log_test_assert_equal
li $a0, 2
li $a1, 2
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8463
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8464
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8465
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8466
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8467
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8468
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8469
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8470
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8471
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8472
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8473
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 800
li $a2, 8474
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8475
jal log_test_assert_equal
li $a0, 3
li $a1, 2
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8476
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8477
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8478
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8479
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8480
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8481
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8482
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8483
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8484
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8485
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8486
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1800
li $a2, 8487
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8488
jal log_test_assert_equal
li $a0, 4
li $a1, 2
li $a2, 2222
li $a3, 3333
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8489
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8490
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8491
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8492
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8493
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8494
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8495
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8496
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8497
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8498
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8499
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 3400
li $a2, 8500
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 17
li $a2, 8501
jal log_test_assert_equal
# Case 90: Aggregate clearing and one scoring call: 0 lines, supplied level 1
log_test_case_090:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8502
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8503
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8504
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8505
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8506
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8507
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8508
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8509
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8510
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8511
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8512
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8513
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8514
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8515
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8516
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8517
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8518
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8519
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8520
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8521
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8522
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8523
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8524
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 8525
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 8526
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_021
li $a1, 200
li $a2, 8527
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 1
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8727
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8728
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8729
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8730
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8731
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8732
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8733
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8734
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8735
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8736
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8737
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8738
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8739
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 8740
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 8741
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8742
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8743
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8744
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8745
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8746
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8747
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8748
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8749
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8750
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8751
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8752
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 8753
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 8754
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 8755
jal log_test_assert_equal
# Case 91: Aggregate clearing and one scoring call: 1 lines, supplied level 1
log_test_case_091:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8756
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8757
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8758
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8759
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8760
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8761
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8762
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8763
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8764
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8765
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8766
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8767
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8768
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8769
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8770
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8771
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8772
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8773
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8774
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8775
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8776
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8777
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 8778
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 8
li $a2, 8779
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 8780
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_022
li $a1, 200
li $a2, 8781
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 1
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8981
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8982
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8983
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8984
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8985
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8986
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8987
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8988
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8989
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8990
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8991
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 100
li $a2, 8992
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8993
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1100
li $a2, 8994
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 8
li $a2, 8995
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 8996
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8997
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8998
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8999
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9000
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9001
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9002
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9003
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9004
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9005
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9006
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 9007
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 8
li $a2, 9008
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1100
li $a2, 9009
jal log_test_assert_equal
# Case 92: Aggregate clearing and one scoring call: 2 lines, supplied level 1
log_test_case_092:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9010
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9011
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9012
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9013
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9014
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9015
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9016
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9017
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9018
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9019
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9020
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9021
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9022
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9023
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9024
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9025
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9026
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9027
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9028
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9029
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9030
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9031
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 2
li $a2, 9032
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 9
li $a2, 9033
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 9034
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_023
li $a1, 200
li $a2, 9035
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 1
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9235
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9236
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9237
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9238
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9239
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9240
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9241
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9242
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9243
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9244
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9245
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 300
li $a2, 9246
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 9247
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1300
li $a2, 9248
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 9
li $a2, 9249
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9250
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9251
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9252
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9253
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9254
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9255
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9256
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9257
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9258
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9259
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9260
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 9261
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 9
li $a2, 9262
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1300
li $a2, 9263
jal log_test_assert_equal
# Case 93: Aggregate clearing and one scoring call: 3 lines, supplied level 1
log_test_case_093:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9264
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9265
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9266
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9267
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9268
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9269
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9270
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9271
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9272
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9273
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9274
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9275
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9276
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9277
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9278
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9279
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9280
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9281
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9282
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9283
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9284
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9285
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 3
li $a2, 9286
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 10
li $a2, 9287
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 9288
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 9289
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 1
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9489
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9490
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9491
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9492
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9493
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9494
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9495
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9496
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9497
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9498
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9499
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 500
li $a2, 9500
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 9501
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1500
li $a2, 9502
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 10
li $a2, 9503
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9504
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9505
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9506
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9507
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9508
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9509
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9510
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9511
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9512
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9513
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9514
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 9515
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 10
li $a2, 9516
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1500
li $a2, 9517
jal log_test_assert_equal
# Case 94: Aggregate clearing and one scoring call: 4 lines, supplied level 1
log_test_case_094:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9518
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9519
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9520
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9521
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9522
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9523
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9524
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9525
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9526
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9527
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9528
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 640($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 644($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 648($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 652($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 656($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 660($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 664($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 668($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 672($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 676($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9529
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9530
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9531
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9532
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9533
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9534
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9535
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9536
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9537
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9538
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9539
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 4
li $a2, 9540
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 9541
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 9542
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_025
li $a1, 200
li $a2, 9543
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 1
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9743
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9744
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9745
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9746
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9747
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9748
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9749
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9750
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9751
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9752
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9753
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 800
li $a2, 9754
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 9755
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1800
li $a2, 9756
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 9757
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9758
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9759
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9760
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9761
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9762
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9763
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9764
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9765
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9766
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9767
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9768
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 9769
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 9770
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1800
li $a2, 9771
jal log_test_assert_equal
# Case 95: Aggregate clearing and one scoring call: 0 lines, supplied level 2
log_test_case_095:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9772
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9773
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9774
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9775
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9776
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9777
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9778
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9779
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9780
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9781
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9782
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9783
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9784
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9785
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9786
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9787
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9788
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9789
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9790
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9791
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9792
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9793
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 9794
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 9795
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 9796
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_021
li $a1, 200
li $a2, 9797
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 2
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 9997
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9998
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9999
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10000
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10001
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10002
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10003
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10004
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10005
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10006
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10007
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 10008
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 10009
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 10010
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 10011
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10012
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10013
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10014
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10015
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10016
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10017
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10018
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10019
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10020
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10021
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10022
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 10023
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 10024
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 10025
jal log_test_assert_equal
# Case 96: Aggregate clearing and one scoring call: 1 lines, supplied level 2
log_test_case_096:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10026
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10027
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10028
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10029
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10030
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10031
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10032
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10033
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10034
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10035
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10036
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10037
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10038
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10039
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10040
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10041
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10042
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10043
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10044
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10045
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10046
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10047
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 10048
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 8
li $a2, 10049
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 10050
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_022
li $a1, 200
li $a2, 10051
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 2
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10251
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10252
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10253
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10254
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10255
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10256
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10257
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10258
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10259
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10260
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10261
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 200
li $a2, 10262
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 10263
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1200
li $a2, 10264
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 8
li $a2, 10265
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10266
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10267
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10268
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10269
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10270
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10271
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10272
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10273
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10274
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10275
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10276
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 10277
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 8
li $a2, 10278
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1200
li $a2, 10279
jal log_test_assert_equal
# Case 97: Aggregate clearing and one scoring call: 2 lines, supplied level 2
log_test_case_097:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10280
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10281
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10282
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10283
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10284
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10285
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10286
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10287
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10288
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10289
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10290
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10291
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10292
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10293
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10294
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10295
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10296
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10297
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10298
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10299
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10300
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10301
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 2
li $a2, 10302
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 9
li $a2, 10303
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 10304
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_023
li $a1, 200
li $a2, 10305
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 2
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10505
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10506
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10507
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10508
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10509
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10510
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10511
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10512
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10513
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10514
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10515
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 600
li $a2, 10516
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 10517
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1600
li $a2, 10518
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 9
li $a2, 10519
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10520
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10521
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10522
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10523
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10524
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10525
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10526
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10527
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10528
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10529
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10530
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 10531
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 9
li $a2, 10532
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1600
li $a2, 10533
jal log_test_assert_equal
# Case 98: Aggregate clearing and one scoring call: 3 lines, supplied level 2
log_test_case_098:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10534
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10535
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10536
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10537
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10538
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10539
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10540
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10541
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10542
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10543
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10544
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10545
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10546
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10547
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10548
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10549
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10550
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10551
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10552
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10553
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10554
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10555
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 3
li $a2, 10556
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 10
li $a2, 10557
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 10558
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 10559
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 2
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10759
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10760
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10761
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10762
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10763
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10764
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10765
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10766
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10767
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10768
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10769
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1000
li $a2, 10770
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 10771
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2000
li $a2, 10772
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 10
li $a2, 10773
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10774
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10775
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10776
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10777
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10778
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10779
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10780
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10781
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10782
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10783
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10784
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 10785
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 10
li $a2, 10786
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2000
li $a2, 10787
jal log_test_assert_equal
# Case 99: Aggregate clearing and one scoring call: 4 lines, supplied level 2
log_test_case_099:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10788
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10789
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10790
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10791
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10792
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10793
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10794
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10795
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10796
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10797
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10798
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 640($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 644($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 648($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 652($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 656($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 660($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 664($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 668($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 672($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 676($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 10799
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10800
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10801
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10802
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10803
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10804
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10805
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10806
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10807
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10808
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10809
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 4
li $a2, 10810
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 10811
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 10812
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_025
li $a1, 200
li $a2, 10813
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 2
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11013
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11014
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11015
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11016
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11017
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11018
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11019
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11020
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11021
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11022
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11023
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1600
li $a2, 11024
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 11025
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2600
li $a2, 11026
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 11027
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11028
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11029
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11030
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11031
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11032
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11033
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11034
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11035
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11036
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11037
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11038
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 11039
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 11040
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2600
li $a2, 11041
jal log_test_assert_equal
# Case 100: Aggregate clearing and one scoring call: 0 lines, supplied level 10
log_test_case_100:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11042
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11043
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11044
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11045
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11046
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11047
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11048
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11049
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11050
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11051
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11052
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11053
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11054
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11055
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11056
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11057
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11058
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11059
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11060
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11061
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11062
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11063
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 11064
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 11065
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 11066
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_021
li $a1, 200
li $a2, 11067
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 10
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11267
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11268
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11269
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11270
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11271
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11272
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11273
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11274
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11275
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11276
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11277
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 11278
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 11279
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 11280
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 11281
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11282
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11283
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11284
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11285
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11286
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11287
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11288
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11289
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11290
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11291
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11292
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 11293
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 11294
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 11295
jal log_test_assert_equal
# Case 101: Aggregate clearing and one scoring call: 1 lines, supplied level 10
log_test_case_101:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11296
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11297
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11298
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11299
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11300
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11301
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11302
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11303
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11304
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11305
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11306
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11307
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11308
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11309
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11310
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11311
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11312
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11313
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11314
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11315
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11316
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11317
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 11318
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 8
li $a2, 11319
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 11320
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_022
li $a1, 200
li $a2, 11321
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 10
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11521
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11522
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11523
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11524
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11525
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11526
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11527
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11528
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11529
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11530
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11531
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1000
li $a2, 11532
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 11533
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2000
li $a2, 11534
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 8
li $a2, 11535
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11536
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11537
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11538
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11539
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11540
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11541
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11542
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11543
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11544
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11545
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11546
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 11547
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 8
li $a2, 11548
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2000
li $a2, 11549
jal log_test_assert_equal
# Case 102: Aggregate clearing and one scoring call: 2 lines, supplied level 10
log_test_case_102:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11550
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11551
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11552
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11553
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11554
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11555
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11556
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11557
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11558
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11559
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11560
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11561
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11562
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11563
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11564
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11565
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11566
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11567
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11568
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11569
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11570
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11571
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 2
li $a2, 11572
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 9
li $a2, 11573
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 11574
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_023
li $a1, 200
li $a2, 11575
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 10
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11775
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11776
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11777
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11778
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11779
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11780
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11781
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11782
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11783
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11784
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11785
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 3000
li $a2, 11786
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 11787
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 4000
li $a2, 11788
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 9
li $a2, 11789
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11790
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11791
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11792
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11793
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11794
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11795
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11796
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11797
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11798
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11799
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11800
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 11801
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 9
li $a2, 11802
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 4000
li $a2, 11803
jal log_test_assert_equal
# Case 103: Aggregate clearing and one scoring call: 3 lines, supplied level 10
log_test_case_103:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11804
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11805
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11806
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11807
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11808
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11809
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11810
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11811
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11812
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11813
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11814
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 11815
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11816
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11817
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11818
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11819
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11820
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11821
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11822
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11823
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11824
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11825
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 3
li $a2, 11826
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 10
li $a2, 11827
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 11828
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 11829
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 10
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 12029
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12030
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12031
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12032
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12033
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12034
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12035
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12036
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12037
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12038
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12039
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 5000
li $a2, 12040
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 12041
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 6000
li $a2, 12042
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 10
li $a2, 12043
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 12044
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12045
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12046
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12047
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12048
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12049
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12050
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12051
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12052
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12053
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12054
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 12055
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 10
li $a2, 12056
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 6000
li $a2, 12057
jal log_test_assert_equal
# Case 104: Aggregate clearing and one scoring call: 4 lines, supplied level 10
log_test_case_104:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 12058
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12059
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12060
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12061
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12062
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12063
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12064
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12065
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12066
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12067
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12068
jal log_test_assert_equal
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 640($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 644($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 648($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 652($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 656($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 660($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 664($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 668($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 672($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 676($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 796($t8)
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 12069
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12070
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12071
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12072
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12073
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12074
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12075
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12076
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12077
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12078
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12079
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 4
li $a2, 12080
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 12081
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1000
li $a2, 12082
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_025
li $a1, 200
li $a2, 12083
jal log_test_assert_board
lw $a0, log_test_last_v0
li $a1, 10
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 12283
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12284
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12285
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12286
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12287
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12288
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12289
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12290
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12291
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12292
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12293
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 8000
li $a2, 12294
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 12295
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 9000
li $a2, 12296
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 12297
jal log_test_assert_equal
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
sw $a0, log_test_arg0
sw $a1, log_test_arg1
sw $a2, log_test_arg2
sw $a3, log_test_arg3
move $a0, $s0
li $a1, 1000
li $a2, 12298
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12299
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12300
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12301
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12302
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12303
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12304
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12305
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12306
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12307
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12308
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 12309
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 12310
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 9000
li $a2, 12311
jal log_test_assert_equal
li $v0, 4
la $a0, log_test_pass_msg
syscall
li $v0, 1
lw $a0, log_test_assertions
syscall
li $v0, 4
la $a0, log_test_newline
syscall
li $a0, 0
li $v0, 17
syscall
# Assertion helper: a0 actual, a1 expected, a2 ID. Preserves saved registers.

.data
.align 2
log_test_expected_board_001:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 1, 1, 1, 1, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_002:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_003:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 2, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 2, 2, 2, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_004:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 2, 2, 0, 0, 0, 0
    .word 0, 0, 0, 0, 2, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 2, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_005:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 2, 2, 2, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 2, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_006:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 2, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 2, 0, 0, 0, 0, 0
    .word 0, 0, 0, 2, 2, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_007:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 3, 0, 0, 0, 0
    .word 0, 0, 0, 3, 3, 3, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_008:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 3, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 3, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 3, 3, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_009:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 3, 3, 3, 0, 0, 0, 0
    .word 0, 0, 0, 3, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_010:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 3, 3, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 3, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 3, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_011:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 4, 4, 0, 0, 0, 0, 0
    .word 0, 0, 0, 4, 4, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_012:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 5, 5, 0, 0, 0, 0
    .word 0, 0, 0, 5, 5, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_013:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 5, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 5, 5, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 5, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_014:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 6, 6, 6, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_015:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 6, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_016:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 6, 6, 6, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_017:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 6, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_018:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 7, 7, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 7, 7, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_019:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 7, 0, 0, 0, 0, 0
    .word 0, 0, 0, 7, 7, 0, 0, 0, 0, 0
    .word 0, 0, 0, 7, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_020:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_021:
    .word 7, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_022:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 7, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_023:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 7, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_024:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 7, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_025:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 7, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.include "../../logica.asm"
.include "aserciones.asm"
