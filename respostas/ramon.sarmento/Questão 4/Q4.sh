#!/bin/bash
# Ramon Sousa Sarmento,117210402

read -s texto


if [ ${#texto} -lt 8 ]; then 
	echo "senha insegura menos de 8 caracteres"
elif [ $(echo $texto | egrep -c '[0-9]') -eq 0 ];then
	echo "senha insegura , não contem numeros"
elif [ $(echo $texto | egrep -c '[A-Z]') -eq 0 ];then
	echo "senha insegura , não contem letras maiusculas"
elif [ $(echo $texto | egrep -c '[a-z]') -eq 0 ];then
	echo "senha insegura , não contem letras minusculas"
else
	echo "senha segura"
fi
