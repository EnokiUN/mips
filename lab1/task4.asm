# Title: Greeter
# Author: Mahmoud Elmorsy
# Date: 1/18/2026
# Description: Simple program to find your name and print it back
# Input: name
# Output: name

################### Data segment #####################
.data
  prompt: .asciiz "Hi! What's your name? "
  resp: .asciiz "Hello "
  name: .ascii "" # I use this as a naive way to get the address of the end of my data

################### Code segment #####################
.text
.global main

main:
  li $v0, 4
  la $a0, prompt
  syscall

  li $v0, 8
  la $a0, name # Write the data at the end of my heap (?) or whatever the data section is
  li $a1, 32
  syscall

  li $v0, 4
  la $a0, resp
  syscall
  
  li $v0, 4
  la $a0, name # Print name as usual
  syscall
  
  li $v0, 10
  syscall
