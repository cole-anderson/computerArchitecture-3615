.data
  promptInput: .asciiz "Input N where 0<N<12"
  promptOutput: .asciiz "Factorial of N:"
  prompt_new: .asciiz "\n"
  N: .word 0
  F: .word 0

  .text
    .globl main

    main:
          li $v0, 4
          la $a0, promptInput
          syscall

          la $a0, prompt_new
          li $v0, 4
          syscall

          li $v0, 5
          syscall

          sw $v0, N

          #func
          lw $a0, N
          jal factorial
          sw $v0, F

          li $v0, 4
          la $a0, promptOutput
          syscall

          li $v0, 1
          lw $a0, F
          syscall

          li $v0, 10
          syscall

.globl factorial
factorial:

  subu $sp, $sp, 8
  sw $ra, ($sp)
  sw $s0, 4($sp)

  li $v0, 1
  beq $a0, 0, factdone

  move $s0, $a0
  sub $a0, $a0, 1
  jal factorial

  mul $v0, $s0, $v0

  factdone:
    lw $ra, ($sp)
    lw $s0, 4($sp)
    addu $sp, $sp, 8

    jr $ra
