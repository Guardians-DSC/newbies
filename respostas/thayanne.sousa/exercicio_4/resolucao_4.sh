#!/bin/sh

read -sp 'Entre com a senha: ' senha

if [[ ${#senha} -ge 8 && "$senha" == *[A-Z]* && "$senha" == *[a-z]* && "$senha" == *[0-9]* ]] ; then
    echo '\nSenha segura! :)'

    else
        echo '\nSenha insegura!'
        
        if [[ ${#senha} -lt 8 ]]; then
            echo '\n> Sua senha tem menos de 8 caracteres!'
        fi
        if [[ "$senha" != *[A-Z]* ]]; then
            echo '\n> Sua senha nao tem letras maiusculas!'
        fi
        if [[ "$senha" != *[a-z]* ]]; then
            echo '\n> Sua senha nao tem letras minusculas!'
        fi
        if [[ "$senha" != *[0-9]* ]]; then
            echo '\n> Sua senha nao tem numeros!'
        fi 
fi
