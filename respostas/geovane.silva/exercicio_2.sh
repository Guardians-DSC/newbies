#!/bin/bash
# Geovane do Nascimento Silva - 116211149
# exercicio_2 - Script de reposta para as questoes dos guardians

#Leio os dados
read OBS TEMPO USUARIO

# Crio os arquivos para armazenar dados de CPU e Memoria
touch dadosCPU.txt
touch dadosMEM.txt

# Laço para fazer as observaçõe dos dados
for i in $(seq 1 $OBS)
do
    #armazenando os dados de CPU e Memoria
    ps -e -o user,pcpu --sort=-pcpu | grep $USUARIO >> dadosCPU.txt
    ps -e -o user,pmem --sort=-pmem | grep $USUARIO >> dadosMEM.txt

    sleep $TEMPO

done


# extraindo o nome do usuario e deixando apenas os dados referentes a CPU e Memoria
minCPU=$(sed -n "$ p" dadosCPU.txt | cut -d ' ' -f 2-)
maxCPU=$(sed -n "1p" dadosCPU.txt | cut -d ' ' -f 2-)
minMEM=$(sed -n "$ p" dadosMEM.txt | cut -d ' ' -f 2-)
maxMEM=$(sed -n "1p" dadosMEM.txt | cut -d ' ' -f 2-)

# Exibindo as saidas requisitadas
echo
echo "CPU minimo: $minCPU"
echo "CPU maximo: $maxCPU"
echo "MEMORIA minimo: $minMEM"
echo "MEMORIA maximo: $maxMEM"
