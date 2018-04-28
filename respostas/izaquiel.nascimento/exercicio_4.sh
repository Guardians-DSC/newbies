#!/bin/bash

read -s -p "senha: " senha
echo

if [[ ${#senha} -lt 8 ]]; then 
	echo "Senha insegura! Senha muito curta"

elif [[ !($senha =~ [0-9] && $senha =~ [a-z]) ]]; then
	echo "Senha insegura! Senha deve conter letras e números"

elif [[ !($senha =~ [A-Z]) ]]; then
	echo "Senha insegura! Senha deve possuir pelo menos uma letra maiúscula"

else 
	echo "senha segura!"	
fi
