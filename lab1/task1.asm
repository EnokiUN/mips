# Title: Hello, World!
# Author: Mahmoud Elmorsy
# Date: 1/18/2026
# Description: Simple MIPS program to print the classic beloved "Hello, World!"
# Input: -
# Output: "Hello, World!"
################### Data segment #####################
.data
  hello: .asciiz "Hello, World!\n"

################### Code segment #####################
.text
.globl main

main:
  li $v0, 4
  la $a0, hello
  syscall
  li $v0, 10
  syscall