main:
	#inicializando o vetor da questão
	addi x2, x2, -40
    addi x10, x2, 0
    li x11, 10
	li x6, 19
    sw x6, 36(x2)
    li x6, 5
    sw x6, 32(x2)
    li x6, 7
    sw x6, 28(x2)
    li x6, 38
    sw x6, 24(x2)
    li x6, 48
    sw x6, 20(x2)
    li x6, 39
    sw x6, 16(x2)
    li x6, 49
    sw x6, 12(x2)
    li x6, 20
    sw x6, 8(x2)
    li x6, 16
    sw x6, 4(x2)
    li x6, 27
    sw x6, 0(x2)
    jal x1, insertionsort   #chamada da função de ordenação. x10 possui o endereço do primeiro elemento do vetor e x11 o tamanho do vetor.
    
insertionsort:
	li x7, 1 # inicializa contador, i=1
    loop1:
    	slli x28, x7, 2             # /* x28 é o auxiliar utilizado para salvarmos em x29 o
        add x29, x10, x28           # endereço da i-ésima posição do vetor */
        lw x30, 0(x29)  # carrega para x30 o valor em vetor[i], ou seja, o valor no endereço de x29   (x30 = key)
        addi x31, x7, -1    # j = i-1
        slli x5, x31, 2
        add x6, x10, x5     # x6 passa a guardar endereço da j-ésima posição do vetor
        lw x8, 0(x6)    # carrega para x8 o valor em vetor[j], ou seja, o valor no endereço de x6
        condicao1loop2:
        	bge x31, x0, condicao2loop2   # \*checa se j>=0.  Se sim, podemos checar a segunda condição do loop2.
            beq x0, x0, endloop2          # Caso contrário, não entramos no loop2. 
        	#logica de saida da função entrará aqui
        	condicao2loop2:
        		blt x30, x8, loop2      # /*Segunda condição do loop2, checa de key < vetor[j].
                beq x0, x0, endloop2    # Se sim, entramos oficialmente no loop2. Caso contrário, não entramos. */
            	loop2:
            		sw x8, 4(x6)                # /*Armazena o valor de vetor[j] no endereço de vetor[j+1] e
               		addi x31, x31, -1           # reduz o valor de j em 1. Em seguida, os valores dos endereços são
                    addi x6, x6, -4             # atualizados para que possa ser feita a próxima iteração. Dessa forma,
                    lw x8, 0(x6)                # x6 passa a guardar o endereço de j-1 e x8 passa a guardar o valor presente
                	beq x0, x0, condicao1loop2  # nesse novo endereço. Ao fim dessas operações, tentamos entrar no loop2 novamente.*\
        endloop2:
        sw x30 ,4(x6)               # \* Carrega-se para o endereço atual de x6 o valor de x30(key).
        addi x7, x7, 1              # Além disso, é incrementado um no contador do primeiro loop(i em x7).
        blt x7, x11, loop1          # Então repetimos todo o processo, retornando para o primeiro loop enquanto i < n.