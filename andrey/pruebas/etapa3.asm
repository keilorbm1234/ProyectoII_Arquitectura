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
# Case 1: Hard drop type 0, orientation 0 onto an empty floor
log_test_case_001:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
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
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
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
li $a1, 18
li $a2, 23
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 24
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 25
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 26
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 27
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 28
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 29
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 30
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 31
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_001
li $a1, 200
li $a2, 32
jal log_test_assert_board
# Case 2: Hard drop type 0, orientation 1 onto an empty floor
log_test_case_002:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 232
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 233
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 234
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 235
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 236
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 237
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 238
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 239
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 240
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 241
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 242
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 243
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 244
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 245
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 246
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 247
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 248
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 249
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 250
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 251
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 252
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 253
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 16
li $a2, 254
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 255
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 256
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 257
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 258
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 16
li $a2, 259
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 260
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 261
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 262
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_002
li $a1, 200
li $a2, 263
jal log_test_assert_board
# Case 3: Hard drop type 0, orientation 2 onto an empty floor
log_test_case_003:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 463
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 464
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 465
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 466
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 467
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 468
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 469
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 470
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 471
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 472
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 473
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 474
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 475
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 476
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 477
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 478
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 479
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 480
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 481
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 482
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 483
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 484
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 485
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 486
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 487
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 488
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 489
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 490
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 491
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 492
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 493
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_001
li $a1, 200
li $a2, 494
jal log_test_assert_board
# Case 4: Hard drop type 0, orientation 3 onto an empty floor
log_test_case_004:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 694
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 695
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 696
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 697
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 698
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 699
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 700
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 701
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 702
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 703
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 704
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 705
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 706
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 707
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 708
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 709
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 710
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 711
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 712
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 713
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 714
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 715
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 16
li $a2, 716
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 717
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 718
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 719
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 720
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 16
li $a2, 721
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 722
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 723
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 724
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_002
li $a1, 200
li $a2, 725
jal log_test_assert_board
# Case 5: Hard drop type 1, orientation 0 onto an empty floor
log_test_case_005:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 925
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 926
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 927
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 928
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 929
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 930
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 931
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 932
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 933
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 934
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 935
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 936
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 937
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 938
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 939
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 940
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 941
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 942
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 943
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 944
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 945
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 946
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 947
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 948
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 949
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 950
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 951
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 952
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 953
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 954
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 955
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_003
li $a1, 200
li $a2, 956
jal log_test_assert_board
# Case 6: Hard drop type 1, orientation 1 onto an empty floor
log_test_case_006:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 1156
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1157
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1158
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1159
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1160
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1161
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1162
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1163
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1164
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1165
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1166
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 1167
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1168
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1169
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1170
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1171
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1172
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1173
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1174
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1175
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1176
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1177
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 1178
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 1179
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 1180
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 1181
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 1182
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 1183
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 1184
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 1185
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 1186
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_004
li $a1, 200
li $a2, 1187
jal log_test_assert_board
# Case 7: Hard drop type 1, orientation 2 onto an empty floor
log_test_case_007:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 1387
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1388
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1389
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1390
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1391
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1392
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1393
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1394
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1395
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1396
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1397
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 1398
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1399
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1400
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1401
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1402
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1403
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1404
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1405
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1406
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1407
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1408
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 1409
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 1410
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 1411
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 1412
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 1413
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 1414
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 1415
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 1416
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 1417
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_005
li $a1, 200
li $a2, 1418
jal log_test_assert_board
# Case 8: Hard drop type 1, orientation 3 onto an empty floor
log_test_case_008:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 1618
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1619
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1620
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1621
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1622
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1623
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1624
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1625
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1626
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1627
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1628
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 1629
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1630
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1631
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1632
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1633
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1634
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1635
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1636
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1637
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1638
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1639
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 1640
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 1641
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 1642
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 1643
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 1644
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 1645
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 1646
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 1647
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 1648
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_006
li $a1, 200
li $a2, 1649
jal log_test_assert_board
# Case 9: Hard drop type 2, orientation 0 onto an empty floor
log_test_case_009:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 1849
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1850
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1851
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1852
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1853
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1854
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1855
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1856
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1857
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1858
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1859
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 1860
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1861
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1862
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1863
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1864
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1865
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1866
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1867
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1868
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1869
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1870
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 1871
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 1872
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 1873
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 1874
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 1875
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 1876
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 1877
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 1878
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 1879
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_007
li $a1, 200
li $a2, 1880
jal log_test_assert_board
# Case 10: Hard drop type 2, orientation 1 onto an empty floor
log_test_case_010:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 2080
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2081
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2082
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2083
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2084
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2085
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2086
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2087
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2088
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2089
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2090
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 2091
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2092
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2093
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2094
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2095
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2096
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2097
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2098
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2099
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2100
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2101
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 2102
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 2103
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 2104
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 2105
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 2106
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 2107
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 2108
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 2109
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 2110
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_008
li $a1, 200
li $a2, 2111
jal log_test_assert_board
# Case 11: Hard drop type 2, orientation 2 onto an empty floor
log_test_case_011:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 2311
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2312
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2313
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2314
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2315
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2316
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2317
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2318
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2319
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2320
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2321
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 2322
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2323
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2324
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2325
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2326
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2327
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2328
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2329
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2330
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2331
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2332
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 2333
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 2334
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 2335
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 2336
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 2337
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 2338
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 2339
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 2340
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 2341
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_009
li $a1, 200
li $a2, 2342
jal log_test_assert_board
# Case 12: Hard drop type 2, orientation 3 onto an empty floor
log_test_case_012:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 2542
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2543
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2544
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2545
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2546
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2547
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2548
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2549
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2550
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2551
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2552
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 2553
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2554
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2555
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2556
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2557
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2558
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2559
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2560
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2561
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2562
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2563
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 2564
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 2565
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 2566
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 2567
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 2568
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 2569
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 2570
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 2571
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 2572
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_010
li $a1, 200
li $a2, 2573
jal log_test_assert_board
# Case 13: Hard drop type 3, orientation 0 onto an empty floor
log_test_case_013:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 2773
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2774
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2775
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2776
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2777
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2778
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2779
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2780
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2781
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2782
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2783
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 2784
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2785
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2786
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2787
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2788
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2789
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2790
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2791
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2792
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2793
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2794
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 2795
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 2796
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 2797
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 2798
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 2799
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 2800
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 2801
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 2802
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 2803
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 2804
jal log_test_assert_board
# Case 14: Hard drop type 3, orientation 1 onto an empty floor
log_test_case_014:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 3004
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3005
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3006
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3007
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3008
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3009
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3010
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3011
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3012
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3013
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3014
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 3015
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3016
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3017
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3018
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3019
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3020
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3021
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3022
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3023
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3024
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3025
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 3026
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 3027
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 3028
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 3029
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 3030
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 3031
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 3032
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 3033
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 3034
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 3035
jal log_test_assert_board
# Case 15: Hard drop type 3, orientation 2 onto an empty floor
log_test_case_015:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 3235
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3236
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3237
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3238
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3239
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3240
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3241
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3242
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3243
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3244
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3245
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 3246
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3247
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3248
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3249
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3250
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3251
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3252
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3253
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3254
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3255
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3256
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 3257
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 3258
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 3259
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 3260
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 3261
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 3262
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 3263
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 3264
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 3265
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 3266
jal log_test_assert_board
# Case 16: Hard drop type 3, orientation 3 onto an empty floor
log_test_case_016:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 3466
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3467
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3468
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3469
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3470
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3471
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3472
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3473
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3474
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3475
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3476
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 3477
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3478
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3479
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3480
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3481
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3482
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3483
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3484
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3485
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3486
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3487
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 3488
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 3489
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 3490
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 3491
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 3492
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 3493
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 3494
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 3495
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 3496
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 3497
jal log_test_assert_board
# Case 17: Hard drop type 4, orientation 0 onto an empty floor
log_test_case_017:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 3697
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3698
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3699
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3700
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3701
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3702
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3703
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3704
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3705
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3706
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3707
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 3708
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3709
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3710
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3711
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3712
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3713
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3714
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3715
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3716
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3717
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3718
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 3719
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 3720
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 3721
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 3722
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 3723
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 3724
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 3725
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 3726
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 3727
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_012
li $a1, 200
li $a2, 3728
jal log_test_assert_board
# Case 18: Hard drop type 4, orientation 1 onto an empty floor
log_test_case_018:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 3928
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3929
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3930
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3931
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3932
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3933
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3934
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3935
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3936
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3937
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3938
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 3939
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3940
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3941
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3942
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3943
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3944
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3945
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3946
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3947
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3948
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3949
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 3950
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 3951
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 3952
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 3953
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 3954
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 3955
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 3956
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 3957
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 3958
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_013
li $a1, 200
li $a2, 3959
jal log_test_assert_board
# Case 19: Hard drop type 4, orientation 2 onto an empty floor
log_test_case_019:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 4159
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4160
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4161
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4162
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4163
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4164
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4165
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4166
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4167
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4168
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4169
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 4170
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4171
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4172
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4173
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4174
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4175
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4176
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4177
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4178
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4179
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4180
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 4181
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 4182
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 4183
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 4184
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 4185
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 4186
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 4187
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 4188
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 4189
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_012
li $a1, 200
li $a2, 4190
jal log_test_assert_board
# Case 20: Hard drop type 4, orientation 3 onto an empty floor
log_test_case_020:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 4390
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4391
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4392
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4393
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4394
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4395
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4396
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4397
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4398
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4399
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4400
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 4401
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4402
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4403
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4404
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4405
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4406
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4407
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4408
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4409
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4410
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4411
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 4412
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 4413
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 4414
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 4415
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 4416
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 4417
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 4418
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 4419
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 4420
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_013
li $a1, 200
li $a2, 4421
jal log_test_assert_board
# Case 21: Hard drop type 5, orientation 0 onto an empty floor
log_test_case_021:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 4621
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4622
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4623
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4624
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4625
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4626
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4627
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4628
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4629
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4630
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4631
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 4632
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4633
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4634
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4635
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4636
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4637
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4638
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4639
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4640
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4641
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4642
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 4643
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 4644
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 4645
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 4646
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 4647
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 4648
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 4649
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 4650
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 4651
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_014
li $a1, 200
li $a2, 4652
jal log_test_assert_board
# Case 22: Hard drop type 5, orientation 1 onto an empty floor
log_test_case_022:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 4852
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4853
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4854
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4855
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4856
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4857
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4858
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4859
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4860
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4861
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4862
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 4863
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4864
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4865
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4866
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4867
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4868
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4869
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4870
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4871
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4872
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4873
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 4874
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 4875
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 4876
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 4877
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 4878
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 4879
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 4880
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 4881
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 4882
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_015
li $a1, 200
li $a2, 4883
jal log_test_assert_board
# Case 23: Hard drop type 5, orientation 2 onto an empty floor
log_test_case_023:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 5083
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5084
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5085
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5086
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5087
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5088
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5089
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5090
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5091
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5092
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5093
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 5094
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5095
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5096
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5097
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5098
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5099
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5100
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5101
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5102
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5103
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5104
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 5105
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 5106
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 5107
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 5108
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 5109
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 5110
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 5111
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 5112
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 5113
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_016
li $a1, 200
li $a2, 5114
jal log_test_assert_board
# Case 24: Hard drop type 5, orientation 3 onto an empty floor
log_test_case_024:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 5314
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5315
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5316
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5317
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5318
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5319
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5320
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5321
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5322
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5323
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5324
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 5325
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5326
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5327
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5328
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5329
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5330
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5331
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5332
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5333
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5334
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5335
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 5336
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 5337
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 5338
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 5339
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 5340
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 5341
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 5342
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 5343
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 5344
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_017
li $a1, 200
li $a2, 5345
jal log_test_assert_board
# Case 25: Hard drop type 6, orientation 0 onto an empty floor
log_test_case_025:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 5545
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5546
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5547
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5548
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5549
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5550
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5551
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5552
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5553
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5554
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5555
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 5556
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5557
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5558
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5559
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5560
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5561
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5562
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5563
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5564
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5565
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5566
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 5567
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 5568
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 5569
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 5570
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 5571
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 5572
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 5573
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 5574
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 5575
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_018
li $a1, 200
li $a2, 5576
jal log_test_assert_board
# Case 26: Hard drop type 6, orientation 1 onto an empty floor
log_test_case_026:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 5776
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5777
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5778
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5779
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5780
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5781
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5782
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5783
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5784
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5785
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5786
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 5787
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 5788
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 5789
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 5790
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 5791
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 5792
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 5793
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 5794
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 5795
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5796
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 5797
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 5798
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 5799
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 5800
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 5801
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 5802
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 5803
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 5804
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 5805
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 5806
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_019
li $a1, 200
li $a2, 5807
jal log_test_assert_board
# Case 27: Hard drop type 6, orientation 2 onto an empty floor
log_test_case_027:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 6007
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6008
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6009
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6010
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6011
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6012
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6013
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6014
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6015
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6016
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6017
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 6018
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6019
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6020
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6021
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6022
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6023
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6024
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6025
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6026
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6027
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6028
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 18
li $a2, 6029
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 6030
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 6031
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 6032
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 6033
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 6034
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 6035
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 6036
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 6037
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_018
li $a1, 200
li $a2, 6038
jal log_test_assert_board
# Case 28: Hard drop type 6, orientation 3 onto an empty floor
log_test_case_028:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 6238
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6239
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6240
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6241
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6242
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6243
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6244
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6245
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6246
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6247
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6248
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 6249
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6250
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6251
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6252
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6253
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6254
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6255
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6256
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6257
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6258
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6259
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 17
li $a2, 6260
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 6261
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 6262
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 6263
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 6264
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 17
li $a2, 6265
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 6266
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 6267
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 6268
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_019
li $a1, 200
li $a2, 6269
jal log_test_assert_board
# Case 29: O stops above a fixed block
log_test_case_029:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 6469
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6470
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6471
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6472
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6473
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6474
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6475
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6476
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6477
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6478
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6479
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 412($t8)
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 6480
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6481
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6482
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6483
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6484
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6485
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6486
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6487
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6488
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6489
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6490
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 8
li $a2, 6491
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 6492
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 6493
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 6494
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 6495
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 8
li $a2, 6496
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 6497
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 6498
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 6499
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_020
li $a1, 200
li $a2, 6500
jal log_test_assert_board
# Case 30: O stops at the first of two separated obstacles
log_test_case_030:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 6700
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6701
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6702
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6703
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6704
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6705
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6706
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6707
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6708
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6709
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6710
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 212($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 612($t8)
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 6711
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6712
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6713
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6714
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6715
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6716
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6717
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6718
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6719
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6720
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6721
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 3
li $a2, 6722
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 6723
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 6724
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 6725
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 6726
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 3
li $a2, 6727
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 6728
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 6729
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 6730
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_021
li $a1, 200
li $a2, 6731
jal log_test_assert_board
# Case 31: Resting O locks with zero distance
log_test_case_031:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 6931
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6932
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6933
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6934
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6935
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6936
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6937
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6938
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6939
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6940
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6941
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 8
sw $t8, CURRENT_PIECE_X
li $t8, 18
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 6942
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 6943
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 6944
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 6945
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 6946
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 6947
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 6948
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 6949
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 6950
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6951
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 6952
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 6953
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 6954
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 6955
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 6956
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 8
li $a2, 6957
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 6958
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 6959
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 6960
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 6961
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_022
li $a1, 200
li $a2, 6962
jal log_test_assert_board
# Case 32: Vertical I stops above a block with ID 7
log_test_case_032:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 7162
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7163
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7164
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7165
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7166
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7167
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7168
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7169
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7170
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7171
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7172
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 416($t8)
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 7173
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7174
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7175
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7176
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7177
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7178
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7179
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7180
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7181
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7182
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7183
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 6
li $a2, 7184
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7185
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 7186
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 7187
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 7188
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 6
li $a2, 7189
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 7190
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7191
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 7192
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_023
li $a1, 200
li $a2, 7193
jal log_test_assert_board
# Case 33: Immediate repeated drop and rotation reject an already locked piece
log_test_case_033:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 7393
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7394
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7395
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7396
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7397
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7398
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7399
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7400
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7401
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7402
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7403
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 7404
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7405
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7406
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7407
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7408
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7409
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7410
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7411
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7412
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7413
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7414
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7415
jal log_test_assert_equal
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 7416
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7417
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7418
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7419
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7420
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7421
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7422
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7423
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7424
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7425
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7426
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 7427
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 7428
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 7429
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 7430
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 7431
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 7432
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 7433
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7434
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 7435
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 7436
jal log_test_assert_board
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 7636
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7637
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7638
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7639
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7640
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7641
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7642
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7643
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7644
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7645
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7646
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 7647
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7648
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 7649
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 7650
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 7651
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 7652
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 7653
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7654
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 7655
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 7656
jal log_test_assert_board
# Case 34: In-place rotation type 0, orientation 0, including wraparound
log_test_case_034:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 7856
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7857
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7858
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7859
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7860
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7861
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7862
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7863
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7864
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7865
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7866
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 7867
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 7868
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 7869
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 7870
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 7871
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 7872
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 7873
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 7874
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 7875
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7876
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 7877
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 7878
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 7879
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 7880
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 7881
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 7882
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 7883
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 7884
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 7885
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 7886
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 7887
jal log_test_assert_board
# Case 35: In-place rotation type 0, orientation 1, including wraparound
log_test_case_035:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 8087
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8088
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8089
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8090
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8091
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8092
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8093
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8094
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8095
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8096
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8097
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 8098
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8099
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8100
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8101
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8102
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8103
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8104
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8105
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8106
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8107
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8108
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 8109
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8110
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 8111
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 8112
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 8113
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 8114
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 8115
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8116
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 8117
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 8118
jal log_test_assert_board
# Case 36: In-place rotation type 0, orientation 2, including wraparound
log_test_case_036:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 8318
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8319
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8320
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8321
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8322
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8323
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8324
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8325
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8326
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8327
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8328
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 8329
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8330
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8331
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8332
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8333
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8334
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8335
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8336
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8337
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8338
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8339
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 8340
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8341
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 8342
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 8343
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 8344
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 8345
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 8346
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8347
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 8348
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 8349
jal log_test_assert_board
# Case 37: In-place rotation type 0, orientation 3, including wraparound
log_test_case_037:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 8549
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8550
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8551
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8552
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8553
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8554
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8555
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8556
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8557
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8558
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8559
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 8560
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8561
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8562
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8563
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8564
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8565
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8566
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8567
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8568
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8569
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8570
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 8571
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8572
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 8573
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 8574
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 8575
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 8576
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 8577
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8578
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 8579
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 8580
jal log_test_assert_board
# Case 38: In-place rotation type 1, orientation 0, including wraparound
log_test_case_038:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 8780
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8781
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8782
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8783
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8784
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8785
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8786
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8787
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8788
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8789
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8790
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 8791
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 8792
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 8793
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 8794
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 8795
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 8796
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 8797
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 8798
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 8799
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8800
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 8801
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 8802
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 8803
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 8804
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 8805
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 8806
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 8807
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 8808
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 8809
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 8810
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 8811
jal log_test_assert_board
# Case 39: In-place rotation type 1, orientation 1, including wraparound
log_test_case_039:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 9011
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9012
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9013
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9014
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9015
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9016
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9017
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9018
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9019
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9020
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9021
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 9022
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9023
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9024
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9025
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9026
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9027
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9028
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9029
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9030
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9031
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9032
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 9033
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 9034
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 9035
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 9036
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 9037
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 9038
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 9039
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 9040
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 9041
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 9042
jal log_test_assert_board
# Case 40: In-place rotation type 1, orientation 2, including wraparound
log_test_case_040:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 9242
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9243
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9244
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9245
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9246
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9247
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9248
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9249
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9250
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9251
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9252
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 9253
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9254
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9255
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9256
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9257
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9258
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9259
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9260
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9261
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9262
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9263
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 9264
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 9265
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 9266
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 9267
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 9268
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 9269
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 9270
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 9271
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 9272
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 9273
jal log_test_assert_board
# Case 41: In-place rotation type 1, orientation 3, including wraparound
log_test_case_041:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 9473
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9474
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9475
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9476
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9477
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9478
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9479
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9480
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9481
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9482
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9483
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 1
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 9484
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9485
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9486
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9487
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9488
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9489
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9490
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9491
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9492
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9493
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9494
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 9495
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 9496
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 1
li $a2, 9497
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 9498
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 9499
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 9500
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 9501
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 9502
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 9503
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 9504
jal log_test_assert_board
# Case 42: In-place rotation type 2, orientation 0, including wraparound
log_test_case_042:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 9704
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9705
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9706
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9707
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9708
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9709
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9710
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9711
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9712
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9713
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9714
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 9715
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9716
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9717
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9718
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9719
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9720
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9721
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9722
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9723
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9724
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9725
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 9726
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 9727
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 9728
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 9729
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 9730
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 9731
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 9732
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 9733
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 9734
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 9735
jal log_test_assert_board
# Case 43: In-place rotation type 2, orientation 1, including wraparound
log_test_case_043:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 9935
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9936
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9937
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9938
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9939
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9940
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9941
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9942
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9943
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9944
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9945
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 9946
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 9947
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 9948
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 9949
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 9950
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 9951
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 9952
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 9953
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 9954
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9955
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 9956
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 9957
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 9958
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 9959
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 9960
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 9961
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 9962
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 9963
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 9964
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 9965
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 9966
jal log_test_assert_board
# Case 44: In-place rotation type 2, orientation 2, including wraparound
log_test_case_044:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 10166
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10167
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10168
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10169
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10170
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10171
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10172
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10173
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10174
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10175
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10176
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 10177
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10178
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10179
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10180
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10181
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10182
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10183
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10184
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10185
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10186
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10187
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 10188
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 10189
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 10190
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 10191
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 10192
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 10193
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 10194
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 10195
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 10196
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 10197
jal log_test_assert_board
# Case 45: In-place rotation type 2, orientation 3, including wraparound
log_test_case_045:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 10397
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10398
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10399
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10400
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10401
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10402
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10403
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10404
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10405
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10406
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10407
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 2
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 10408
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10409
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10410
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10411
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10412
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10413
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10414
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10415
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10416
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10417
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10418
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 10419
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 10420
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 2
li $a2, 10421
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 10422
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 10423
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 10424
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 10425
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 10426
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 10427
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 10428
jal log_test_assert_board
# Case 46: In-place rotation type 3, orientation 0, including wraparound
log_test_case_046:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 10628
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10629
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10630
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10631
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10632
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10633
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10634
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10635
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10636
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10637
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10638
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 10639
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10640
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10641
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10642
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10643
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10644
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10645
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10646
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10647
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10648
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10649
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 10650
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 10651
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 10652
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 10653
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 10654
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 10655
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 10656
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 10657
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 10658
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 10659
jal log_test_assert_board
# Case 47: In-place rotation type 3, orientation 1, including wraparound
log_test_case_047:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 10859
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10860
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10861
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10862
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10863
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10864
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10865
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10866
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10867
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10868
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10869
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 10870
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 10871
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 10872
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 10873
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 10874
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 10875
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 10876
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 10877
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 10878
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10879
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 10880
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 10881
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 10882
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 10883
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 10884
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 10885
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 10886
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 10887
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 10888
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 10889
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 10890
jal log_test_assert_board
# Case 48: In-place rotation type 3, orientation 2, including wraparound
log_test_case_048:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 11090
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11091
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11092
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11093
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11094
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11095
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11096
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11097
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11098
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11099
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11100
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 11101
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11102
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11103
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11104
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11105
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11106
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11107
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11108
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11109
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11110
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11111
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 11112
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 11113
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 11114
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 11115
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 11116
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 11117
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 11118
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 11119
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 11120
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 11121
jal log_test_assert_board
# Case 49: In-place rotation type 3, orientation 3, including wraparound
log_test_case_049:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 11321
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11322
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11323
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11324
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11325
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11326
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11327
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11328
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11329
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11330
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11331
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 11332
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11333
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11334
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11335
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11336
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11337
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11338
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11339
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11340
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11341
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11342
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 11343
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 11344
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 11345
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 11346
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 11347
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 11348
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 11349
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 11350
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 11351
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 11352
jal log_test_assert_board
# Case 50: In-place rotation type 4, orientation 0, including wraparound
log_test_case_050:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 11552
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11553
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11554
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11555
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11556
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11557
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11558
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11559
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11560
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11561
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11562
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 11563
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11564
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11565
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11566
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11567
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11568
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11569
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11570
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11571
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11572
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11573
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 11574
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 11575
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 11576
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 11577
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 11578
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 11579
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 11580
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 11581
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 11582
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 11583
jal log_test_assert_board
# Case 51: In-place rotation type 4, orientation 1, including wraparound
log_test_case_051:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 11783
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11784
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11785
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11786
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11787
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11788
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11789
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11790
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11791
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11792
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11793
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 11794
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 11795
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 11796
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 11797
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 11798
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 11799
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 11800
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 11801
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 11802
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11803
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 11804
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 11805
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 11806
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 11807
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 11808
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 11809
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 11810
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 11811
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 11812
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 11813
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 11814
jal log_test_assert_board
# Case 52: In-place rotation type 4, orientation 2, including wraparound
log_test_case_052:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 12014
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12015
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12016
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12017
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12018
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12019
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12020
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12021
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12022
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12023
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12024
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 12025
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12026
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12027
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12028
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12029
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12030
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12031
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12032
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12033
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12034
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12035
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 12036
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 12037
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 12038
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 12039
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 12040
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 12041
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 12042
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 12043
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 12044
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 12045
jal log_test_assert_board
# Case 53: In-place rotation type 4, orientation 3, including wraparound
log_test_case_053:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 12245
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12246
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12247
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12248
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12249
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12250
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12251
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12252
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12253
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12254
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12255
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 4
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 12256
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12257
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12258
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12259
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12260
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12261
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12262
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12263
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12264
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12265
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12266
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 12267
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 12268
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 4
li $a2, 12269
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 12270
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 12271
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 12272
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 12273
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 12274
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 12275
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 12276
jal log_test_assert_board
# Case 54: In-place rotation type 5, orientation 0, including wraparound
log_test_case_054:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 12476
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12477
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12478
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12479
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12480
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12481
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12482
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12483
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12484
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12485
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12486
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 12487
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12488
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12489
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12490
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12491
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12492
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12493
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12494
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12495
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12496
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12497
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 12498
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 12499
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 12500
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 12501
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 12502
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 12503
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 12504
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 12505
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 12506
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 12507
jal log_test_assert_board
# Case 55: In-place rotation type 5, orientation 1, including wraparound
log_test_case_055:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 12707
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12708
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12709
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12710
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12711
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12712
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12713
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12714
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12715
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12716
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12717
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 12718
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12719
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12720
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12721
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12722
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12723
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12724
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12725
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12726
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12727
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12728
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 12729
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 12730
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 12731
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 12732
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 12733
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 12734
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 12735
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 12736
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 12737
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 12738
jal log_test_assert_board
# Case 56: In-place rotation type 5, orientation 2, including wraparound
log_test_case_056:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 12938
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12939
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12940
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12941
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12942
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12943
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12944
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12945
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12946
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12947
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12948
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 12949
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 12950
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 12951
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 12952
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 12953
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 12954
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 12955
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 12956
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 12957
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12958
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 12959
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 12960
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 12961
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 12962
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 12963
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 12964
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 12965
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 12966
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 12967
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 12968
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 12969
jal log_test_assert_board
# Case 57: In-place rotation type 5, orientation 3, including wraparound
log_test_case_057:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 13169
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 13170
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 13171
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 13172
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 13173
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 13174
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 13175
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 13176
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 13177
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13178
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13179
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 13180
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 13181
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 13182
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 13183
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 13184
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 13185
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 13186
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 13187
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 13188
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13189
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13190
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 13191
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 13192
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 13193
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 13194
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 13195
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 13196
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 13197
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 13198
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 13199
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 13200
jal log_test_assert_board
# Case 58: In-place rotation type 6, orientation 0, including wraparound
log_test_case_058:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 13400
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 13401
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 13402
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 13403
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 13404
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 13405
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 13406
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 13407
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 13408
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13409
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13410
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 13411
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 13412
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 13413
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 13414
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 13415
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 13416
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 13417
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 13418
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 13419
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13420
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13421
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 13422
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 13423
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 13424
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 13425
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 13426
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 13427
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 13428
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 13429
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 13430
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 13431
jal log_test_assert_board
# Case 59: In-place rotation type 6, orientation 1, including wraparound
log_test_case_059:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 13631
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 13632
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 13633
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 13634
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 13635
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 13636
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 13637
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 13638
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 13639
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13640
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13641
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 13642
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 13643
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 13644
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 13645
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 13646
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 13647
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 13648
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 13649
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 13650
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13651
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13652
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 13653
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 13654
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 13655
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 13656
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 13657
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 13658
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 13659
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 13660
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 13661
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 13662
jal log_test_assert_board
# Case 60: In-place rotation type 6, orientation 2, including wraparound
log_test_case_060:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 13862
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 13863
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 13864
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 13865
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 13866
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 13867
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 13868
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 13869
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 13870
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13871
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13872
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
li $t8, 2
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 13873
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 13874
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 13875
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 13876
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 13877
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 13878
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 13879
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 13880
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 13881
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13882
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 13883
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 13884
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 13885
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 13886
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 3
li $a2, 13887
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 13888
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 13889
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 13890
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 13891
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 13892
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 13893
jal log_test_assert_board
# Case 61: In-place rotation type 6, orientation 3, including wraparound
log_test_case_061:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 14093
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 14094
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 14095
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 14096
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 14097
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 14098
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 14099
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 14100
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 14101
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14102
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14103
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 6
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 14104
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 14105
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 14106
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 14107
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 14108
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 14109
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 14110
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 14111
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 14112
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14113
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14114
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 14115
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 14116
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 6
li $a2, 14117
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 14118
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 14119
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 14120
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 14121
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 14122
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 14123
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 14124
jal log_test_assert_board
# Case 62: Right wall accepts a left kick
log_test_case_062:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 14324
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 14325
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 14326
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 14327
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 14328
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 14329
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 14330
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 14331
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 14332
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14333
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14334
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 8
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 14335
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 14336
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 14337
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 14338
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 14339
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 14340
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 14341
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 14342
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 14343
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14344
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14345
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 14346
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, -1
li $a2, 14347
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 14348
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 14349
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 7
li $a2, 14350
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 14351
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 14352
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 14353
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 14354
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 14355
jal log_test_assert_board
# Case 63: Left wall accepts a right kick
log_test_case_063:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 14555
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 14556
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 14557
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 14558
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 14559
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 14560
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 14561
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 14562
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 14563
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14564
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14565
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, -1
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 14566
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 14567
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 14568
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 14569
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 14570
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 14571
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 14572
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 14573
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 14574
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14575
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14576
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 14577
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 14578
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 14579
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 14580
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 0
li $a2, 14581
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 14582
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 14583
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 14584
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 14585
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 14586
jal log_test_assert_board
# Case 64: Left kick wins when both horizontal kicks are free
log_test_case_064:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 14786
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 14787
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 14788
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 14789
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 14790
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 14791
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 14792
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 14793
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 14794
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14795
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14796
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 256($t8)
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 14797
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 14798
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 14799
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 14800
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 14801
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 14802
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 14803
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 14804
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 14805
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14806
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 14807
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 14808
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, -1
li $a2, 14809
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 14810
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 14811
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 2
li $a2, 14812
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 14813
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 14814
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 14815
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 14816
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_025
li $a1, 200
li $a2, 14817
jal log_test_assert_board
# Case 65: Right kick is tried after current and left positions fail
log_test_case_065:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 15017
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 15018
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 15019
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15020
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 15021
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 15022
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 15023
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 15024
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 15025
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15026
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15027
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 256($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 252($t8)
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 15028
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 15029
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 15030
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15031
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 15032
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 15033
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 15034
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 15035
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 15036
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15037
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15038
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 15039
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 15040
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 15041
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 15042
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 4
li $a2, 15043
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 15044
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 15045
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 15046
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 15047
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_026
li $a1, 200
li $a2, 15048
jal log_test_assert_board
# Case 66: Three blocked candidates preserve the original state
log_test_case_066:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 15248
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 15249
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 15250
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15251
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 15252
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 15253
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 15254
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 15255
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 15256
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15257
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15258
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 260($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 256($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 252($t8)
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 15259
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 15260
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 15261
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15262
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 15263
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 15264
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 15265
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 15266
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 15267
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15268
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15269
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 15270
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 15271
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 15272
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 15273
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 15274
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 15275
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 15276
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 15277
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 15278
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_027
li $a1, 200
li $a2, 15279
jal log_test_assert_board
# Case 67: Floor collision cancels without a vertical kick
log_test_case_067:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 15479
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 15480
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 15481
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15482
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 15483
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 15484
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 15485
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 15486
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 15487
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15488
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15489
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 5
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 18
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 15490
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 15491
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 15492
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15493
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 15494
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 15495
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 15496
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 15497
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 15498
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15499
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15500
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 15501
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 15502
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 5
li $a2, 15503
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 15504
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 15505
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 15506
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 15507
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 15508
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 15509
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 15510
jal log_test_assert_board
# Case 68: I rotation requiring more than one cell is cancelled
log_test_case_068:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 15710
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 15711
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 15712
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15713
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 15714
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 15715
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 15716
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 15717
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 15718
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15719
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15720
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 8
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 15721
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 15722
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 15723
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15724
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 15725
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 15726
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 15727
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 15728
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 15729
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15730
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15731
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 15732
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 15733
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 15734
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 15735
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 8
li $a2, 15736
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 15737
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 15738
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 15739
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 15740
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 15741
jal log_test_assert_board
# Case 69: Vertical I at the left edge accepts exactly one right kick
log_test_case_069:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 15941
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 15942
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 15943
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15944
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 15945
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 15946
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 15947
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 15948
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 15949
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15950
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15951
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, -1
sw $t8, CURRENT_PIECE_X
li $t8, 4
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 15952
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 15953
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 15954
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 15955
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 15956
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 15957
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 15958
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 15959
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 15960
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15961
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 15962
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 15963
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 15964
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 15965
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 2
li $a2, 15966
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 0
li $a2, 15967
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 4
li $a2, 15968
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 15969
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 15970
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 15971
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 15972
jal log_test_assert_board
# Case 70: O wraps its orientation at the bottom-left corner
log_test_case_070:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 16172
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 16173
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 16174
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 16175
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 16176
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 16177
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 16178
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 16179
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 16180
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16181
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16182
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 3
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 0
sw $t8, CURRENT_PIECE_X
li $t8, 18
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 16183
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 16184
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 16185
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 16186
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 16187
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 16188
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 16189
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 16190
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 16191
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16192
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16193
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1
li $a2, 16194
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 16195
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 16196
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 16197
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 0
li $a2, 16198
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 18
li $a2, 16199
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 16200
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 16201
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 16202
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 16203
jal log_test_assert_board
# Case 71: log_hard_drop: Negative active type
log_test_case_071:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 16403
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 16404
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 16405
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 16406
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 16407
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 16408
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 16409
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 16410
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 16411
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16412
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16413
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, -1
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 16414
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 16415
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 16416
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 16417
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 16418
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 16419
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 16420
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 16421
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 16422
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16423
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16424
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 16425
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 16426
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, -1
li $a2, 16427
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 16428
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 16429
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 16430
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 16431
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 16432
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 16433
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 16434
jal log_test_assert_board
# Case 72: log_rotate_with_kick: Negative active type
log_test_case_072:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 16634
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 16635
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 16636
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 16637
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 16638
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 16639
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 16640
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 16641
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 16642
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16643
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16644
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, -1
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 16645
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 16646
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 16647
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 16648
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 16649
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 16650
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 16651
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 16652
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 16653
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16654
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16655
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 16656
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 16657
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, -1
li $a2, 16658
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 16659
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 16660
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 16661
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 16662
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 16663
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 16664
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 16665
jal log_test_assert_board
# Case 73: log_hard_drop: Type beyond the table
log_test_case_073:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 16865
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 16866
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 16867
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 16868
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 16869
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 16870
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 16871
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 16872
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 16873
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16874
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16875
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 7
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 16876
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 16877
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 16878
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 16879
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 16880
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 16881
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 16882
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 16883
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 16884
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16885
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 16886
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 16887
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 16888
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 7
li $a2, 16889
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 16890
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 16891
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 16892
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 16893
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 16894
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 16895
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 16896
jal log_test_assert_board
# Case 74: log_rotate_with_kick: Type beyond the table
log_test_case_074:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 17096
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 17097
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 17098
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 17099
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 17100
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 17101
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 17102
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 17103
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 17104
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17105
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17106
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 7
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 17107
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 17108
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 17109
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 17110
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 17111
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 17112
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 17113
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 17114
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 17115
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17116
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17117
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 17118
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 17119
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 7
li $a2, 17120
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 17121
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 17122
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 17123
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 17124
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 17125
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 17126
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 17127
jal log_test_assert_board
# Case 75: log_hard_drop: Negative orientation
log_test_case_075:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 17327
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 17328
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 17329
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 17330
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 17331
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 17332
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 17333
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 17334
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 17335
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17336
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17337
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, -1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 17338
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 17339
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 17340
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 17341
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 17342
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 17343
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 17344
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 17345
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 17346
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17347
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17348
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 17349
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 17350
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 17351
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, -1
li $a2, 17352
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 17353
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 17354
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 17355
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 17356
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 17357
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 17358
jal log_test_assert_board
# Case 76: log_rotate_with_kick: Negative orientation
log_test_case_076:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 17558
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 17559
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 17560
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 17561
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 17562
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 17563
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 17564
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 17565
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 17566
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17567
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17568
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, -1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 17569
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 17570
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 17571
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 17572
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 17573
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 17574
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 17575
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 17576
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 17577
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17578
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17579
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 17580
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 17581
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 17582
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, -1
li $a2, 17583
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 17584
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 17585
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 17586
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 17587
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 17588
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 17589
jal log_test_assert_board
# Case 77: log_hard_drop: Orientation beyond the table
log_test_case_077:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 17789
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 17790
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 17791
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 17792
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 17793
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 17794
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 17795
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 17796
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 17797
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17798
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17799
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 4
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 17800
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 17801
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 17802
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 17803
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 17804
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 17805
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 17806
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 17807
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 17808
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17809
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 17810
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 17811
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 17812
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 17813
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 4
li $a2, 17814
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 17815
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 17816
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 17817
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 17818
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 17819
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 17820
jal log_test_assert_board
# Case 78: log_rotate_with_kick: Orientation beyond the table
log_test_case_078:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 18020
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 18021
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 18022
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 18023
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 18024
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 18025
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18026
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 18027
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 18028
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18029
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18030
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 4
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 18031
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 18032
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 18033
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 18034
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 18035
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 18036
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18037
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 18038
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 18039
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18040
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18041
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 18042
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 18043
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 18044
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 4
li $a2, 18045
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 18046
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 18047
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 18048
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 18049
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 18050
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 18051
jal log_test_assert_board
# Case 79: log_hard_drop: Initial right wall collision
log_test_case_079:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 18251
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 18252
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 18253
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 18254
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 18255
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 18256
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18257
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 18258
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 18259
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18260
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18261
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 9
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 18262
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 18263
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 18264
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 18265
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 18266
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 18267
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18268
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 18269
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 18270
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18271
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18272
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 18273
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 18274
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 18275
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 18276
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 9
li $a2, 18277
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 18278
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 18279
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 18280
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 18281
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 18282
jal log_test_assert_board
# Case 80: log_rotate_with_kick: Initial right wall collision
log_test_case_080:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 18482
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 18483
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 18484
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 18485
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 18486
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 18487
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18488
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 18489
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 18490
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18491
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18492
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 9
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 18493
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 18494
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 18495
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 18496
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 18497
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 18498
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18499
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 18500
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 18501
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18502
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18503
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 18504
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 18505
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 18506
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 18507
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 9
li $a2, 18508
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 18509
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 18510
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 18511
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 18512
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 18513
jal log_test_assert_board
# Case 81: log_hard_drop: Initial left wall collision
log_test_case_081:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 18713
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 18714
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 18715
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 18716
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 18717
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 18718
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18719
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 18720
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 18721
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18722
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18723
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, -1
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 18724
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 18725
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 18726
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 18727
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 18728
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 18729
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18730
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 18731
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 18732
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18733
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18734
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 18735
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 18736
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 18737
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 18738
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, -1
li $a2, 18739
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 18740
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 18741
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 18742
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 18743
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 18744
jal log_test_assert_board
# Case 82: log_rotate_with_kick: Initial left wall collision
log_test_case_082:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 18944
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 18945
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 18946
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 18947
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 18948
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 18949
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18950
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 18951
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 18952
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18953
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18954
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, -1
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 18955
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 18956
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 18957
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 18958
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 18959
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 18960
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 18961
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 18962
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 18963
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18964
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 18965
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 18966
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 18967
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 18968
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 18969
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, -1
li $a2, 18970
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 18971
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 18972
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 18973
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 18974
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 18975
jal log_test_assert_board
# Case 83: log_hard_drop: Initial floor collision
log_test_case_083:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 19175
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 19176
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 19177
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 19178
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 19179
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 19180
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 19181
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 19182
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 19183
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19184
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19185
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 19
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 19186
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 19187
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 19188
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 19189
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 19190
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 19191
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 19192
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 19193
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 19194
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19195
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19196
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 19197
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 19198
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 19199
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 19200
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 19201
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 19
li $a2, 19202
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 19203
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 19204
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 19205
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 19206
jal log_test_assert_board
# Case 84: log_rotate_with_kick: Initial floor collision
log_test_case_084:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 19406
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 19407
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 19408
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 19409
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 19410
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 19411
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 19412
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 19413
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 19414
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19415
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19416
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 19
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 19417
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 19418
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 19419
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 19420
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 19421
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 19422
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 19423
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 19424
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 19425
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19426
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19427
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 19428
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 19429
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 19430
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 19431
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 19432
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 19
li $a2, 19433
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 19434
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 19435
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 19436
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 19437
jal log_test_assert_board
# Case 85: log_hard_drop: Initial negative row
log_test_case_085:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 19637
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 19638
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 19639
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 19640
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 19641
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 19642
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 19643
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 19644
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 19645
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19646
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19647
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, -1
sw $t8, CURRENT_PIECE_Y
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 19648
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 19649
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 19650
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 19651
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 19652
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 19653
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 19654
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 19655
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 19656
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19657
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19658
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 19659
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 19660
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 19661
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 19662
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 19663
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, -1
li $a2, 19664
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 19665
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 19666
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 19667
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 19668
jal log_test_assert_board
# Case 86: log_rotate_with_kick: Initial negative row
log_test_case_086:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 19868
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 19869
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 19870
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 19871
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 19872
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 19873
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 19874
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 19875
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 19876
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19877
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19878
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, -1
sw $t8, CURRENT_PIECE_Y
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 19879
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 19880
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 19881
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 19882
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 19883
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 19884
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 19885
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 19886
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 19887
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19888
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 19889
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 19890
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 19891
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 19892
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 19893
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 19894
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, -1
li $a2, 19895
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 19896
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 19897
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 19898
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 19899
jal log_test_assert_board
# Case 87: log_hard_drop: Blocked spawn
log_test_case_087:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 20099
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 20100
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 20101
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 20102
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 20103
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 20104
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 20105
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 20106
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 20107
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20108
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20109
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 12($t8)
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 20110
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 20111
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 20112
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 20113
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 20114
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 20115
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 20116
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 20117
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 20118
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20119
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20120
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 20121
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 1
li $a2, 20122
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 20123
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 20124
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 20125
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 20126
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 20127
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 20128
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 20129
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_028
li $a1, 200
li $a2, 20130
jal log_test_assert_board
# Case 88: log_rotate_with_kick: Blocked spawn
log_test_case_088:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 20330
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 20331
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 20332
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 20333
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 20334
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 20335
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 20336
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 20337
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 20338
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20339
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20340
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 3
sw $t8, CURRENT_PIECE_TYPE
li $t8, 0
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 12($t8)
jal log_rotate_with_kick
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 20341
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 20342
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 20343
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 20344
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 20345
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 20346
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 20347
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 20348
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 20349
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20350
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20351
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 0
li $a2, 20352
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 20353
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 3
li $a2, 20354
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 0
li $a2, 20355
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 20356
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 0
li $a2, 20357
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 20358
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 20359
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 20360
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_028
li $a1, 200
li $a2, 20361
jal log_test_assert_board
# Case 89: Four-line drop locks only; the caller clears and scores exactly once
log_test_case_089:
jal initialize_playfield
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 20561
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 20562
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 20563
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 20564
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 20565
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 20566
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 20567
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 20568
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 20569
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20570
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20571
jal log_test_assert_equal
li $t8, 1234
sw $t8, SCORE
li $t8, 7
sw $t8, LINES_CLEARED
li $t8, 11259375
sw $t8, CURRENT_PIECE_COLOR
li $t8, 0
sw $t8, CURRENT_PIECE_TYPE
li $t8, 1
sw $t8, CURRENT_PIECE_ORIENTATION
li $t8, 3
sw $t8, CURRENT_PIECE_X
li $t8, 0
sw $t8, CURRENT_PIECE_Y
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 640($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 644($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 648($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 652($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 660($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 664($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 668($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 672($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 676($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 796($t8)
jal log_hard_drop
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 20572
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 20573
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 20574
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 20575
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 20576
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 20577
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 20578
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 20579
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 20580
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20581
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20582
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 16
li $a2, 20583
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 20584
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_TYPE
move $a0, $a0
li $a1, 0
li $a2, 20585
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_ORIENTATION
move $a0, $a0
li $a1, 1
li $a2, 20586
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_X
move $a0, $a0
li $a1, 3
li $a2, 20587
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_Y
move $a0, $a0
li $a1, 16
li $a2, 20588
jal log_test_assert_equal
lw $a0, CURRENT_PIECE_COLOR
move $a0, $a0
li $a1, 11259375
li $a2, 20589
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 20590
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 7
li $a2, 20591
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_029
li $a1, 200
li $a2, 20592
jal log_test_assert_board
jal check_and_clear_lines
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 20792
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 20793
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 20794
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 20795
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 20796
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 20797
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 20798
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 20799
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 20800
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20801
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 20802
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 4
li $a2, 20803
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 20804
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 1234
li $a2, 20805
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_024
li $a1, 200
li $a2, 20806
jal log_test_assert_board
li $a0, 4
li $a1, 2
jal log_update_score
sw $v0, log_test_last_v0
sw $v1, log_test_last_v1
move $a0, $s0
li $a1, 1000
li $a2, 21006
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 21007
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 21008
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 21009
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 21010
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 21011
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 21012
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 21013
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 21014
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 21015
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 21016
jal log_test_assert_equal
lw $a0, log_test_last_v0
move $a0, $a0
li $a1, 1600
li $a2, 21017
jal log_test_assert_equal
lw $a0, log_test_last_v1
move $a0, $a0
li $a1, 0
li $a2, 21018
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 2834
li $a2, 21019
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 11
li $a2, 21020
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
    .word 0, 0, 0, 1, 1, 1, 1, 0, 0, 0
log_test_expected_board_002:
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
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
log_test_expected_board_003:
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
    .word 0, 0, 0, 2, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 2, 2, 2, 0, 0, 0, 0
log_test_expected_board_004:
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
    .word 0, 0, 0, 0, 2, 2, 0, 0, 0, 0
    .word 0, 0, 0, 0, 2, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 2, 0, 0, 0, 0, 0
log_test_expected_board_005:
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
    .word 0, 0, 0, 2, 2, 2, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 2, 0, 0, 0, 0
log_test_expected_board_006:
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
    .word 0, 0, 0, 0, 2, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 2, 0, 0, 0, 0, 0
    .word 0, 0, 0, 2, 2, 0, 0, 0, 0, 0
log_test_expected_board_007:
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
    .word 0, 0, 0, 0, 0, 3, 0, 0, 0, 0
    .word 0, 0, 0, 3, 3, 3, 0, 0, 0, 0
log_test_expected_board_008:
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
    .word 0, 0, 0, 0, 3, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 3, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 3, 3, 0, 0, 0, 0
log_test_expected_board_009:
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
    .word 0, 0, 0, 3, 3, 3, 0, 0, 0, 0
    .word 0, 0, 0, 3, 0, 0, 0, 0, 0, 0
log_test_expected_board_010:
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
    .word 0, 0, 0, 3, 3, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 3, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 3, 0, 0, 0, 0, 0
log_test_expected_board_011:
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
    .word 0, 0, 0, 4, 4, 0, 0, 0, 0, 0
    .word 0, 0, 0, 4, 4, 0, 0, 0, 0, 0
log_test_expected_board_012:
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
    .word 0, 0, 0, 0, 5, 5, 0, 0, 0, 0
    .word 0, 0, 0, 5, 5, 0, 0, 0, 0, 0
log_test_expected_board_013:
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
    .word 0, 0, 0, 5, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 5, 5, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 5, 0, 0, 0, 0, 0
log_test_expected_board_014:
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
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 6, 6, 6, 0, 0, 0, 0
log_test_expected_board_015:
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
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 6, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
log_test_expected_board_016:
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
    .word 0, 0, 0, 6, 6, 6, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
log_test_expected_board_017:
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
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 6, 0, 0, 0, 0
    .word 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
log_test_expected_board_018:
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
    .word 0, 0, 0, 7, 7, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 7, 7, 0, 0, 0, 0
log_test_expected_board_019:
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
    .word 0, 0, 0, 0, 7, 0, 0, 0, 0, 0
    .word 0, 0, 0, 7, 7, 0, 0, 0, 0, 0
    .word 0, 0, 0, 7, 0, 0, 0, 0, 0, 0
log_test_expected_board_020:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 4, 4, 0, 0, 0, 0, 0
    .word 0, 0, 0, 4, 4, 0, 0, 0, 0, 0
    .word 0, 0, 0, 5, 0, 0, 0, 0, 0, 0
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
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 4, 4, 0, 0, 0, 0, 0
    .word 0, 0, 0, 4, 4, 0, 0, 0, 0, 0
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
    .word 0, 0, 0, 2, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_022:
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
    .word 0, 0, 0, 0, 0, 0, 0, 0, 4, 4
    .word 0, 0, 0, 0, 0, 0, 0, 0, 4, 4
log_test_expected_board_023:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 1, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 7, 0, 0, 0, 0, 0
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
log_test_expected_board_025:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
log_test_expected_board_026:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 7, 6, 0, 0, 0, 0, 0
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
log_test_expected_board_027:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 7, 6, 2, 0, 0, 0, 0
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
log_test_expected_board_028:
    .word 0, 0, 0, 5, 0, 0, 0, 0, 0, 0
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
log_test_expected_board_029:
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
    .word 2, 2, 2, 2, 1, 2, 2, 2, 2, 2
    .word 2, 2, 2, 2, 1, 2, 2, 2, 2, 2
    .word 2, 2, 2, 2, 1, 2, 2, 2, 2, 2
    .word 2, 2, 2, 2, 1, 2, 2, 2, 2, 2
.include "../../logica.asm"
.include "aserciones.asm"
