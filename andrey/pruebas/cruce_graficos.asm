# Read-only cross-module check of Jorge's current draw_scene procedure.
# Uses the real graphics/data/font modules without editing any of them.
# XJ01 checks the team's saved-register contract.
# XJ02 checks that a 10x20 renderer ignores logical board index 200.
# The pixel probe matches the current layout: legacy index 200 -> (11,12).
# If Jorge changes the layout, coordinate an updated probe before reusing XJ02.
# Exit 0 means both checks passed; exit 1 means an integration issue was found.
.include "../../datos.asm"
.include "../../fuente.asm"
.data
.align 2
log_cross_saved_sp:    .word 0
log_cross_observed_s0: .word 0
log_cross_observed_s1: .word 0
log_cross_observed_s2: .word 0
log_cross_pixel:       .word 0
log_cross_failures:    .word 0
log_cross_abi_pass: .asciiz "XJ01 saved-register preservation: PASS\n"
log_cross_abi_fail: .asciiz "XJ01 saved-register preservation: FAIL\n"
log_cross_board_pass: .asciiz "XJ02 ignores logical index 200: PASS\n"
log_cross_board_fail: .asciiz "XJ02 ignores logical index 200: FAIL\n"
log_cross_s0_msg: .asciiz "observed s0 (expected 1000): "
log_cross_s1_msg: .asciiz "observed s1 (expected 1001): "
log_cross_s2_msg: .asciiz "observed s2 (expected 1002): "
log_cross_expected_msg: .asciiz "pixel expected background: "
log_cross_actual_msg: .asciiz "pixel observed: "
log_cross_newline: .asciiz "\n"
.text
.globl main
main:
    # Clear the real legacy allocation, then mark the first non-playable index.
    la   $t0, PLAYFIELD
    li   $t1, 512
log_cross_clear_loop:
    sw   $zero, 0($t0)
    addi $t0, $t0, 4
    addi $t1, $t1, -1
    bgtz $t1, log_cross_clear_loop
    la   $t0, PLAYFIELD
    li   $t1, 7
    sw   $t1, 800($t0)       # Logical index 200 is outside the 200-cell board
    sw   $sp, log_cross_saved_sp
    li   $s0, 1000
    li   $s1, 1001
    li   $s2, 1002
    li   $s3, 1003
    li   $s4, 1004
    li   $s5, 1005
    li   $s6, 1006
    li   $s7, 1007
    jal  draw_scene
    sw   $s0, log_cross_observed_s0
    sw   $s1, log_cross_observed_s1
    sw   $s2, log_cross_observed_s2

    li   $t0, 1000
    bne  $s0, $t0, log_cross_abi_bad
    li   $t0, 1001
    bne  $s1, $t0, log_cross_abi_bad
    li   $t0, 1002
    bne  $s2, $t0, log_cross_abi_bad
    li   $t0, 1003
    bne  $s3, $t0, log_cross_abi_bad
    li   $t0, 1004
    bne  $s4, $t0, log_cross_abi_bad
    li   $t0, 1005
    bne  $s5, $t0, log_cross_abi_bad
    li   $t0, 1006
    bne  $s6, $t0, log_cross_abi_bad
    li   $t0, 1007
    bne  $s7, $t0, log_cross_abi_bad
    lw   $t0, log_cross_saved_sp
    bne  $sp, $t0, log_cross_abi_bad
    la   $a0, log_cross_abi_pass
    jal  log_cross_print_text
    j    log_cross_abi_report
log_cross_abi_bad:
    lw   $t0, log_cross_failures
    addi $t0, $t0, 1
    sw   $t0, log_cross_failures
    la   $a0, log_cross_abi_fail
    jal  log_cross_print_text
log_cross_abi_report:
    la   $a0, log_cross_s0_msg
    lw   $a1, log_cross_observed_s0
    jal  log_cross_print_value
    la   $a0, log_cross_s1_msg
    lw   $a1, log_cross_observed_s1
    jal  log_cross_print_value
    la   $a0, log_cross_s2_msg
    lw   $a1, log_cross_observed_s2
    jal  log_cross_print_value

    # An empty logical board should show background, not the out-of-board marker.
    lw   $t0, ADDR_DSPL
    lw   $t1, 1580($t0)      # ((12 * 32) + 11) * 4
    sw   $t1, log_cross_pixel
    lw   $t2, COLOR_BG_GRAY_LIGHT
    bne  $t1, $t2, log_cross_board_bad
    la   $a0, log_cross_board_pass
    jal  log_cross_print_text
    j    log_cross_board_report
log_cross_board_bad:
    lw   $t0, log_cross_failures
    addi $t0, $t0, 1
    sw   $t0, log_cross_failures
    la   $a0, log_cross_board_fail
    jal  log_cross_print_text
log_cross_board_report:
    la   $a0, log_cross_expected_msg
    lw   $a1, COLOR_BG_GRAY_LIGHT
    jal  log_cross_print_value
    la   $a0, log_cross_actual_msg
    lw   $a1, log_cross_pixel
    jal  log_cross_print_value
    lw   $a0, log_cross_failures
    beq  $a0, $zero, log_cross_exit
    li   $a0, 1
log_cross_exit:
    li   $v0, 17
    syscall

# Arguments: a0 string pointer. Returns none. Modifies v0; preserves ra/sp/s0-s7.
log_cross_print_text:
    li   $v0, 4
    syscall
    jr   $ra

# Arguments: a0 prefix string, a1 integer. Returns none.
# Modifies a0/v0; preserves a1, ra, sp and s0-s7. Makes no procedure calls.
log_cross_print_value:
    li   $v0, 4
    syscall
    move $a0, $a1
    li   $v0, 1
    syscall
    la   $a0, log_cross_newline
    li   $v0, 4
    syscall
    jr   $ra

.include "../../graficos.asm"
