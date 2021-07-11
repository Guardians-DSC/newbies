#!/bin/bash

# Resposta do exercicio 4

# Lê a entrada
read -p "Entre com a senha: " senha

# Verifica se a senha possui pelo menos 8 caracteres
if [ ${#senha} -lt 8 ];
then 
echo Senha insegura! Possui menos que 8 caracteres!

# Verifica se contem numeros
elif [[ !($senha =~ [0-9]) ]];
then
echo Senha insegura! Nao possui numero!

# Verifica se contem letras maisculas
elif [[ !($senha =~ [A-Z]) ]];
then
echo Senha insegura! Nao possui letras maisculas!

else
echo "Senha segura ! :)"

fi
