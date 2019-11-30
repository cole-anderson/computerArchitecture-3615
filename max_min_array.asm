#cole anderson
#cpsc 3615
#prog assignment 1

.text
main:

#printing the prompt prompt" Please enter the size of the list\n" (0)
la $a0, prompt_input_size #load address of "prompt_input_size of the list" to a1
li $v0, 4 #li: load integer, sset v1 as 4 for output string in syscall
syscall

#input size (1)
li $v0,5 #v0=5 for input integer function in syscall
syscall

#copy the size from $v0 to "size" (2)
la $t0, size #la:load address , loading the beginning address of list in $t0
sw $v0, 0($t0) # store the input integer to the beginning address of list
move $a1, $v0

#input elements of list
li $s1, 0
la $t0, list
li $t2, 0

##########################################################
#INPUT LOOP
##########################################################


  #printing the prompt of " Please enter the element\n"
  la $a0, prompt_input_element #load address of "prompt_input_element" to a0
  li $v0, 4 #li: load integer, set v0 as 4 for output string in syscall
  syscall

  input_loop:
  addi $s1, $s1, 1
  bgt $s1, $a1, end_input_loop

  #take the input input_element:
  li $v0,5 #v0=5 for input integer function in syscall
  syscall

  #move the input integer to the array
  #la $t0, lsist #la:load address , loading the beginning address of list in $t0
  #sw $v0, 0($t0) # store the input integer to the beginning address of list

  add $t3, $t0, $t2
  sw $v0, 0($t3)
  addi $t2, $t2, 4

  j input_loop

end_input_loop:

#the list are
la $a0, prompt_output_element
li $v0, 4
syscall

addi $s1, $zero, 0
la $t0, list
la $t1, size
lw $a1, 0($t1)
addi $t2, $0, 0

##########################################################
#OUTPUT LOOP
##########################################################
  output_element: #label for output-loop in multiple-element array

  addi $s1, $s1, 1
  bgt $s1, $a1, end_output_element

  add $t3, $t0, $t2

  lw $a0, 0($t3)
  li $v0,1 #li: load integer
  syscall

  addi $t2, $t2, 4

  la $a0, prompt_space
  li $v0, 4
  syscall

  j output_element

end_output_element:


la $a0, prompt_new
li $v0, 4
syscall

##MAX!
la $a0, prompt_max
li $v0, 4
syscall

la $a0, list
la $t0, size
lw $a1, 0($t0)
addi $a1, $a1, -1
sll $a1, $a1, 2
add $a1, $a0, $a1

##########################################################
#SORT
##########################################################
sort:
beq $a0, $a1, end_sort
jal max
lw $t0, 0($a1)
sw $t0, 0($v0)
sw $v1, 0($a1)
addi $a1, $a1, -4
j sort
##########################################################
#MAX
##########################################################
max:
addi $v0, $a0, 0
lw $v1, 0($v0)
addi $t0, $a0, 0
  loop:
  beq $t0, $a1, ret
  addi $t0, $t0, 4
  lw $t1, 0($t0)
  slt $t2, $t1, $v1
  bne $t2, $zero, loop
  addi $v0, $t0, 0
  addi $v1, $t1, 0
  j loop
ret: jr $ra

end_sort:

addi $s1, $zero, 0
la $t0, list
la $t1, size
lw $a1, 0($t1)
addi $t2, $0, 0
##

lw $a0, 0($t3)
li $v0, 1 #li: load integer
syscall


la $a0, prompt_new
li $v0, 4
syscall
###################################

##MIN!
la $a0, prompt_min
li $v0, 4
syscall

la $a0, list
la $t0, size
lw $a1, 0($t0)
addi $a1, $a1, -1
sll $a1, $a1, 2
add $a1, $a0, $a1

##########################################################
#SORT
##########################################################
sort2:
beq $a0, $a1, end_sort2
jal min
lw $t0, 0($a1)
sw $t0, 0($v0)
sw $v1, 0($a1)
addi $a1, $a1, -4
j sort2
##########################################################
#MAX
##########################################################
min:
addi $v0, $a0, 0
lw $v1, 0($v0)
addi $t0, $a0, 0
  loopm:
  beq $t0, $a1, ret2
  addi $t0, $t0, 4
  lw $t1, 0($t0)
  sgt $t2, $t1, $v1
  bne $t2, $zero, loopm
  addi $v0, $t0, 0
  addi $v1, $t1, 0
  j loopm
ret2: jr $ra

end_sort2:

addi $s1, $zero, 0
la $t0, list
la $t1, size
lw $a1, 0($t1)
addi $t2, $0, 0
##

lw $a0, 0($t3)
li $v0, 1 #li: load integer
syscall

##END
#exit function
li $v0, 10 #v0=10, exit function
syscall

.data
list:.space 100 #maximum size of list is 25, you can change this definition
size:.word 0
#dataflag1:.word 0x12345678
#charflaf1:.ascii "abc"
#dataflag4:.word 0x22227890

prompt_input_size: .asciiz "please input the size of the list: \n"
prompt_input_element: .asciiz "please input the numbers in the list\n"
prompt_max: .asciiz "The Max is\n"
prompt_min: .asciiz "The Min is\n"
prompt_space: .asciiz " "
prompt_new: .asciiz "\n"

prompt_output_element: .asciiz "the list are \n"

#dataflag2: .word 0x88881111
Input: .space 20 # allocate 20 bytes of storage for the input string
#dataflag3: .word 0x99996666
