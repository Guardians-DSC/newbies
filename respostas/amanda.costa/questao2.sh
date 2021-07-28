#!/bin/bash

# Amanda Vivian Alves de Luna e Costa - 116210896
# Resposta do exercicio 2

echo "Entre com o valor de N:"
read n
echo "Entre com o tempo em segundos:"
read seg
echo "Entre com o nome de usuário:"
read p_user

maior_cpu=0
menor_cpu=10000
maior_memoria=0
menor_memoria=10000

for i in $(seq 1 $n); do
    
    echo "Programas: "
    ps aux # Lista todos os processos em execução
    echo "###################################################################"
    echo "###################################################################"

    # CPU -> L3 // MEM -> L4

    # percorro os valores de CPU do usuario dado e pego o maior e o menor valor
    for cpu in $(ps aux | grep $p_user | awk '{print $3}'); do
        if [[ $cpu > $maior_cpu ]]; then
            maior_cpu=$cpu
        elif [[ $cpu < $menor_cpu ]]; then
            menor_cpu=$cpu
        fi
    done

    #percorro os valores de memoria do usuario dado e pego o maior e o menor valor
    for memoria in $(ps aux | grep $p_user | awk '{print $4}'); do
        if [[ $memoria > $maior_memoria ]]; then
            maior_memoria=$memoria
        elif [[ $memoria < $menor_memoria ]]; then
            menor_memoria=$memoria
        fi
    done

    sleep $seg #Delay para executar o proximo comando

done

echo "Menor valor de CPU : $menor_cpu"
echo "Maior valor de CPU : $maior_cpu"
echo "Menor valor de memoria : $menor_memoria"
echo "Maior valor de memoria : $maior_memoria"

