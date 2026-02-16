# Title: Math thing
# Author: Mahmoud Elmorsy
# Date: 1/18/2026
# Description: Runs an arbitrary (a+b) - (c+101) and returns the result
# Input: 3 numbers (a, b and c)
# Output: (a + b) - (c + 101)

# a) at a = 5, b = 10 and c = -30, s = -56
# b) a mixture of add ($a0 = $s0 + $s1), sub ($a0 = $a0 - $s2) and subi ($a0 = $a0 - 101)
#    The registers used are $a0 to be able to output the result with the service call 1 and $s0, $s1 and $s2 for the temporary storage of input variables
# c) These three instructions take the addresses from 0x00400068 to 0x00400070
# d) The address of $a0 (which I used for these computations) is the relative address 4 (which is equal to 0x4) to the start of the program's memory
#    Based on the instruction being 0x02112020 and knowing that this is an R-type instruction (as it takes in 3 registers) we can decode the hex to decimal like so:
# BIN 000000 10000 10001 00100 00000 100000
# DEC      0    16    17     4
# HEX      0    10    11     4
#     ^ op   ^ $s0 ^ $s1 ^ $a0 ^ s0  ^ ALU function (probably add)
# Which makes quite a lot of sense actually, as $a0 is mapped to $4, $s0 to $16 and $s1 to %$17

################### Data segment #####################
.data
  prompt: .asciiz "Enter an integer value: "
  resp: .asciiz "Result: "

################### Code segment #####################
.text
.global main

main:
  # Read a, b and c into s0, s1 and s2
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
  la $a0, prompt
  syscall
  
  li $v0, 5
  syscall
  
  move $s2, $v0
  
  # Print result header string
  li $v0, 4
  la $a0, resp
  syscall
  
  # This evaluates to s - a + b - c - 101
  li $v0, 1
  add $a0, $s0, $s1
  sub $a0, $a0, $s2
  subi $a0, $a0, 101
  syscall
  
  li $v0, 10
  syscall
