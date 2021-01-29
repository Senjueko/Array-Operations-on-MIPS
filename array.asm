.data
array:		.word	1, 2, 3, 4, 5
array_size:	.word 	5
.text
main:
	la $a0, array
	lw $t0, array_size
	addi $s0, $0, 0 # s0 = i

for:	beq $t0, $s0, done # if i == array_size, go done
	lw $t1, 0($a0) # load current index to t1
	addi $t2, $t1, 0 # t2 = t1
	rem $t3, $t2, 2 # t3 is our remainder
	beq $t3, 0, even # if remainder is even, go even
	addi $t4, $t1, 0 # t4 = t1
	sll $t1, $t1, 1 # t1 = t1 * 2
	add $t1, $t1, $t4 # t1 = t1 + t4
	addi $t1, $t1, 1 # t1 = t1 + 1
	sw $t1, 0($a0) # save t1 into current index
	addi $s0, $s0, 1 # i = i + 1
	add, $a0, $a0, 4 # go to next index
	j for # go to for
even:	srl $t1, $t1, 1 # t1 = t1 * 2
	sw $t1, 0($a0) # save t1 into current index
	addi $s0, $s0, 1 # i = i + 1
	add, $a0, $a0, 4 # go to next index
	j for	# go to for

done:	li $v0, 10
	syscall
