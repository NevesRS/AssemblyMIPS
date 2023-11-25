.data
i:	.word 0
valor1: 	.word 9
valor2: 	.word 3
.text
	.globl main

main:
	#zerando os registradores
	xor $t0, $t0, $t0 
	xor $t1, $t1, $t1
	xor $t2, $t2, $t2
	xor $t3, $t3, $t4
	
	la $t0, valor1 			#Iniciando variavel de valor1
	lw $t0, 0($t0) 			#Armazenando variável de valor1 no registrador

	la $t1, valor2 			#Iniciando variavel de valor1
	lw $t1, 0($t1) 			#Armazenando variável de valor1 no registrador
	
	la $t3, i			#Iniciando variavel de indice
	lw $t3, 0($t3)			#Armazenando variável de indice no registrador
	
	bgtz $t1, multiplicacaoPos 	#Comparando se valor de $t1 > 0, se for realize multiplicacao de positivos (Sucessão de somas)
	bltz $t1, multiplicacaoNeg	#Comparando se valor de $t1 < 0, se for realize multiplicacao de positivos (Sucessão de subtracoes)
					#Importante notar que o valor que vai denotar o sinal da operação é o multiplicador, por isso a comparação por ele
multiplicacaoNeg: 
	subi $t3, $t3, 1		#Subtraindo o indice
	sub $t2, $t2, $t0 		#Subtraindo o multiplicando por ele mesmo
	bgt $t3, $t1, multiplicacaoNeg	#Comparando se o indice e maior que o valor 1 se for rechama o loop
	j end				#Pulando para o fim

multiplicacaoPos:
	addi $t3, $t3, 1		#Somando o indice 
	add $t2, $t2, $t0 		#Somando o multiplicando por ele mesmo
	blt $t3, $t1, multiplicacaoPos	#Comparando se o indice e menor que o valor 1 se for rechama o loop
	j end				

end: 
