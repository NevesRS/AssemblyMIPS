.text
	.globl	main		# onde o c�digo inicia.

main: xor	$t0,$t0,$t0
      xor	$t5,$t5,$t5
      
	la 	$t1,g		# $t1 recebe o endere�o de g
	lw	$t1, 0($t1)	# $t1 recebe o valor de g
	
	la 	$t2,h		# $t1 recebe o endere�o de h
	lw	$t2, 0($t2)	# $t1 recebe o valor de h
	
	add $t0, $t1, $t2 	# $t0 armazena a soma g + h
	add $t5, $t0, -5 	# $t5 armazena a subtração de 10 - 5 ($t0-constante)

end:	j	end

.data
	g:	.word	3
	h:	.word	1