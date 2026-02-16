# Title: Character Capitalisation Flipper
# Author: Mahmoud Elmorsy
# Date: 1/25/2026
# Description: Takes in a character as an input and returns its inverted case version
# Input: character (uppercase or lowercase)
# Output: character in inverted case
################### Data segment #####################
.data
  prompt: .asciiz "Enter a lower/uppercase character: "
  resp: .asciiz "Your character in flipped case is "
  err: .asciiz "Invalid character.\n"

################### Code segment #####################
.text
.globl main

main:
  li $v0, 4
  la $a0, prompt
  syscall
  
  li $v0, 12
  syscall
  
  move $s0, $v0
  
  li $v0, 11
  li $a0, '\n'
  syscall
  
  bge $s0, 'a', lowercase
  bgt $s0, 'Z', error
  blt $s0, 'A', error
  
  addiu $s0, $s0, ' '
  b output
 
lowercase:
  bgt $s0, 'z', error
  subiu $s0, $s0, ' '
  
output:
  li $v0, 4
  la $a0, resp
  syscall
  
  li $v0, 11
  move $a0, $s0
  syscall
  b end
  
error:
  li $v0, 4
  la $a0, err
  syscall

end:
  li $v0, 10
  syscall
