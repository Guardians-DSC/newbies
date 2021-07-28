#!/bin/bash

# Por Lucas Salustiano

# Primeiramente precisamos pedir a senha a ser verificada. O comando `read` serve para capturar
# entradas do teclado do usuário, a opção `-p` permite que seja exibida uma mensagem durante essa captura.

read -p "Entre com a senha: " SENHA

# A variável abaixo é somente para fins de organização do código, e indica o tamanho mínimo que a senha
# deverá ter.

TAM_MIN=8

# A estrutura de `if`s aninhados abaixo foi para possibilitar a captura dos possiveis motivos de não 
# aceitação de alguma senha, como descrito no enunciado. 
#
# Os `if`s seguem sua estrutura básica (ver help if) e o grande diferencial aqui são os testes (ver man test).
# O que ocorre é o seguinte: 
#   * Dentro do primeiro `if`, é testado se a quantidade de caractes da $SENHA é maior
#     ou igual ao $TAM_MIN, através da flag `-ge`.
#   * Em seguida, no segundo `if`, é verificado se o tamanho da string a ser testa é maior do que zero. Perceba
#     para isso o comando `grep` SÓ irá imprimir a senha caso a expressão regular passada como parâmetro seja 
#     satisfeita, isto é, se um dos caractes de $SENHA for um número de 0 à 9. 
#   * Seguindo para o terceiro `if`, é feita a mesma verificação do segundo `if`, exceto pelo fato de ao invés 
#     de ser verificado a existência de números de 0 à 9, é verificado a existência de letras maiúsculas.
#   Para mais informações sobre expressões regulares, ver: https://aurelio.net/regex/apostila-conhecendo-regex.pdf
#
# Caso a execução seja bem sucessida na verificação dos três `if`s, a senha é segura e o programa foi executado com 
# sucesso, caso contrário, alguma das condições não foi verificada e o programa finaliza com código 1. 

if [[ $(echo $SENHA | wc -m) -ge $TAM_MIN ]] 
then
	if [[ -n $(echo $SENHA | grep [0-9]) ]] 
	then
		if [[ -n $(echo $SENHA | grep [A-Z]) ]]
		then
			echo "Senha segura! :)"
			exit 0            
		else										        
			echo "Senha insegura! Sua senha nao tem letras maiusculas."
		fi
										
	else
		echo "Senha insegura! Sua senha nao tem nenhum numero."

	fi

else

	echo "Senha insegura! Sua senha tem menos de oito caracteres."
fi

exit 1
