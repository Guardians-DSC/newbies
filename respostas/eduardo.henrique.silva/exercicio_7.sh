#!/bin/bash
# Autor: Eduardo Henrique Pontes Silva0
# Matrícula: 117210360
# Login_CCC: eduardo.henrique.silva
# Script: Exercício 7


# A questão não esta 100% correta, mas foi a unica forma de fazer funcionarss

model_name=$(cat /proc/cpuinfo | grep "model name"| head -n 1 | sed -e "s/.*:.//")
Ethernet=$(lspci | grep "Ethernet controller" | sed -e "s/.*:.//")
Mem_Total=$(cat /proc/meminfo | grep "MemTotal"| head -n 1 | sed -e "s/.*:.//"| awk '$1=$1')

dados=$model_name$Ethernet$Mem_Total
x=$(cat arquivo_base.txt)


if [[ -z "$(ls | grep "arquivo_base.txt")" ]] ; 
then
    echo -e "$model_name$Ethernet$Mem_Total" > arquivo_base.txt
    echo "ARQUIVO BASE CRIADO"
else
    if [[ $dados != $x ]];
    then
        echo "SISTEMA ALTERADO"
        echo -e "$model_name$Ethernet$Mem_Total" > arquivo_base.txt
    else
        echo "SEM ALTERACOES"
    fi
fi
