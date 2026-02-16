# Title: Number reader
# Author: Mahmoud Elmorsy
# Date: 1/18/2026
# Description: Simple MIPS program to read a number then write it
# Input: number x
# Output: 2x

################### Data segment #####################
.data
  prompt: .asciiz "Enter an integer value: "
  resp: .asciiz "What you entered *2 is "
  redo: .asciiz "\nRepeat? [y/n]? "

################### Code segment #####################
.text
.global main

main:
  # Service code 4 -> print string
  li $v0, 4
  # We pass in the pointer to the start of our string where it will keep reading until it finds a null byte
  # Interestingly this also means that if your data contains a null byte it will not print all of it, and if it doesn't
  # contain a null byte it will (rightfully) ignore your strings' boundaries at assignment and keep reading until a null byte is found (.data is by default flushed with null bytes)
  la $a0, prompt
  syscall
  
  # Service code 5 -> read integer
  # This writes the result to $v0, and stops reading an a newline (\n)
  li $v0, 5
  syscall
  
  # We save our read value from $v0 to $s0, which is supposedly reserved for long-term variables across functions
  move $s0, $v0
  
  # Service code 4 -> print string
  li $v0, 4
  # Repetition of print above but with different data pointer
  la $a0, resp
  syscall
  
  # Service code 1 -> print integer
  li $v0, 1
  # We put the number we'd saved in $s0 in $a0 as per the service code requirement while also doubling it
  # by adding $s0 to $s0 and write that to $a0
  add $a0, $s0, $s0
  syscall
  
  # Service code 4 -> print string
  li $v0, 4
  # Repetition of print above but with different data pointer
  la $a0, redo
  syscall
  
  # Service code 12 -> read character
  # This puts the resulting character into $v0
  li $v0, 12
  syscall
  
  # Again, we save our read value so that we can incoke other service codes before handling it
  move $s0, $v0
  
  # Service code 11 -> print character
  # This takes the character from $a0
  li $v0, 11
  # Extra thing to make the program look slightly tidier
  li $a0, '\n'
  syscall
  
  # If the character read is equal to y, branch back to the main label (start of the program)
  beq $s0, 'y', main
  
  # Service code 10 -> exit with code 0
  li $v0, 10
  syscall
