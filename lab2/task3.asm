# Title: 24.5 Multiplier
# Author: Mahmoud Elmorsy
# Date: 1/25/2026
# Description: Takes in a number and returns its value multiplier by 24.5
# Input: number
# Output: number*24.5
################### Data segment #####################
.data
  prompt: .asciiz "Enter a number: "
  resp: .asciiz "The value of your number * 24.5 is "
  fract: .asciiz ".5"

################### Code segment #####################
.text
.globl main

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
  
  sll $t0, $s0, 3 # 8x
  sll $t1, $t0, 1 # 16x
  srl $t2, $s0, 1 # ~.5x
  
  add $a0, $t0, $t1 # 8 + 16 = 24
  add $a0, $a0, $t2 # 24 + .5 = 24.5
  
  li $v0, 1
  syscall
  
  # floating part handling
  andi $t3, $s0, 1
  beqz $t3, end
  
  li $v0, 4
  la $a0, fract
  syscall
  
end:
  li $v0, 10
  syscall
