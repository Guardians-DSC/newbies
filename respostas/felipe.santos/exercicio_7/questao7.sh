#!/bin/bash

## FELIPE MOTA DOS SANTOS ##
# QUESTAO 7 #

## Pegando os dados
modelo_da_cpu="$(cat /proc/cpuinfo | grep 'model name' | cut -d':' -f 2 | uniq | sed 's/^ *//')"
placa_rede="$(lspci | grep 'Ethernet controller' | cut -d: -f 3 | uniq | sed 's/^ *//')"
mem_total="$(cat /proc/meminfo | grep 'MemTotal' | cut -d: -f 2 | uniq | sed 's/^ *//')"

dados="$modelo_da_cpu\n$placa_rede\n$mem_total"

if [ -e "base.txt" ]; then ## verificando se arquivo ja existe
    if [ "$(cat base.txt)" = "$(echo -e $dados)" ]; then ## verificando se conteudo eh igual
        echo 'SEM ALTERACOES'
    else
        echo 'SISTEMA ALTERADO'
        echo -e "$dados" > base.txt
    fi
else
    echo -e "$dados" > base.txt
    echo "ARQUIVO BASE CRIADO"
fi
