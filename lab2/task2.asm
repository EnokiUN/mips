# Title: Bit Value Analyser
# Author: Mahmoud Elmorsy
# Date: 1/25/2026
# Description: Takes in a number and a position and returns the value of the bit at that position
# Input: number + 1 bit position
# Output: value of bit at position
################### Data segment #####################
.data
  prompt_num: .asciiz "Enter a number: "
  prompt_pos: .asciiz "Enter a bit position: "
  resp: .asciiz "The value of your bit is "
  err: .asciiz "Invalid bit position.\n"

################### Code segment #####################
.text
.globl main

main:
  li $v0, 4
  la $a0, prompt_num
  syscall
  
  li $v0, 5
  syscall
  
  move $s0, $v0
  
  li $v0, 4
  la $a0, prompt_pos
  syscall
  
  li $v0, 5
  syscall
  
  bgt $v0, 31, error
  blt $v0, 0, error
  
  li $t1, 1
  sllv $t1, $t1, $v0
  
  li $v0, 4
  la $a0, resp
  syscall
  
  and $a0, $t1, $s0
  
  li $v0, 1
  syscall

  b end
  
error:
  li $v0, 4
  la $a0, err
  syscall

end:
  li $v0, 10
  syscall
