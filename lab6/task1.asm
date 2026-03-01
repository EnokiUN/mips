# Title: Factorial Calculator
# Author: Mahmoud Elmorsy
# Date: 3/1/2026
# Description: Returns the factorial of a number
# Input: a number x
# Output: x!

################### Data segment #####################
.data
  prompt: .asciiz "Enter a number: "
  resp: .asciiz "Your number factorial is: "

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
  
  li $s1, 1
  li $a0, 1
  loop:
    beq $s1, $s0, end
    addi $s1, $s1, 1
    mul $a0, $a0, $s1
    j loop
  end:
   
  li $v0, 1
  syscall
    
  li $v0, 10
  syscall
