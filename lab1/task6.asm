# Title: Number Comparer
# Author: Mahmoud Elmorsy
# Date: 1/18/2026
# Description: Checks if two input numbers are equal or not
# Input: 2 numbers (x and y)
# Output: Whether x == y

################### Data segment #####################
.data
  prompt: .asciiz "Enter an integer value: "
  resp1: .asciiz "X and Y are equal"
  resp2: .asciiz "X and Y are not equal"

################### Code segment #####################
.text
.global main

main:
  # Read x and y into Ss0 and $v0
  li $v0, 4
  la $a0, prompt
  syscall
  
  li $v0, 5
  syscall
  
  move $s0, $v0
  
  li $v0, 4
  la $a0, prompt
  syscall
  
  li $v0, 5
  syscall
  
  # If x and y are equal, jump to the equal labl
  beq $v0, $s0, equal
  li $v0, 4
  la $a0, resp2
  syscall
  
  j exit # Then jump to the exit so we don't print both responses

equal:
  li $v0, 4
  la $a0, resp1
  syscall

exit:
  li $v0, 10
  syscall
