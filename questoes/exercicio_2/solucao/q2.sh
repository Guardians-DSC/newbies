#!/bin/bash

read N TIME USER

touch dadosCPU.txt
touch dadosMEM.txt

for i in $(seq 1 $N)
do
	ps -e -o user,pcpu --sort=-pcpu | grep $USER >> dadosCPU.txt
	ps -e -o user,pmem --sort=-pmem | grep $USER >> dadosMEM.txt

	sleep $TIME
done

minCPU=$(sed -n "$ p" dadosCPU.txt | cut -d ' ' -f 2-)
maxCPU=$(sed -n "1p" dadosCPU.txt | cut -d ' ' -f 2-)
minMEM=$(sed -n "$ p" dadosMEM.txt | cut -d ' ' -f 2-)
maxMEM=$(sed -n "1p" dadosMEM.txt | cut -d ' ' -f 2-)

echo
echo "CPU minimo: $minCPU"
echo "CPU maximo: $maxCPU"
echo "MEMORIA minimo: $minMEM"
echo "MEMORIA maximo: $maxMEM"
