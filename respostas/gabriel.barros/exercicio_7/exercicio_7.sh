#!/bin/bash
# Exercicio 5
# Gabriel Barros, 117111892

if [ -z $(find base 2> erro) ];then
	echo $(grep "model name" /proc/cpuinfo | uniq | cut -d: -f2) > base
	echo $(lspci | grep 'Ethernet controller' | cut -d: -f3) >> base
	echo $(grep 'MemTotal' /proc/meminfo | cut -d: -f2) >> base
	echo "ARQUIVO BASE CRIADO"

else

	echo $(grep "model name" /proc/cpuinfo | uniq | cut -d: -f2) > hardware_atual
	echo $(lspci | grep 'Ethernet controller' | cut -d: -f3) >> hardware_atual
	echo $(grep 'MemTotal' /proc/meminfo | cut -d: -f2) >> hardware_atual
	
	a=$(cat base)
	b=$(cat hardware_atual)
	rm hardware_atual

	if [[ $a = $b ]];then
		echo "SEM ALTERACOES"	
	else
		echo "SISTEMA ALTERADO"
	fi	
fi
rm erro
