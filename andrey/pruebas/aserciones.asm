# Shared standalone assertions. Include after the test's main and its exit.
.data
.align 2
log_test_saved_sp:   .word 0
log_test_assertions: .word 0
log_test_last_v0:    .word 0
log_test_last_v1:    .word 0
log_test_arg0:       .word 0
log_test_arg1:       .word 0
log_test_arg2:       .word 0
log_test_arg3:       .word 0
log_test_pass_msg:   .asciiz "PASS assertions: "
log_test_fail_msg:   .asciiz "FAIL assertion ID: "
log_test_newline:    .asciiz "\n"
.text

# Arguments: a0 actual value, a1 expected value, a2 assertion ID.
# Returns: none on success; exits with code 1 on the first mismatch.
# Preserves: saved registers, sp, ra, a0-a3 and v0-v1 on success.
# Modifies: t8 and t9 on success. Failure prints the ID and terminates.
log_test_assert_equal:
    bne  $a0, $a1, log_test_fail
    la   $t8, log_test_assertions
    lw   $t9, 0($t8)
    addi $t9, $t9, 1
    sw   $t9, 0($t8)
    jr   $ra

# Arguments: a0 expected word array, a1 word count, a2 first assertion ID.
# Returns: none. Compares PLAYFIELD with the fixture, preserving original IDs.
# Preserves: s0-s7, sp, ra and v0-v1. Modifies: a0-a2 and temporary registers.
log_test_assert_board:
    addi $sp, $sp, -24
    sw   $ra, 20($sp)
    sw   $s0, 16($sp)
    sw   $s1, 12($sp)
    sw   $s2, 8($sp)
    sw   $s3, 4($sp)
    la   $s0, PLAYFIELD
    move $s1, $a0
    move $s2, $a1
    move $s3, $a2
    blez $s2, log_test_board_done
log_test_board_loop:
    lw   $a0, 0($s0)
    lw   $a1, 0($s1)
    move $a2, $s3
    jal  log_test_assert_equal
    addi $s0, $s0, 4
    addi $s1, $s1, 4
    addi $s2, $s2, -1
    addi $s3, $s3, 1
    bgtz $s2, log_test_board_loop
log_test_board_done:
    lw   $s3, 4($sp)
    lw   $s2, 8($sp)
    lw   $s1, 12($sp)
    lw   $s0, 16($sp)
    lw   $ra, 20($sp)
    addi $sp, $sp, 24
    jr   $ra

log_test_fail:
    li   $v0, 4
    la   $a0, log_test_fail_msg
    syscall
    li   $v0, 1
    move $a0, $a2
    syscall
    li   $v0, 4
    la   $a0, log_test_newline
    syscall
    li   $a0, 1
    li   $v0, 17
    syscall
