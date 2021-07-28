#!/bin/bash

read -p "Entre com a senha: " -s senha
echo

if [ "${#senha}" -lt 8 ]; 
then
    echo "Senha insegura! menor que 8 :("
elif [[ !($senha =~ [a-z0-9]) ]];
then
    echo "Senha insegura! não possui números e letras"
elif [[ !($senha =~ [[:upper:]]) ]];
then
    echo "Senha insegura! não possui letra maiúscula :("
else
    echo "Senha segura! :)"
fi
