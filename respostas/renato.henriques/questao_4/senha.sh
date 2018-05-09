#!/bin/bash

read -s -p "Entre com a senha: " PASSWD
echo

if [ ${#PASSWD} -lt 8 ];
then
    echo "Senha insegura: senha deve possuir no mínimo 8 caracters"

elif [[ !( $PASSWD =~ [a-z0-9] ) ]];
then
    echo "Senha insegura: senha deve conter letras e números"

elif [[ ! ($PASSWD =~ [A-Z] ) ]];
then
    echo "Senha insegura: senha deve conter pelo menos uma Letra Maiúscula."

else
    echo "Senha segura! :D"
fi


