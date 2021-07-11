#!/bin/bash

echo "Digite sua senha:"

read -s senha

if echo "${senha}" | grep '[0-9]' >/dev/null; then
	if [[ $senha =~ [A-Z] ]]; then
		if [[ $senha =~ [A-Z] ]]; then
			echo "Senha Forte ;D"
		else
			echo "Senha Fraca ;("		
		fi
	else
		echo "Senha Fraca ;("	
	fi	
else
	echo "Senha Fraca ;("
fi


