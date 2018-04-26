#!/bin/bash

read -s -p "Entre com a senha: " senha
echo

comp=$(expr length $senha)
regex1=[0-9]+
regex2=[A-Z]+

if [ $comp -lt 8 ]
	then
		echo "Senha insegura! Deve conter pelo menos 8 caracteres."
elif ! [[ $senha =~ $regex1 ]]
	then
		echo "Senha insegura! Deve conter letras e números."
elif ! [[ $senha =~ $regex2 ]]
	then
		echo "Senha insegura! Deve conter pelo menos uma letra maiúscula."
else
	echo "Senha segura! :)"
fi


