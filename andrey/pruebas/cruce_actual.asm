# Cross-check body for the current team modules; assemble through probar_referencia.ps1.
# The wrapper includes unmodified reference macros/data/font/graphics/core and Andrey's logic/pieces.
# Arguments: none. Prints observed checks and exits 1 when any contract fails.
# New test labels use log_. No production module is edited.
.data
log_ref_checks: .word 0
log_ref_failures: .word 0
log_ref_saved_sp: .word 0
log_ref_pass: .asciiz ": PASS\n"
log_ref_fail: .asciiz ": FAIL actual="
log_ref_expected: .asciiz " expected="
log_ref_newline: .asciiz "\n"
log_ref_summary: .asciiz "XR_SUMMARY checks="
log_ref_failure_count: .asciiz " failures="
log_ref_label_0: .asciiz "XR01 preserve s0"
log_ref_label_1: .asciiz "XR01 preserve s1"
log_ref_label_2: .asciiz "XR01 preserve s2"
log_ref_label_3: .asciiz "XR01 preserve s3"
log_ref_label_4: .asciiz "XR01 preserve s4"
log_ref_label_5: .asciiz "XR01 preserve s5"
log_ref_label_6: .asciiz "XR01 preserve s6"
log_ref_label_7: .asciiz "XR01 preserve s7"
log_ref_label_8: .asciiz "XR02 floor is not overwritten by the first out-of-board word"
log_ref_label_9: .asciiz "XR03 frozen color ID 1"
log_ref_label_10: .asciiz "XR03 frozen color ID 2"
log_ref_label_11: .asciiz "XR03 frozen color ID 3"
log_ref_label_12: .asciiz "XR03 frozen color ID 4"
log_ref_label_13: .asciiz "XR03 frozen color ID 5"
log_ref_label_14: .asciiz "XR03 frozen color ID 6"
log_ref_label_15: .asciiz "XR03 frozen color ID 7"
log_ref_label_16: .asciiz "XR10 hard drop distance"
log_ref_label_17: .asciiz "XR10 hard drop status"
log_ref_label_18: .asciiz "XR10 drop leaves score unchanged"
log_ref_label_19: .asciiz "XR10 drop leaves lines unchanged"
log_ref_label_20: .asciiz "XR11 four-line count"
log_ref_label_21: .asciiz "XR11 lines accumulated once"
log_ref_label_22: .asciiz "XR11 clearing leaves score unchanged"
log_ref_label_23: .asciiz "XR12 four-line award at supplied level 2"
log_ref_label_24: .asciiz "XR12 score total"
log_ref_label_25: .asciiz "XR12 scoring does not recount lines"
log_ref_label_26: .asciiz "XR13 real core level after 11 lines"
log_ref_label_27: .asciiz "XR13 real core gravity at level 3"
log_ref_label_28: .asciiz "XR13 move continues"
log_ref_label_29: .asciiz "XR14 level at 0 lines"
log_ref_label_30: .asciiz "XR14 state at 0 lines"
log_ref_label_31: .asciiz "XR14 level at 4 lines"
log_ref_label_32: .asciiz "XR14 state at 4 lines"
log_ref_label_33: .asciiz "XR14 level at 5 lines"
log_ref_label_34: .asciiz "XR14 state at 5 lines"
log_ref_label_35: .asciiz "XR14 level at 6 lines"
log_ref_label_36: .asciiz "XR14 state at 6 lines"
log_ref_label_37: .asciiz "XR14 level at 45 lines"
log_ref_label_38: .asciiz "XR14 state at 45 lines"
log_ref_label_39: .asciiz "XR14 level at 49 lines"
log_ref_label_40: .asciiz "XR14 state at 49 lines"
log_ref_label_41: .asciiz "XR14 level at 50 lines"
log_ref_label_42: .asciiz "XR14 state at 50 lines"
.text
.globl main
main:
sw $sp, log_ref_saved_sp
jal initialize_playfield
la $t0, PLAYFIELD
li $t1, 1
log_ref_fill_ids:
sw $t1, 0($t0)
addi $t0, $t0, 4
addi $t1, $t1, 1
blt $t1, 8, log_ref_fill_ids
li $s0, 1000
li $s1, 1001
li $s2, 1002
li $s3, 1003
li $s4, 1004
li $s5, 1005
li $s6, 1006
li $s7, 1007
jal draw_scene
move $a0, $s0
li $a1, 1000
la $a2, log_ref_label_0
jal log_ref_equal
move $a0, $s1
li $a1, 1001
la $a2, log_ref_label_1
jal log_ref_equal
move $a0, $s2
li $a1, 1002
la $a2, log_ref_label_2
jal log_ref_equal
move $a0, $s3
li $a1, 1003
la $a2, log_ref_label_3
jal log_ref_equal
move $a0, $s4
li $a1, 1004
la $a2, log_ref_label_4
jal log_ref_equal
move $a0, $s5
li $a1, 1005
la $a2, log_ref_label_5
jal log_ref_equal
move $a0, $s6
li $a1, 1006
la $a2, log_ref_label_6
jal log_ref_equal
move $a0, $s7
li $a1, 1007
la $a2, log_ref_label_7
jal log_ref_equal
lw $t0, ADDR_DSPL
lw $a0, 3976($t0)
lw $a1, COLOR_BG_WALL
la $a2, log_ref_label_8
jal log_ref_equal
lw $t0, ADDR_DSPL
lw $a0, 1416($t0)
la $t0, ALL_COLORS_TABLE
lw $t0, 0($t0)
lw $a1, 0($t0)
la $a2, log_ref_label_9
jal log_ref_equal
lw $t0, ADDR_DSPL
lw $a0, 1420($t0)
la $t0, ALL_COLORS_TABLE
lw $t0, 4($t0)
lw $a1, 0($t0)
la $a2, log_ref_label_10
jal log_ref_equal
lw $t0, ADDR_DSPL
lw $a0, 1424($t0)
la $t0, ALL_COLORS_TABLE
lw $t0, 8($t0)
lw $a1, 0($t0)
la $a2, log_ref_label_11
jal log_ref_equal
lw $t0, ADDR_DSPL
lw $a0, 1428($t0)
la $t0, ALL_COLORS_TABLE
lw $t0, 12($t0)
lw $a1, 0($t0)
la $a2, log_ref_label_12
jal log_ref_equal
lw $t0, ADDR_DSPL
lw $a0, 1432($t0)
la $t0, ALL_COLORS_TABLE
lw $t0, 16($t0)
lw $a1, 0($t0)
la $a2, log_ref_label_13
jal log_ref_equal
lw $t0, ADDR_DSPL
lw $a0, 1436($t0)
la $t0, ALL_COLORS_TABLE
lw $t0, 20($t0)
lw $a1, 0($t0)
la $a2, log_ref_label_14
jal log_ref_equal
lw $t0, ADDR_DSPL
lw $a0, 1440($t0)
la $t0, ALL_COLORS_TABLE
lw $t0, 24($t0)
lw $a1, 0($t0)
la $a2, log_ref_label_15
jal log_ref_equal
# Reproduce one four-line move with the real shared data and real core level updater.
jal initialize_playfield
la $t0, PLAYFIELD
addi $t0, $t0, 640
li $t1, 0
li $t2, 2
log_ref_fill_bottom:
sw $t2, 0($t0)
addi $t0, $t0, 4
addi $t1, $t1, 1
blt $t1, 40, log_ref_fill_bottom
la $t0, PLAYFIELD
sw $zero, 656($t0)
sw $zero, 696($t0)
sw $zero, 736($t0)
sw $zero, 776($t0)
li $t0, 3
sw $t0, CURRENT_PIECE_X
sw $zero, CURRENT_PIECE_Y
sw $zero, CURRENT_PIECE_TYPE
li $t0, 1
sw $t0, CURRENT_PIECE_ORIENTATION
li $t0, 1234
sw $t0, SCORE
li $t0, 7
sw $t0, LINES_CLEARED
li $t0, 2
sw $t0, NIVEL
li $t0, EST_JUGANDO
sw $t0, ESTADO
jal log_hard_drop
move $a0, $v0
li $a1, 16
la $a2, log_ref_label_16
jal log_ref_equal
move $a0, $v1
li $a1, 0
la $a2, log_ref_label_17
jal log_ref_equal
lw $a0, SCORE
li $a1, 1234
la $a2, log_ref_label_18
jal log_ref_equal
lw $a0, LINES_CLEARED
li $a1, 7
la $a2, log_ref_label_19
jal log_ref_equal
jal check_and_clear_lines
move $a0, $v0
li $a1, 4
la $a2, log_ref_label_20
jal log_ref_equal
lw $a0, LINES_CLEARED
li $a1, 11
la $a2, log_ref_label_21
jal log_ref_equal
lw $a0, SCORE
li $a1, 1234
la $a2, log_ref_label_22
jal log_ref_equal
# The test supplies level 2 explicitly; this does not settle the team's level policy.
li $a0, 4
li $a1, 2
jal log_update_score
move $a0, $v0
li $a1, 1600
la $a2, log_ref_label_23
jal log_ref_equal
lw $a0, SCORE
li $a1, 2834
la $a2, log_ref_label_24
jal log_ref_equal
lw $a0, LINES_CLEARED
li $a1, 11
la $a2, log_ref_label_25
jal log_ref_equal
jal update_speed
lw $a0, NIVEL
li $a1, 3
la $a2, log_ref_label_26
jal log_ref_equal
lw $a0, GRAVITY_INTERVAL
li $a1, 700
la $a2, log_ref_label_27
jal log_ref_equal
lw $a0, ESTADO
li $a1, EST_JUGANDO
la $a2, log_ref_label_28
jal log_ref_equal
li $t0, 0
sw $t0, LINES_CLEARED
li $t0, EST_JUGANDO
sw $t0, ESTADO
jal update_speed
lw $a0, NIVEL
li $a1, 1
la $a2, log_ref_label_29
jal log_ref_equal
lw $a0, ESTADO
li $a1, EST_JUGANDO
la $a2, log_ref_label_30
jal log_ref_equal
li $t0, 4
sw $t0, LINES_CLEARED
li $t0, EST_JUGANDO
sw $t0, ESTADO
jal update_speed
lw $a0, NIVEL
li $a1, 1
la $a2, log_ref_label_31
jal log_ref_equal
lw $a0, ESTADO
li $a1, EST_JUGANDO
la $a2, log_ref_label_32
jal log_ref_equal
li $t0, 5
sw $t0, LINES_CLEARED
li $t0, EST_JUGANDO
sw $t0, ESTADO
jal update_speed
lw $a0, NIVEL
li $a1, 2
la $a2, log_ref_label_33
jal log_ref_equal
lw $a0, ESTADO
li $a1, EST_JUGANDO
la $a2, log_ref_label_34
jal log_ref_equal
li $t0, 6
sw $t0, LINES_CLEARED
li $t0, EST_JUGANDO
sw $t0, ESTADO
jal update_speed
lw $a0, NIVEL
li $a1, 2
la $a2, log_ref_label_35
jal log_ref_equal
lw $a0, ESTADO
li $a1, EST_JUGANDO
la $a2, log_ref_label_36
jal log_ref_equal
li $t0, 45
sw $t0, LINES_CLEARED
li $t0, EST_JUGANDO
sw $t0, ESTADO
jal update_speed
lw $a0, NIVEL
li $a1, 10
la $a2, log_ref_label_37
jal log_ref_equal
lw $a0, ESTADO
li $a1, EST_JUGANDO
la $a2, log_ref_label_38
jal log_ref_equal
li $t0, 49
sw $t0, LINES_CLEARED
li $t0, EST_JUGANDO
sw $t0, ESTADO
jal update_speed
lw $a0, NIVEL
li $a1, 10
la $a2, log_ref_label_39
jal log_ref_equal
lw $a0, ESTADO
li $a1, EST_JUGANDO
la $a2, log_ref_label_40
jal log_ref_equal
li $t0, 50
sw $t0, LINES_CLEARED
li $t0, EST_JUGANDO
sw $t0, ESTADO
jal update_speed
lw $a0, NIVEL
li $a1, 10
la $a2, log_ref_label_41
jal log_ref_equal
lw $a0, ESTADO
li $a1, EST_VICTORIA
la $a2, log_ref_label_42
jal log_ref_equal
li $v0, 4
la $a0, log_ref_summary
syscall
li $v0, 1
lw $a0, log_ref_checks
syscall
li $v0, 4
la $a0, log_ref_failure_count
syscall
li $v0, 1
lw $a0, log_ref_failures
syscall
li $v0, 4
la $a0, log_ref_newline
syscall
lw $a0, log_ref_failures
sltu $a0, $zero, $a0
li $v0, 17
syscall

# Arguments: a0 actual, a1 expected, a2 label pointer. Returns: none.
# Preserves: a1-a3, v1, s0-s7, ra/sp. Modifies: a0, v0, t0-t2.
# Continues after failures so graphics and core results stay distinguishable.
log_ref_equal:
move $t1, $a0
move $t2, $a1
lw $t0, log_ref_checks
addi $t0, $t0, 1
sw $t0, log_ref_checks
li $v0, 4
move $a0, $a2
syscall
bne $t1, $t2, log_ref_bad
la $a0, log_ref_pass
syscall
jr $ra
log_ref_bad:
lw $t0, log_ref_failures
addi $t0, $t0, 1
sw $t0, log_ref_failures
la $a0, log_ref_fail
syscall
li $v0, 1
move $a0, $t1
syscall
li $v0, 4
la $a0, log_ref_expected
syscall
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, log_ref_newline
syscall
jr $ra
