# Title: Number Inspector
# Author: Mahmoud Elmorsy
# Date: 2/8/2026
# Description: Classifies a number into one of five categories based on sign and evenness
# Input: A number x
# Output: The category the number falls into

################### Data segment #####################
.data
  prompt: .asciiz "Enter an integer value: "
  pe: .asciiz "Your number is a positive even number"
  po: .asciiz "Your number is a positive odd number"
  ne: .asciiz "Your number is a negative even number"
  no: .asciiz "Your number is a negative odd number"
  zero: .asciiz "You entered a zero!"

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
  
  and $s1, $s0, 1
  bltz $s0, nep
  bnez $s1 pop
  
  bgtz $s0, pep
  
  li $v0, 4
  la $a0, zero
  syscall
  j exit
  
pep:
  li $v0, 4
  la $a0, pe
  syscall
  j exit
  
pop:
  li $v0, 4
  la $a0, po
  syscall
  j exit
  
nep:
  bnez $s1 nop
  li $v0, 4
  la $a0, ne
  syscall
  j exit
  
nop:
  li $v0, 4
  la $a0, no
  syscall

exit:
  li $v0, 10
  syscall
