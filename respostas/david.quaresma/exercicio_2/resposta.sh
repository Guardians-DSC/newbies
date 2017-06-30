#!/bin/bash
# David Ferreira Quaresma - 116210041
# exercicio 2

# leio a entrada com os três números em sequencia.
read -p "Dados: " dados

# faço um split e armazeno na mesma variável. 
IFS=' ' read -ra dados <<< "$dados"

# separo os valores em variaveis distintas.
N=${dados[0]}
S=${dados[1]}
P_USER=${dados[2]}

# crio variáveis para guardar valores maximos e minimos de %CPU e de %MEM.
MAX_CPU=0
MIN_CPU=1000000000000
MAX_MEM=0
MIN_MEM=1000000000000

# faço um loop de tamanho N.
for i in $(seq 1 $N); do

    # percorro todos os valores de %CPU do usuario P_USER
    for cpu_value in $(ps aux | grep $P_USER | awk '{print $3}'); do
	# verificando quem é maior.
        if [[ $cpu_value > $MAX_CPU ]]; then
            MAX_CPU=$cpu_value
	# verificando quem é menor.
        elif [[ $cpu_value < $MIN_CPU ]]; then
            MIN_CPU=$cpu_value
        fi
    done

    # percorro todos os valores de %MEM do usuario P_USER
    for mem_value in $(ps aux | grep $P_USER | awk '{print $4}'); do
	# verificando quem é maior.
        if [[ $mem_value > $MAX_MEM ]]; then
            MAX_MEM=$mem_value
	# verificando quem é menor.
        elif [[ $mem_value < $MIN_MEM ]]; then
            MIN_MEM=$mem_value
        fi
    done

    # espero s segundos.
    sleep $S

done

# exibo os valores calculados
echo 'max cpu: ' $MAX_CPU
echo 'min cpu: ' $MIN_CPU
echo 'max mem: ' $MAX_MEM
echo 'min mem: ' $MIN_MEM






