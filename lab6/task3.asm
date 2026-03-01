# Title: High Percision Divider
# Author: Mahmoud Elmorsy
# Date: 3/1/2026
# Description: Returns the result of division of two numbers up to 8 decimal places
# Input: two integers x & y
# Output: x/y

################### Data segment #####################
.data
  prompt: .asciiz "Enter a number: "
  resp: .asciiz "Your numbers divided are: "

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
  la $a0, prompt
  syscall
  
  li $v0, 5
  syscall
  
  move $s1, $v0
  
  li $v0, 4
  la $a0, resp
  syscall
  
  div $s0, $s1
  mflo $a0
  
  li $v0, 1
  syscall
  
  li $v0, 11
  li $a0, '.'
  syscall
  
  li $s3, 0
  loop:
    addi $s3, $s3, 1
    mfhi $s0
    mul $s0, $s0, 10
    div $s0, $s1
    mflo $a0
    
    li $v0, 1
    syscall
    bne $s3, 8, loop
   

    
  li $v0, 10
  syscall
