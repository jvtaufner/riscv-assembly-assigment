# /*Na função ohm, são tratadas todas as possibilidades, calculando a variável faltante 
# ou retornando zero caso não tenhamos o valor de duas variáveis */

ohm:
		add x5, x11, x12 # soma R e I para facilitar a verificação dos dois serem zero

		beq x10, x0, ifnoV # Para V = 0 ou R e I iguais a 0,
    	beq x5, x0, ifnoV # o tratamento de retornar R*I é correto.

    	beq x11, x0, ifnoR	#Para o caso de V != 0 e R=0
    	beq x12, x0, ifnoI #Para o caso de V !=0 e I=0

	
ifnoV:
	mul x10, x11, x12
    	beq x0, x0, exit

ifnoR:
	div x10, x10, x12
    	beq x0, x0, exit
    
ifnoI:
	div x10, x10, x11
    	beq x0, x0, exit
    
exit: