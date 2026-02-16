# Title: Bit Swapper
# Author: Mahmoud Elmorsy
# Date: 1/25/2026
# Description: Takes in a number and returns the number with its even and odd bits swapped
# Input: number
# Output: number with even and odd bits swapped
################### Data segment #####################
.data
  prompt: .asciiz "Enter a number: "
  resp: .asciiz "The value of your number with bits swapped is "

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
  
  li $t0, 0xAAAAAAAA # alternating bitmasks
  li $t1, 0x55555555
  
  and $t2, $s0, $t0
  srl $t2, $t2, 1
  and $t3, $s0, $t1
  sll $t3, $t3, 1
  
  or $a0, $t2, $t3
  
  li $v0, 1
  syscall

  li $v0, 10
  syscall
