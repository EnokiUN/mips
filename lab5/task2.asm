# Title: File Number Reader
# Author: Mahmoud Elmorsy
# Date: 2/15/2026
# Description: Asks a user to give a filename and reverses the integers read from that
# Input: A filename
# Output: The integers in that filename reversed

################### Data segment #####################
.data
  prompt: .asciiz "Enter a file name: "
  resp: .asciiz "Integers reversed "
  err_resp: .asciiz "Invalid file name"
  filename: .space 50
  filecontent: .byte 0:100
  arr1: .word 0:20

################### Code segment #####################
.text
.global main

main:
  li $v0, 4
  la $a0, prompt
  syscall
  
  li $v0, 8
  la $a0, filename
  li $a1, 50
  syscall
  
  li $s0, 0
  la $s1, filename
  
  filename_loop:
    addi $s0, $s0, 1
    lb $t1, ($s1)
    
    bne $t1, '\n', cont_filename
    
    li $t1, 0
    sb $t1, ($s1)
    j break_filename
    
    cont_filename:
    addi $s1, $s1, 1
    bne $s0, 50, filename_loop

  break_filename:
  
  li $v0, 13
  la $a0, filename
  la $a1, 0
  syscall
  
  bltz, $v0, err
  
  move $s4, $v0
  
  li $v0, 14
  move $a0, $s4
  la $a1, filecontent
  la $a2, 100
  syscall
  
  li $s0, 0
  la $s1, filecontent
  la $s2, arr1
  
  read_loop:
    addi $s0, $s0, 1
    
    lb $t0, ($s1)
    
    bgt $t0, '9', cont
    blt, $t0, '0', cont
    
    subi $t0, $t0, 0x30
    
    sb $t0, ($s2)
    addi $s2, $s2, 1
    
    cont:
    addi $s1, $s1, 1
    bne $s0, 100, read_loop
  
  li $v0, 4
  la $a0, resp
  syscall

  la $s1, arr1

  loop:
    subi $s2, $s2, 1
    li $v0, 1
    lb $a0, ($s2)
    syscall
    
    li $v0, 11
    li $a0, ' '
    syscall
    bgt $s2, $s1, loop
    
  exit:
    li $v0, 16
    move $a0, $s4
    syscall
    li $v0, 10
    syscall
    
err:
  li $v0, 4
  la $a0, err_resp
  syscall
  j exit
