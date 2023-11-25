.data
zero: 		.word 0
indiceMult: 	.word 0
i:             .word 0
lim:           .word 7
vetorA:        .word 2 3 4 5 6 7 8 9
vetorB:        .word 2 2 2 2 2 2 2 2
vetorResultado: .word 0 0 0 0 0 0 0 0
	# ESPERADOS: 4 6 8 10 12 14 16 18

.text
	.globl main
main:
	#Zerando os registradores
	xor $t0, $t0, $t0 
	xor $t1, $t1, $t1
	xor $t2, $t2, $t2
	xor $t3, $t3, $t4
	xor $t5, $t5, $t5
	
	la $t0, i		#Iniciando variavel de indice (Load adress)
	lw $t0, 0($t0)		#Armazenando variável de índice no registrador (Load word)
	
	la $t1, lim		#Iniciando variavel de limite de indice
	lw $t1, 0($t1) 		#Armazenando variavel de limite de indice no registrador
	
	la $t2, vetorA 		#Iniciando variavel de vetor1
	la $t3, 0($t2) 		#Iniciando primeiro valor do vetor1
	lw $t3, 0($t3) 		#Armazenando o primeiro valor do vetor1
	
	la $t5, vetorB		#Iniciando variavel de vetor2
	la $t6, 0($t5)		#Iniciando primeiro valor do vetor2
	lw $t6, 0($t6) 		#Armazenando o primeiro valor do vetor2
	
	la $t7, vetorResultado #Iniciando novo vetor para armazenar o resultado das somas
	la $t8, 0($t7)		#Iniciando primeiro valor do vetor2
	
	
	#PARA CADA NOVO VETOR EU PRECISO NO MAIN  DE:
		# UMA NOVA INICIALIZAÇÃO DE REGISTRADOR
		# UM NOVO REGISTRADOR PARA ARMAZENA O INICIO DA VARIAVEL
		# ARMAZENAR O NOVO PRIMEIRO VALOR
	
	bgtz $t6, multiplicacaoPos 	#Comparando se valor de $t6 > 0, se for realize multiplicacao de positivos (Sucessão de somas)
	bltz $t6, multiplicacaoNeg	#Comparando se valor de $t6 < 0, se for realize multiplicacao de positivos (Sucessão de subtracoes)
					#Importante notar que o valor que vai denotar o sinal da operação é o multiplicador, por isso a comparação por ele

varreVetor:
	bge $t0, $t1, end
    	addi $t0, $t0, 1 	#Incrementando o indice
    	
    	addi $t2, $t2, 4 	#Incrementando o endereço para varrer o vetor1
    	lw $t3, 0($t2) 		#Carregando a informacao do endereço e armazenando em $t3	(RESPONSAVEL VETOR1)
    	
    	addi $t5, $t5, 4 	#Incrementando o endereço para varrer o vetor2
    	lw $t6, 0($t5) 		#Carregando a informacao do endereço e armazenando em $t6 	(RESPONSAVEL VETOR2)
 
    	addi $t7, $t7, 4 	#Incrementando o endereço para varrer o vetorResultado
    	lw $t8, 0($t7) 		#Carregando a informacao do endereço e armazenando em $t8 	(RESPONSAVEL VetorResultado)
    	  
    	bgtz $t6, multiplicacaoPos 	#Comparando se valor de $t6 > 0, se for realize multiplicacao de positivos (Sucessão de somas)
	bltz $t6, multiplicacaoNeg	#Comparando se valor de $t6 < 0, se for realize multiplicacao de positivos (Sucessão de subtracoes)
					#Importante notar que o valor que vai denotar o sinal da operação é o multiplicador, por isso a comparação por ele
					
    	#PARA CADA NOVO VETOR EU PRECISO NO LOOP DE:
    		#UM NOVO INCREMENTADOR
    		#UM NOVO LW PARA CARREGAR A POSICAO DO VETOR
    	#blt $t0, $t1, somaVetor #Comparando se o indice e menor que o limite de indice
    	
    	#bgtz $t6, multiplicacaoPos 	#Comparando se valor de $t1 > 0, se for realize multiplicacao de positivos (Sucessão de somas)
	#bltz $t6, multiplicacaoNeg	#Comparando se valor de $t1 < 0, se for realize multiplicacao de positivos (Sucessão de subtracoes)
					#Importante notar que o valor que vai denotar o sinal da operação é o multiplicador, por isso a comparação por ele

multiplicacaoNeg: 
	subi $t4, $t4, 1		#Subtraindo o indice
	sub $t9, $t9, $t3 		#Subtraindo o multiplicando por ele mesmo
	bgt $t4, $t6, multiplicacaoNeg	#Comparando se o indice e maior que o valor 1 se for rechama o loop
	sw $t9, 0($t7)
	la $t4, indiceMult
	lw $t4, 0($t4)
	la $t9, zero
	lw $t9, 0($t9)
	j varreVetor

multiplicacaoPos:
	addi $t4, $t4, 1		#Somando o indice 
	add $t9, $t9, $t3		#Somando o multiplicando por ele mesmo
	blt $t4, $t6, multiplicacaoPos	#Comparando se o indice e menor que o valor 1 se for rechama o loop
	sw $t9, 0($t7)
	la $t4, indiceMult
	lw $t4, 0($t4)
	la $t9, zero
	lw $t9, 0($t9)
	j varreVetor				
	
end: 