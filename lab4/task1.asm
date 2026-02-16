# Title: 1 counter
# Author: Mahmoud Elmorsy
# Date: 2/8/2026
# Description: Returns the number of ones in a provided integer
# Input: A number x
# Output: The number of 1s in xs binary representation

################### Data segment #####################
.data
  prompt: .asciiz "Enter an integer value: "
  resp: .asciiz "The number of 1s in your numbers' binary representation is "

################### Code segment #####################
.text
.global main

main:
  li $v0, 4
  la $a0, prompt
  syscall
  
  li $v0, 5
  syscall
  
  move $s0, $v0
  
  li $v0, 4
  la $a0, resp
  syscall

  li $a0, 0
  
  loop:
    and $s1, $s0, 1
    add $a0, $a0, $s1
    srl $s0, $s0, 1
    bnez $s0, loop

  li $v0, 1
  syscall
  li $v0, 10
  syscall
