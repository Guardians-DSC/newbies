#!/bin/bash
# Autor: Eduardo Henrique Pontes Silva0
# Matrícula: 117210360
# Login_CCC: eduardo.henrique.silva
# Script: Exercício 4

# Inicialização do script: inserir senha a ser verificada
read -s -p "Entre com a senha: " senha

echo # echo para pular uma linha

# variáveis de teste
testeNumero="[0-9]"
testeLetras="[a-z]"
testeMaiuscula="[A-Z]"

# testes a serem executados e impressão do resultado
if [ ${#senha} -ge 8 ]; then
	if  [[  $senha =~ $testeNumero ]]; then
        	if [[  $senha =~ $testeLetras ]]; then
            		if [[  $senha =~ $testeMaiuscula ]]; then
               			echo "Senha Segura! :)" 
            	else 
           		echo "Senha insegura! <Deve possuir pelo menos uma letra Maiúscula>"
            	fi
        else 
        echo "Senha insegura! <Deve possuir letras e números!>"
        fi
    else 
        echo "Senha insegura! <Deve possuir letras e números!>"
    fi
else
	echo "Senha insegura! <Deve possuir pelo menos 8 caracteres>"
fi



