# Title: Number Digit Sum Calculator
# Author: Mahmoud Elmorsy
# Date: 3/1/2026
# Description: Returns the sum of the digits of a number
# Input: a number of digits a31 a30 a29 ... a1 a0
# Output: a31 + a30 + a29 + ... + a1 + a0

################### Data segment #####################
.data
  prompt: .asciiz "Enter a number: "
  resp: .asciiz "Your number's digits summed are: "

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
    div $s0, $s0, 10
    mflo $s0
    mfhi $t0
    add $a0, $a0, $t0
    bgtz $s0, loop
   
  li $v0, 1
  syscall
    
  li $v0, 10
  syscall
