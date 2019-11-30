.data


input1: .asciiz "Enter integer one "
input2: .asciiz "Enter integer two "
output: .asciiz  " The addition result is: "
output1: .asciiz " \n The subtraction result is:  "
output2: .asciiz " \n The multiplication result is:  "
output3: .asciiz " \n The division result is:  "

.text

main:

#t0 integer 1
#t1 integer 2
#t3 output


# INTEGER ONE
li $v0, 4
la $a0, input1
syscall

li $v0, 5
syscall
move $t0, $v0

#INTEGER TWO
li $v0, 4
la $a0, input2
syscall

li $v0, 5
syscall
move $t1, $v0

#####

#output
li $v0, 4
la $a0, output
syscall

add $a0, $t1, $t0
li $v0, 1
syscall


#output1
li $v0, 4
la $a0, output1
syscall

sub $a0, $t1, $t0
li $v0, 1
syscall

#output2
li $v0, 4
la $a0, output2
syscall

mul $s0, $t0, $t1

li $v0, 1
add $a0, $zero, $s0
syscall

#output3
li $v0, 4
la $a0, output3
syscall

div $s0, $t0, $t1

li $v0, 1
add $a0, $zero, $s0
syscall


li $v0, 10
syscall
