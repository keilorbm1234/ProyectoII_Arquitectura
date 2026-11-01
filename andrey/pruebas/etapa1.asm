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
sw $t9, 800($t8)
# Case 1: Initialization clears exactly 200 cells and preserves both guards
log_test_case_001:
la $t8, PLAYFIELD
addi $t8, $t8, 0
li $t9, 200
li $t6, 7
log_test_fill_1:
sw $t6, 0($t8)
addi $t8, $t8, 4
addi $t9, $t9, -1
bgtz $t9, log_test_fill_1
jal initialize_playfield
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
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_001
li $a1, 200
li $a2, 12
jal log_test_assert_board
# Case 2: Top row clearing preserves row 1 and saved registers
log_test_case_002:
la $t8, PLAYFIELD
addi $t8, $t8, 0
li $t9, 10
li $t6, 7
log_test_fill_2:
sw $t6, 0($t8)
addi $t8, $t8, 4
addi $t9, $t9, -1
bgtz $t9, log_test_fill_2
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 40($t8)
jal clear_top_row
move $a0, $s0
li $a1, 1000
li $a2, 212
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 213
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 214
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 215
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 216
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 217
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 218
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 219
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 220
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 221
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 222
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_002
li $a1, 200
li $a2, 223
jal log_test_assert_board
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 423
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 424
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 425
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 426
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 427
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 428
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 429
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 430
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 431
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 432
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 433
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
# Case 3: Left edge valid
log_test_case_003:
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 434
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 435
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 436
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 437
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 438
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 439
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 440
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 441
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 442
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 443
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 444
jal log_test_assert_equal
move $a0, $v0
li $a1, 0
li $a2, 445
jal log_test_assert_equal
# Case 4: Left wall blocked
log_test_case_004:
la $a0, SHAPE_O_0
li $a1, -1
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 446
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 447
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 448
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 449
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 450
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 451
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 452
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 453
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 454
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 455
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 456
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 457
jal log_test_assert_equal
# Case 5: Right edge valid
log_test_case_005:
la $a0, SHAPE_O_0
li $a1, 8
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 458
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 459
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 460
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 461
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 462
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 463
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 464
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 465
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 466
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 467
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 468
jal log_test_assert_equal
move $a0, $v0
li $a1, 0
li $a2, 469
jal log_test_assert_equal
# Case 6: Right wall blocked
log_test_case_006:
la $a0, SHAPE_O_0
li $a1, 9
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 470
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 471
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 472
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 473
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 474
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 475
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 476
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 477
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 478
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 479
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 480
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 481
jal log_test_assert_equal
# Case 7: Bottom edge valid
log_test_case_007:
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 18
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 482
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 483
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 484
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 485
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 486
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 487
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 488
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 489
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 490
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 491
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 492
jal log_test_assert_equal
move $a0, $v0
li $a1, 0
li $a2, 493
jal log_test_assert_equal
# Case 8: Floor blocked
log_test_case_008:
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 19
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 494
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 495
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 496
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 497
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 498
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 499
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 500
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 501
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 502
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 503
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 504
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 505
jal log_test_assert_equal
# Case 9: Negative row blocked
log_test_case_009:
la $a0, SHAPE_O_0
li $a1, 0
li $a2, -1
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 506
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 507
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 508
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 509
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 510
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 511
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 512
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 513
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 514
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 515
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 516
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 517
jal log_test_assert_equal
# Case 10: Vertical I reaches row 19 and column 9
log_test_case_010:
la $a0, SHAPE_I_1
li $a1, 8
li $a2, 16
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 518
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 519
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 520
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 521
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 522
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 523
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 524
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 525
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 526
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 527
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 528
jal log_test_assert_equal
move $a0, $v0
li $a1, 0
li $a2, 529
jal log_test_assert_equal
# Case 11: Negative origin valid when every block remains inside
log_test_case_011:
la $a0, SHAPE_I_1
li $a1, -1
li $a2, 16
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 530
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 531
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 532
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 533
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 534
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 535
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 536
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 537
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 538
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 539
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 540
jal log_test_assert_equal
move $a0, $v0
li $a1, 0
li $a2, 541
jal log_test_assert_equal
# Case 12: Vertical I crosses floor
log_test_case_012:
la $a0, SHAPE_I_1
li $a1, 8
li $a2, 17
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 542
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 543
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 544
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 545
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 546
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 547
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 548
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 549
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 550
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 551
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 552
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 553
jal log_test_assert_equal
# Case 13: Horizontal I fits final row
log_test_case_013:
la $a0, SHAPE_I_0
li $a1, 6
li $a2, 18
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 554
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 555
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 556
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 557
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 558
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 559
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 560
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 561
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 562
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 563
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 564
jal log_test_assert_equal
move $a0, $v0
li $a1, 0
li $a2, 565
jal log_test_assert_equal
# Case 14: Horizontal I crosses right wall
log_test_case_014:
la $a0, SHAPE_I_0
li $a1, 7
li $a2, 18
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 566
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 567
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 568
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 569
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 570
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 571
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 572
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 573
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 574
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 575
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 576
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 577
jal log_test_assert_equal
# Case 15: Horizontal I crosses floor
log_test_case_015:
la $a0, SHAPE_I_0
li $a1, 6
li $a2, 19
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 578
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 579
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 580
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 581
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 582
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 583
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 584
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 585
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 586
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 587
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 588
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 589
jal log_test_assert_equal
# Case 16: Occupied cell ID 1 blocks the candidate spawn position
log_test_case_016:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 590
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 591
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 592
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 593
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 594
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 595
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 596
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 597
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 598
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 599
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 600
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 0($t8)
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 601
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 602
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 603
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 604
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 605
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 606
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 607
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 608
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 609
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 610
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 611
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 612
jal log_test_assert_equal
# Case 17: Occupied cell ID 2 blocks the candidate spawn position
log_test_case_017:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 613
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 614
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 615
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 616
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 617
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 618
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 619
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 620
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 621
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 622
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 623
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 0($t8)
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 624
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 625
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 626
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 627
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 628
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 629
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 630
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 631
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 632
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 633
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 634
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 635
jal log_test_assert_equal
# Case 18: Occupied cell ID 3 blocks the candidate spawn position
log_test_case_018:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 636
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 637
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 638
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 639
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 640
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 641
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 642
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 643
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 644
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 645
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 646
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 0($t8)
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 647
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 648
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 649
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 650
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 651
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 652
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 653
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 654
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 655
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 656
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 657
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 658
jal log_test_assert_equal
# Case 19: Occupied cell ID 4 blocks the candidate spawn position
log_test_case_019:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 659
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 660
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 661
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 662
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 663
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 664
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 665
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 666
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 667
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 668
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 669
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 0($t8)
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 670
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 671
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 672
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 673
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 674
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 675
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 676
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 677
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 678
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 679
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 680
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 681
jal log_test_assert_equal
# Case 20: Occupied cell ID 5 blocks the candidate spawn position
log_test_case_020:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 682
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 683
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 684
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 685
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 686
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 687
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 688
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 689
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 690
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 691
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 692
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 0($t8)
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 693
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 694
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 695
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 696
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 697
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 698
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 699
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 700
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 701
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 702
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 703
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 704
jal log_test_assert_equal
# Case 21: Occupied cell ID 6 blocks the candidate spawn position
log_test_case_021:
jal initialize_playfield
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
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 0($t8)
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 716
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 717
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 718
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 719
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 720
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 721
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 722
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 723
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 724
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 725
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 726
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 727
jal log_test_assert_equal
# Case 22: Occupied cell ID 7 blocks the candidate spawn position
log_test_case_022:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 728
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 729
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 730
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 731
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 732
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 733
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 734
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 735
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 736
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 737
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 738
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal check_collision
move $a0, $s0
li $a1, 1000
li $a2, 739
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 740
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 741
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 742
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 743
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 744
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 745
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 746
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 747
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 748
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 749
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 750
jal log_test_assert_equal
# Case 23: Valid freezing writes exactly four bottom-right cells
log_test_case_023:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 751
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 752
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 753
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 754
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 755
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 756
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 757
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 758
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 759
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 760
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 761
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $a0, SHAPE_O_0
li $a1, 8
li $a2, 18
jal freeze_piece
move $a0, $s0
li $a1, 1000
li $a2, 762
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 763
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 764
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 765
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 766
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 767
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 768
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 769
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 770
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 771
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 772
jal log_test_assert_equal
move $a0, $v0
li $a1, 0
li $a2, 773
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_003
li $a1, 200
li $a2, 774
jal log_test_assert_board
# Case 24: Invalid right wall freeze is atomic
log_test_case_024:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 974
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 975
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 976
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 977
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 978
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 979
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 980
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 981
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 982
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 983
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 984
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $a0, SHAPE_O_0
li $a1, 9
li $a2, 18
jal freeze_piece
move $a0, $s0
li $a1, 1000
li $a2, 985
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 986
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 987
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 988
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 989
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 990
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 991
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 992
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 993
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 994
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 995
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 996
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_001
li $a1, 200
li $a2, 997
jal log_test_assert_board
# Case 25: Invalid floor freeze is atomic
log_test_case_025:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 1197
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1198
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1199
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1200
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1201
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1202
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1203
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1204
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1205
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1206
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1207
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 19
jal freeze_piece
move $a0, $s0
li $a1, 1000
li $a2, 1208
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1209
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1210
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1211
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1212
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1213
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1214
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1215
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1216
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1217
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1218
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 1219
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_001
li $a1, 200
li $a2, 1220
jal log_test_assert_board
# Case 26: Negative row freeze is atomic
log_test_case_026:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 1420
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1421
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1422
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1423
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1424
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1425
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1426
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1427
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1428
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1429
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1430
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $a0, SHAPE_O_0
li $a1, 0
li $a2, -1
jal freeze_piece
move $a0, $s0
li $a1, 1000
li $a2, 1431
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1432
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1433
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1434
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1435
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1436
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1437
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1438
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1439
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1440
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1441
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 1442
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_001
li $a1, 200
li $a2, 1443
jal log_test_assert_board
# Case 27: Invalid left wall freeze is atomic
log_test_case_027:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 1643
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1644
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1645
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1646
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1647
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1648
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1649
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1650
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1651
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1652
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1653
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $a0, SHAPE_O_0
li $a1, -1
li $a2, 0
jal freeze_piece
move $a0, $s0
li $a1, 1000
li $a2, 1654
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1655
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1656
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1657
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1658
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1659
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1660
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1661
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1662
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1663
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1664
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 1665
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_001
li $a1, 200
li $a2, 1666
jal log_test_assert_board
# Case 28: Occupied second block prevents every freeze write
log_test_case_028:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 1866
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1867
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1868
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1869
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1870
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1871
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1872
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1873
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1874
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1875
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1876
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 4($t8)
la $a0, SHAPE_O_0
li $a1, 0
li $a2, 0
jal freeze_piece
move $a0, $s0
li $a1, 1000
li $a2, 1877
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 1878
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 1879
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 1880
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 1881
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 1882
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 1883
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 1884
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 1885
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1886
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 1887
jal log_test_assert_equal
move $a0, $v0
li $a1, 1
li $a2, 1888
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_004
li $a1, 200
li $a2, 1889
jal log_test_assert_board
# Case 29: Shift row -1, preserving exact IDs and unaffected rows
log_test_case_029:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 2089
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2090
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2091
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2092
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2093
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2094
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2095
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2096
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2097
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2098
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2099
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 4($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 8($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 12($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 16($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 20($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 24($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 28($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 32($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 36($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 40($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 44($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 48($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 52($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 56($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 60($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 64($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 68($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 72($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 76($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 80($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 84($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 88($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 92($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 96($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 100($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 104($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 108($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 112($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 116($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 120($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 124($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 128($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 132($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 136($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 140($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 144($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 148($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 152($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 156($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 160($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 164($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 168($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 172($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 176($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 180($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 184($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 188($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 192($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 196($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 200($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 204($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 208($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 212($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 216($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 220($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 224($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 228($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 232($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 236($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 240($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 244($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 248($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 252($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 256($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 260($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 264($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 268($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 272($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 276($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 280($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 284($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 288($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 292($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 296($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 300($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 304($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 308($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 312($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 316($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 320($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 324($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 328($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 332($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 336($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 340($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 344($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 348($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 352($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 356($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 360($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 364($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 368($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 372($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 376($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 380($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 384($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 388($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 392($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 396($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 400($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 404($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 408($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 412($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 416($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 420($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 424($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 428($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 432($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 436($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 440($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 444($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 448($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 452($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 456($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 460($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 464($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 468($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 472($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 476($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 480($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 484($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 488($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 492($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 496($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 500($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 504($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 508($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 512($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 516($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 520($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 524($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 528($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 532($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 536($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 540($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 544($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 548($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 552($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 556($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 560($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 564($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 568($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 572($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 576($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 580($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 584($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 588($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 592($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 596($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 600($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 604($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 608($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 612($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 616($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 620($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 624($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 628($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 632($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 636($t8)
la $t8, PLAYFIELD
li $t9, 0
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
li $t9, 0
sw $t9, 672($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 676($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 796($t8)
li $a0, -1
jal shift_rows_down
move $a0, $s0
li $a1, 1000
li $a2, 2100
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2101
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2102
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2103
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2104
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2105
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2106
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2107
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2108
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2109
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2110
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_005
li $a1, 200
li $a2, 2111
jal log_test_assert_board
# Case 30: Shift row 20, preserving exact IDs and unaffected rows
log_test_case_030:
jal initialize_playfield
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
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 4($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 8($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 12($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 16($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 20($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 24($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 28($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 32($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 36($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 40($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 44($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 48($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 52($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 56($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 60($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 64($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 68($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 72($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 76($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 80($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 84($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 88($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 92($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 96($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 100($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 104($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 108($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 112($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 116($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 120($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 124($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 128($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 132($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 136($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 140($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 144($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 148($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 152($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 156($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 160($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 164($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 168($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 172($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 176($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 180($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 184($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 188($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 192($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 196($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 200($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 204($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 208($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 212($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 216($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 220($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 224($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 228($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 232($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 236($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 240($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 244($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 248($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 252($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 256($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 260($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 264($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 268($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 272($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 276($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 280($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 284($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 288($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 292($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 296($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 300($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 304($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 308($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 312($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 316($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 320($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 324($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 328($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 332($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 336($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 340($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 344($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 348($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 352($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 356($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 360($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 364($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 368($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 372($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 376($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 380($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 384($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 388($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 392($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 396($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 400($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 404($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 408($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 412($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 416($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 420($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 424($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 428($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 432($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 436($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 440($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 444($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 448($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 452($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 456($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 460($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 464($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 468($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 472($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 476($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 480($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 484($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 488($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 492($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 496($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 500($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 504($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 508($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 512($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 516($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 520($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 524($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 528($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 532($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 536($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 540($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 544($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 548($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 552($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 556($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 560($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 564($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 568($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 572($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 576($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 580($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 584($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 588($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 592($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 596($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 600($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 604($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 608($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 612($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 616($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 620($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 624($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 628($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 632($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 636($t8)
la $t8, PLAYFIELD
li $t9, 0
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
li $t9, 0
sw $t9, 672($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 676($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 796($t8)
li $a0, 20
jal shift_rows_down
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
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_005
li $a1, 200
li $a2, 2333
jal log_test_assert_board
# Case 31: Shift row 0, preserving exact IDs and unaffected rows
log_test_case_031:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 2533
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2534
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2535
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2536
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2537
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2538
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2539
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2540
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2541
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2542
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2543
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 4($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 8($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 12($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 16($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 20($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 24($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 28($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 32($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 36($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 40($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 44($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 48($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 52($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 56($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 60($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 64($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 68($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 72($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 76($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 80($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 84($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 88($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 92($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 96($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 100($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 104($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 108($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 112($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 116($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 120($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 124($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 128($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 132($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 136($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 140($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 144($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 148($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 152($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 156($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 160($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 164($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 168($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 172($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 176($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 180($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 184($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 188($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 192($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 196($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 200($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 204($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 208($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 212($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 216($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 220($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 224($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 228($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 232($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 236($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 240($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 244($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 248($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 252($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 256($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 260($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 264($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 268($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 272($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 276($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 280($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 284($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 288($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 292($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 296($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 300($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 304($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 308($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 312($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 316($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 320($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 324($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 328($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 332($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 336($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 340($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 344($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 348($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 352($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 356($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 360($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 364($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 368($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 372($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 376($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 380($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 384($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 388($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 392($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 396($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 400($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 404($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 408($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 412($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 416($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 420($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 424($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 428($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 432($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 436($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 440($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 444($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 448($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 452($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 456($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 460($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 464($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 468($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 472($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 476($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 480($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 484($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 488($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 492($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 496($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 500($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 504($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 508($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 512($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 516($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 520($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 524($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 528($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 532($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 536($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 540($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 544($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 548($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 552($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 556($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 560($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 564($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 568($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 572($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 576($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 580($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 584($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 588($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 592($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 596($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 600($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 604($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 608($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 612($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 616($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 620($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 624($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 628($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 632($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 636($t8)
la $t8, PLAYFIELD
li $t9, 0
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
li $t9, 0
sw $t9, 672($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 676($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 796($t8)
li $a0, 0
jal shift_rows_down
move $a0, $s0
li $a1, 1000
li $a2, 2544
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2545
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2546
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2547
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2548
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2549
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2550
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2551
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2552
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2553
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2554
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_006
li $a1, 200
li $a2, 2555
jal log_test_assert_board
# Case 32: Shift row 1, preserving exact IDs and unaffected rows
log_test_case_032:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 2755
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2756
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2757
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2758
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2759
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2760
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2761
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2762
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2763
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2764
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2765
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 4($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 8($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 12($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 16($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 20($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 24($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 28($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 32($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 36($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 40($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 44($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 48($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 52($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 56($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 60($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 64($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 68($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 72($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 76($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 80($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 84($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 88($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 92($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 96($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 100($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 104($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 108($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 112($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 116($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 120($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 124($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 128($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 132($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 136($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 140($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 144($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 148($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 152($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 156($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 160($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 164($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 168($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 172($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 176($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 180($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 184($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 188($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 192($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 196($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 200($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 204($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 208($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 212($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 216($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 220($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 224($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 228($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 232($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 236($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 240($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 244($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 248($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 252($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 256($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 260($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 264($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 268($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 272($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 276($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 280($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 284($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 288($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 292($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 296($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 300($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 304($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 308($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 312($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 316($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 320($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 324($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 328($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 332($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 336($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 340($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 344($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 348($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 352($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 356($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 360($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 364($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 368($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 372($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 376($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 380($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 384($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 388($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 392($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 396($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 400($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 404($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 408($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 412($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 416($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 420($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 424($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 428($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 432($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 436($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 440($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 444($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 448($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 452($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 456($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 460($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 464($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 468($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 472($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 476($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 480($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 484($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 488($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 492($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 496($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 500($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 504($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 508($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 512($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 516($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 520($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 524($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 528($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 532($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 536($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 540($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 544($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 548($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 552($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 556($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 560($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 564($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 568($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 572($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 576($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 580($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 584($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 588($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 592($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 596($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 600($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 604($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 608($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 612($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 616($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 620($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 624($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 628($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 632($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 636($t8)
la $t8, PLAYFIELD
li $t9, 0
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
li $t9, 0
sw $t9, 672($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 676($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 796($t8)
li $a0, 1
jal shift_rows_down
move $a0, $s0
li $a1, 1000
li $a2, 2766
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2767
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2768
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2769
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2770
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2771
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2772
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2773
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2774
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2775
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2776
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_007
li $a1, 200
li $a2, 2777
jal log_test_assert_board
# Case 33: Shift row 19, preserving exact IDs and unaffected rows
log_test_case_033:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 2977
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2978
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2979
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2980
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2981
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2982
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2983
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2984
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2985
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2986
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2987
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 4($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 8($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 12($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 16($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 20($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 24($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 28($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 32($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 36($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 40($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 44($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 48($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 52($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 56($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 60($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 64($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 68($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 72($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 76($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 80($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 84($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 88($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 92($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 96($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 100($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 104($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 108($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 112($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 116($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 120($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 124($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 128($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 132($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 136($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 140($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 144($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 148($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 152($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 156($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 160($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 164($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 168($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 172($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 176($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 180($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 184($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 188($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 192($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 196($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 200($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 204($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 208($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 212($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 216($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 220($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 224($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 228($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 232($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 236($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 240($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 244($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 248($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 252($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 256($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 260($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 264($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 268($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 272($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 276($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 280($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 284($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 288($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 292($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 296($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 300($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 304($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 308($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 312($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 316($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 320($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 324($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 328($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 332($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 336($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 340($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 344($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 348($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 352($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 356($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 360($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 364($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 368($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 372($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 376($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 380($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 384($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 388($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 392($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 396($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 400($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 404($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 408($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 412($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 416($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 420($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 424($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 428($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 432($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 436($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 440($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 444($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 448($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 452($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 456($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 460($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 464($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 468($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 472($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 476($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 480($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 484($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 488($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 492($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 496($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 500($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 504($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 508($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 512($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 516($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 520($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 524($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 528($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 532($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 536($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 540($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 544($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 548($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 552($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 556($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 560($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 564($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 568($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 572($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 576($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 580($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 584($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 588($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 592($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 596($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 600($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 604($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 608($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 612($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 616($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 620($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 624($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 628($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 632($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 636($t8)
la $t8, PLAYFIELD
li $t9, 0
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
li $t9, 0
sw $t9, 672($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 676($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 796($t8)
li $a0, 19
jal shift_rows_down
move $a0, $s0
li $a1, 1000
li $a2, 2988
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 2989
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 2990
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 2991
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 2992
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 2993
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 2994
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 2995
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 2996
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2997
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 2998
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_008
li $a1, 200
li $a2, 2999
jal log_test_assert_board
# Case 34: Clears 1 consecutive bottom rows and shifts the marker; score is applied separately in stage 2
log_test_case_034:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 3199
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3200
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3201
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3202
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3203
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3204
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3205
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3206
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3207
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3208
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3209
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
addi $t8, $t8, 760
li $t9, 10
li $t6, 3
log_test_fill_3:
sw $t6, 0($t8)
addi $t8, $t8, 4
addi $t9, $t9, -1
bgtz $t9, log_test_fill_3
jal check_and_clear_lines
move $a0, $s0
li $a1, 1000
li $a2, 3210
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3211
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3212
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3213
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3214
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3215
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3216
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3217
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3218
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3219
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3220
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 1
li $a2, 3221
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 0
li $a2, 3222
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_009
li $a1, 200
li $a2, 3223
jal log_test_assert_board
# Case 35: Clears 2 consecutive bottom rows and shifts the marker; score is applied separately in stage 2
log_test_case_035:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 3423
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3424
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3425
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3426
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3427
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3428
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3429
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3430
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3431
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3432
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3433
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
addi $t8, $t8, 720
li $t9, 20
li $t6, 3
log_test_fill_4:
sw $t6, 0($t8)
addi $t8, $t8, 4
addi $t9, $t9, -1
bgtz $t9, log_test_fill_4
jal check_and_clear_lines
move $a0, $s0
li $a1, 1000
li $a2, 3434
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3435
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3436
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3437
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3438
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3439
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3440
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3441
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3442
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3443
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3444
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 2
li $a2, 3445
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 0
li $a2, 3446
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_010
li $a1, 200
li $a2, 3447
jal log_test_assert_board
# Case 36: Clears 3 consecutive bottom rows and shifts the marker; score is applied separately in stage 2
log_test_case_036:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 3647
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3648
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3649
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3650
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3651
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3652
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3653
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3654
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3655
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3656
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3657
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
addi $t8, $t8, 680
li $t9, 30
li $t6, 3
log_test_fill_5:
sw $t6, 0($t8)
addi $t8, $t8, 4
addi $t9, $t9, -1
bgtz $t9, log_test_fill_5
jal check_and_clear_lines
move $a0, $s0
li $a1, 1000
li $a2, 3658
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3659
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3660
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3661
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3662
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3663
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3664
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3665
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3666
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3667
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3668
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 3
li $a2, 3669
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 0
li $a2, 3670
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_011
li $a1, 200
li $a2, 3671
jal log_test_assert_board
# Case 37: Clears 4 consecutive bottom rows and shifts the marker; score is applied separately in stage 2
log_test_case_037:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 3871
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3872
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3873
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3874
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3875
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3876
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3877
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3878
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3879
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3880
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3881
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 0($t8)
la $t8, PLAYFIELD
addi $t8, $t8, 640
li $t9, 40
li $t6, 3
log_test_fill_6:
sw $t6, 0($t8)
addi $t8, $t8, 4
addi $t9, $t9, -1
bgtz $t9, log_test_fill_6
jal check_and_clear_lines
move $a0, $s0
li $a1, 1000
li $a2, 3882
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 3883
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 3884
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 3885
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 3886
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 3887
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 3888
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 3889
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 3890
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3891
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 3892
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 4
li $a2, 3893
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 0
li $a2, 3894
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_012
li $a1, 200
li $a2, 3895
jal log_test_assert_board
# Case 38: Clearing row 0 terminates and preserves row 1
log_test_case_038:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 4095
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4096
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4097
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4098
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4099
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4100
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4101
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4102
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4103
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4104
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4105
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
addi $t8, $t8, 0
li $t9, 10
li $t6, 4
log_test_fill_7:
sw $t6, 0($t8)
addi $t8, $t8, 4
addi $t9, $t9, -1
bgtz $t9, log_test_fill_7
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 60($t8)
jal check_and_clear_lines
move $a0, $s0
li $a1, 1000
li $a2, 4106
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4107
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4108
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4109
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4110
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4111
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4112
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4113
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4114
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4115
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4116
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 1
li $a2, 4117
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_013
li $a1, 200
li $a2, 4118
jal log_test_assert_board
# Case 39: Incomplete rows stay unchanged
log_test_case_039:
jal initialize_playfield
move $a0, $s0
li $a1, 1000
li $a2, 4318
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4319
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4320
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4321
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4322
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4323
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4324
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4325
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4326
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4327
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4328
jal log_test_assert_equal
li $t8, 0
sw $t8, SCORE
li $t8, 0
sw $t8, LINES_CLEARED
li $t8, 1000
sw $t8, GRAVITY_INTERVAL
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 0($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 4($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 8($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 12($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 16($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 20($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 24($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 28($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 32($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 36($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 40($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 44($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 48($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 52($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 56($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 60($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 64($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 68($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 72($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 76($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 80($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 84($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 88($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 92($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 96($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 100($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 104($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 108($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 112($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 116($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 120($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 124($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 128($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 132($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 136($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 140($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 144($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 148($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 152($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 156($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 160($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 164($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 168($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 172($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 176($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 180($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 184($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 188($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 192($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 196($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 200($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 204($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 208($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 212($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 216($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 220($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 224($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 228($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 232($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 236($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 240($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 244($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 248($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 252($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 256($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 260($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 264($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 268($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 272($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 276($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 280($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 284($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 288($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 292($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 296($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 300($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 304($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 308($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 312($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 316($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 320($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 324($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 328($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 332($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 336($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 340($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 344($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 348($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 352($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 356($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 360($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 364($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 368($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 372($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 376($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 380($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 384($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 388($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 392($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 396($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 400($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 404($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 408($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 412($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 416($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 420($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 424($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 428($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 432($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 436($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 440($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 444($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 448($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 452($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 456($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 460($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 464($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 468($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 472($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 476($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 480($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 484($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 488($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 492($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 496($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 500($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 504($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 508($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 512($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 516($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 520($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 524($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 528($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 532($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 536($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 540($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 544($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 548($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 552($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 556($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 560($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 564($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 568($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 572($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 576($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 580($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 584($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 588($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 592($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 596($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 600($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 604($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 608($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 612($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 616($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 620($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 624($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 628($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 632($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 636($t8)
la $t8, PLAYFIELD
li $t9, 0
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
li $t9, 0
sw $t9, 672($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 676($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 680($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 684($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 688($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 692($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 696($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 700($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 704($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 708($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 712($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 716($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 720($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 724($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 728($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 732($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 736($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 740($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 744($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 748($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 752($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 756($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 760($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 764($t8)
la $t8, PLAYFIELD
li $t9, 0
sw $t9, 768($t8)
la $t8, PLAYFIELD
li $t9, 1
sw $t9, 772($t8)
la $t8, PLAYFIELD
li $t9, 2
sw $t9, 776($t8)
la $t8, PLAYFIELD
li $t9, 3
sw $t9, 780($t8)
la $t8, PLAYFIELD
li $t9, 4
sw $t9, 784($t8)
la $t8, PLAYFIELD
li $t9, 5
sw $t9, 788($t8)
la $t8, PLAYFIELD
li $t9, 6
sw $t9, 792($t8)
la $t8, PLAYFIELD
li $t9, 7
sw $t9, 796($t8)
jal check_and_clear_lines
move $a0, $s0
li $a1, 1000
li $a2, 4329
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4330
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4331
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4332
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4333
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4334
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4335
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4336
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4337
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4338
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4339
jal log_test_assert_equal
lw $a0, LINES_CLEARED
move $a0, $a0
li $a1, 0
li $a2, 4340
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 0
li $a2, 4341
jal log_test_assert_equal
# Compare all 200 cells using the original expected values and IDs.
la $a0, log_test_expected_board_005
li $a1, 200
li $a2, 4342
jal log_test_assert_board
# Case 40: High score: current 300, previous 500
log_test_case_040:
li $t8, 300
sw $t8, SCORE
li $t8, 500
sw $t8, HIGH_SCORE
jal update_high_score
move $a0, $s0
li $a1, 1000
li $a2, 4542
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4543
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4544
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4545
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4546
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4547
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4548
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4549
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4550
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4551
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4552
jal log_test_assert_equal
lw $a0, HIGH_SCORE
move $a0, $a0
li $a1, 500
li $a2, 4553
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 300
li $a2, 4554
jal log_test_assert_equal
# Case 41: High score: current 500, previous 500
log_test_case_041:
li $t8, 500
sw $t8, SCORE
li $t8, 500
sw $t8, HIGH_SCORE
jal update_high_score
move $a0, $s0
li $a1, 1000
li $a2, 4555
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4556
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4557
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4558
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4559
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4560
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4561
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4562
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4563
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4564
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4565
jal log_test_assert_equal
lw $a0, HIGH_SCORE
move $a0, $a0
li $a1, 500
li $a2, 4566
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 500
li $a2, 4567
jal log_test_assert_equal
# Case 42: High score: current 800, previous 500
log_test_case_042:
li $t8, 800
sw $t8, SCORE
li $t8, 500
sw $t8, HIGH_SCORE
jal update_high_score
move $a0, $s0
li $a1, 1000
li $a2, 4568
jal log_test_assert_equal
move $a0, $s1
li $a1, 1001
li $a2, 4569
jal log_test_assert_equal
move $a0, $s2
li $a1, 1002
li $a2, 4570
jal log_test_assert_equal
move $a0, $s3
li $a1, 1003
li $a2, 4571
jal log_test_assert_equal
move $a0, $s4
li $a1, 1004
li $a2, 4572
jal log_test_assert_equal
move $a0, $s5
li $a1, 1005
li $a2, 4573
jal log_test_assert_equal
move $a0, $s6
li $a1, 1006
li $a2, 4574
jal log_test_assert_equal
move $a0, $s7
li $a1, 1007
li $a2, 4575
jal log_test_assert_equal
move $a0, $sp
lw $a1, log_test_saved_sp
li $a2, 4576
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, -4($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4577
jal log_test_assert_equal
la $t8, PLAYFIELD
lw $a0, 800($t8)
move $a0, $a0
li $a1, 123456789
li $a2, 4578
jal log_test_assert_equal
lw $a0, HIGH_SCORE
move $a0, $a0
li $a1, 800
li $a2, 4579
jal log_test_assert_equal
lw $a0, SCORE
move $a0, $a0
li $a1, 800
li $a2, 4580
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
# Arguments: a0 actual, a1 expected, a2 assertion ID.
# Preserves all saved registers and sp; modifies t8 and t9 on success.

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
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
log_test_expected_board_002:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 6, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
    .word 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
log_test_expected_board_004:
    .word 0, 5, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
log_test_expected_board_006:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
log_test_expected_board_007:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
log_test_expected_board_008:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
    .word 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
    .word 0, 1, 2, 3, 4, 5, 6, 7, 0, 1
    .word 2, 3, 4, 5, 6, 7, 0, 1, 2, 3
    .word 4, 5, 6, 7, 0, 1, 2, 3, 4, 5
log_test_expected_board_009:
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
log_test_expected_board_010:
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
log_test_expected_board_011:
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
log_test_expected_board_012:
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
log_test_expected_board_013:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 6, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
