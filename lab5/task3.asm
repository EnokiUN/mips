# Title: Dynamic Array Allocator
# Author: Mahmoud Elmorsy
# Date: 2/15/2026
# Description: Dynamically writes n numbers from input then prints them out again in reverse
# Input: a number n + n integers
# Output: the n integers in reverse

################### Data segment #####################
.data
  prompt: .asciiz "How many numbers do you want to write? "
  prompt2: .asciiz "Enter a number: "
  resp: .asciiz "Your numbers reversed are: "

################### Code segment #####################
.text
.global main

main:
  li $v0, 4
  la $a0, prompt
  syscall
  
  li $v0, 5
  syscall
  
  move $s2, $v0
  
  li $v0, 9
  move $a0, $s2
  sll $a0, $a0, 2
  syscall
  
  li $s0, 0
  move $s1, $v0
  
  read_loop:
    addi $s0, $s0, 1
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    
    sw $v0, ($s1)
    addi $s1, $s1, 4
    
    bne $s0, $s2, read_loop
  
  li $v0, 4
  la $a0, resp
  syscall
  
  loop:
    subi $s1, $s1, 4
    
    li $v0, 1
    lw $a0, ($s1)
    syscall
    
    li $v0, 11
    li $a0, ' '
    syscall
    
    subi $s2, $s2, 1
    bgtz $s2, loop
    
  li $v0, 10
  syscall