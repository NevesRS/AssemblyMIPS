.text
	.globl	main		# onde o c�digo inicia.
	
main:
	xor	$t0, $t0, $t0 # i
	xor	$t1, $t1, $t1 #n
	xor 	$t2, $t2, $t2 #maior
	
	la 	$t1,n		# $t1 recebe o endereco de n
	lw	$t1, 0($t1)	# $t1 recebe o valor de n
	
	la 	$t2,maior	# $t1 recebe o endereco de n
	lw	$t2, 0($t2)	# $t1 recebe o valor de n
	
	
loop:
	addi $t0, $t0, 1
	ble $t0,$t1, loop

fim: j fim
	
.data
maior: 	.word 0
n:	.word 7
vetor: 	.word 9 	8 	3 	5 	14 	60 	25 	13
