#!/bin/bash

## FELIPE MOTA DOS SANTOS ##
# QUESTAO 4 #

read -s -p "Entre com a senha: " senha

echo

tamanho_insuficiente=0;
nao_tem_letras=0;
nao_tem_numeros=0;
nao_tem_maiuscula=0;

## verificar cada caso, utilizar expressao regular

if [ ${#senha} -lt 8 ]; then
    tamanho_insuficiente=1;
fi

regexLetras=[a-zA-Z];
if [[ !($senha =~ $regexLetras) ]]; then
    nao_tem_letras=1;
fi

regexNumeros=[0-9];
if [[ !($senha =~ $regexNumeros) ]]; then
    nao_tem_numeros=1;
fi

regexMaiscu=[A-Z];
if [[ !($senha =~ $regexMaiscu) ]]; then
    nao_tem_maiuscula=1;
fi

if [ $(($tamanho_insuficiente + $nao_tem_letras + $nao_tem_numeros + $nao_tem_maiuscula)) -gt 0 ]; then
    echo 'Senha insegura!'
    if [ $tamanho_insuficiente -gt 0 ]; then
        echo 'Tamanho da senha dever ser no minimo 8 caracteres'
    fi
    if [ $(($nao_tem_letras + $nao_tem_numeros)) -gt 0 ]; then
        echo 'Senha deve contar letras e numeros'
    fi
    if [ $nao_tem_maiuscula -gt 0 ]; then
        echo 'Senha deve contar pelo menos um letra maiuscula'
    fi
else
    echo 'Senha segura! :)'
fi
