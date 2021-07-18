#algoritmo que testa se um n é primo. Se for primo, x11 terá o valor 1. Caso contrário, terá o valor 0.
main: 
	beq x0, x0, testprime #chamando a função que verifica se é primo

tester:
	sub x10, x10, x7                 # /*  O bloco "tester" subtrai d de n até que n se torne menor que d.
    bge x10, x7, tester              #  Esse valor de d é incrementado a cada iteração até que n seja igual a d(nesse caso, o loop é quebrado e n é primo)
    beq x10, x0, exitnotprime        #  Se em alguma das iterações n se tornar 0, então n não é primo e a função acaba.
    lw x10, 0(x2)                    #  Se n se torna menor que d sem concluir nada, retomamos o valor inicial de n a partir do load e iteramos novamente */
    addi x7, x7, 1                   
    beq x10, x7, exit
    bge x0, x0, tester
        
testprime:
	addi x2, x2, -4 #aloca espaço para armazenar o valor inicial "n"
    sw x10, 0(x2) #armazena ele n na memória
	li x11, 1
	li x7, 2
    bge x11, x10, exitnotprime #checa se n é 0 ou 1. Se for, não é primo.
    blt x7, x10, tester #Caso contrário, chama a função auxiliar que testará se é primo
    beq x0, x0, exit

exitnotprime:
	addi x11, x11, -1       #caso não seja primo, o valor em x11 deve ser 0
    beq x0, x0, exit
    
exit:
	addi x2, x2, 4 #desaloca pelo sp o espaço usado 