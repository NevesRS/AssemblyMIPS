.data
i: 		.word 0
lim:		.word 7
vetor1: 		.word 9 8 3 5 14 60 25 13
vetor2: 		.word 5 4 3 2 1 10 12 11
vetorResultado: 	.word 0 0 0 0 0 0 0 0
		#ESPERADOS:  14 12 6 7 15 70 37 24

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
	
	la $t2, vetor1 		#Iniciando variavel de vetor1
	la $t3, 0($t2) 		#Iniciando primeiro valor do vetor1
	lw $t3, 0($t3) 		#Armazenando o primeiro valor do vetor1
	
	la $t5, vetor2		#Iniciando variavel de vetor2
	la $t6, 0($t5)		#Iniciando primeiro valor do vetor2
	lw $t6, 0($t6) 		#Armazenando o primeiro valor do vetor2
	
	la $t7, vetorResultado #Iniciando novo vetor para armazenar o resultado das somas
	la $t8, 0($t7)		#Iniciando primeiro valor do vetor2
	
	
	#PARA CADA NOVO VETOR EU PRECISO NO MAIN  DE:
		# UMA NOVA INICIALIZAÇÃO DE REGISTRADOR
		# UM NOVO REGISTRADOR PARA ARMAZENA O INICIO DA VARIAVEL
		# ARMAZENAR O NOVO PRIMEIRO VALOR
	j somaVetor #Jump pro somaVetor
	
varreVetor:
    	addi $t0, $t0, 1 	#Incrementando o indice
    	
    	addi $t2, $t2, 4 	#Incrementando o endereço para varrer o vetor1
    	lw $t3, 0($t2) 		#Carregando a informacao do endereço e armazenando em $t3	(RESPONSAVEL VETOR1)
    	
    	addi $t5, $t5, 4 	#Incrementando o endereço para varrer o vetor2
    	lw $t6, 0($t5) 		#Carregando a informacao do endereço e armazenando em $t6 	(RESPONSAVEL VETOR2)
    	
    	#PARA CADA NOVO VETOR EU PRECISO NO LOOP DE:
    		#UM NOVO INCREMENTADOR
    		#UM NOVO LW PARA CARREGAR A POSICAO DO VETOR
    	blt $t0, $t1, somaVetor #Comparando se o indice e menor que o limite de indice

somaVetor:
    add $t8, $t3, $t6       # Somando t3 (vetor1) e t6 (vetor2) e armazenando em $t8
    sw $t8, 0($t7)          # Armazenando o valor de $t8 no endereço apontado por $t7

    addi $t7, $t7, 4        # Incrementando o endereço para o próximo elemento do vetorResultado

    blt $t0, $t1, varreVetor   # Comparando se o índice é menor que o limite de índice
  
