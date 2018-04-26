#!/bin/bash

modeloCpu=$(cat /proc/cpuinfo | grep -o 'model name[^"]*' | cut -c14-)
placaDeRede=$(lspci | grep -o 'Ethernet controller[^"]*' | cut -c22-)
memoriaDisponivel=$(cat /proc/meminfo | grep -o 'MemTotal[^"]*' |cut -c18- )

especificacao="$modeloCpu\n$placaDeRede\n$memoriaDisponivel"

destdir="base.txt"


if [ -e "$destdir" ];
then 
    if [[ "$(<"$destdir")" = "$(echo -e "$especificacao")" ]];
    then
        echo "SEM ALTERACOES"
    else
        echo -e "$especificacao" > "$destdir"
        echo "SISTEMA ALTERADO"
    fi

else
    echo -e "$especificacao" > "$destdir"
    echo "ARQUIVO BASE CRIADO"
fi