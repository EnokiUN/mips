# Title: Number Summer v2
# Author: Mahmoud Elmorsy
# Date: 2/15/2026
# Description: Asks a user to input 10 elements and returns their sum
# Input: 10 integers
# Output: sum of the 10 integers

################### Data segment #####################
.data
  prompt: .asciiz "Enter an integer value: "
  resp: .asciiz "Your sum is "
  arr1: .word 0:10

################### Code segment #####################
.text
.global main

main:
  li $s0, 0
  la $s1, arr1
  
  read_loop:
    addi $s0, $s0, 1
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    
    sw $v0, ($s1)
    addi $s1, $s1, 4
    
    bne $s0, 10, read_loop
  
  li $v0, 4
  la $a0, resp
  syscall

  lw $a0, arr1
  li $s0, 1
  la $s1, arr1
  
  loop:
    addi $s0, $s0, 1
    addi $s1, $s1, 4
    
    lw $t1, ($s1)
    add $a0, $a0, $t1
    
    bne $s0, 10, loop
    

  li $v0, 1
  syscall
  li $v0, 10
  syscall
