#!/bin/bash

read -p "Entre com a senha: " SENHA

TAM_MIN=8

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