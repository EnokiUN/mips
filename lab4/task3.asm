# Title: Number Summer
# Author: Mahmoud Elmorsy
# Date: 2/8/2026
# Description: Returns the sum of all integers between two intered numbers
# Input: Two integers x and y
# Output: sum of all integers from x to y inclusive

################### Data segment #####################
.data
  prompt: .asciiz "Enter an integer value: "
  resp: .asciiz "Your sum is "

################### Code segment #####################
.text
.global main

main:
  # x
  li $v0, 4
  la $a0, prompt
  syscall
  
  li $v0, 5
  syscall
  
  move $s0, $v0
  
  # y
  li $v0, 4
  la $a0, prompt
  syscall
  
  li $v0, 5
  syscall
   
  move $s1, $v0
  
  li $v0, 4
  la $a0, resp
  syscall

  move $a0, $s0
  
  loop:
    beq $s0, $s1, exit
    addi $s0, $s0, 1
    add $a0, $a0, $s0
    j loop

exit:
  li $v0, 1
  syscall
  li $v0, 10
  syscall
