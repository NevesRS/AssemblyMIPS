.data
i: 			.word 0
lim:		.word 7
vetor: 		.word 9 8 3 5 14 60 25 13

.text
	.globl main

main:
	#zerando os registradores
	xor $t0, $t0, $t0 
	xor $t1, $t1, $t1
	xor $t2, $t2, $t2
	xor $t3, $t3, $t4
	xor $t5, $t5, $t5
	
	la $t0, i				#Iniciando variavel de indice
	lw $t0, 0($t0)			#Armazenando variável de índice no registrador
	
	la $t1, lim				#Iniciando variavel de limite de indice
	lw $t1, 0($t1) 			#Armazenando variavel de limite de indice no registrador
	
	la $t2, vetor 			#Iniciando variavel de vetor
	
	la $t3, 0($t2) 			#Iniciando primeiro valor do vetor
	lw $t3, 0($t3) 			#Armazenando o primeiro valor do vetor
	
varreVetor:
    	addi $t0, $t0, 1 	#Incrementando o indice
    	addi $t2, $t2, 4 	#Incrementando o endereço para varrer o vetor
    	lw $t3, 0($t2) 		#Carregando a palavra do endereço e armazenando em $t3
    	blt $t0, $t1, varreVetor #Comparando se o indice e menor que o limite de indice

	


	