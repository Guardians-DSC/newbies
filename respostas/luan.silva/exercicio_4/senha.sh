#!/bin/bash

echo "Entre com a senha: " 
read senha

comp=$(expr length $senha)

if [ $comp -lt 8 ]
	then
		echo "Senha Inválida."
		echo "Por segurança não são aceitas senhas com menos de
		6 caracteres ou mais que 9."
		echo "Informe uma nova senha."
	else
		echo "Senha segura!"
fi


