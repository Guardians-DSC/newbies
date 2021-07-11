#!/bin/bash

cpu=$( cat /proc/cpuinfo | grep -m1 "model name" | cut -f 2 -d: | cut -c 2- )
net=$( lspci | grep -m1 'Ethernet controller' | cut -f 3 -d: | cut -c 2- ) 
mem=$( cat /proc/meminfo | grep -m1 'MemTotal' | cut -f 2 -d: | awk '{print $1, $2}')

if [[ -f base.txt ]]
then
	cpu_base=$( sed -n '1p' base.txt )
	net_base=$( sed -n '2p' base.txt )
	mem_base=$( sed -n '3p' base.txt )
	changed=false
	
	if [ "$cpu" != "$cpu_base" ] || [ "$net" != "$net_base" ] || [ "$mem" != "$mem_base" ]
	then
		changed=true
	fi
	
	if [[ "$changed" == true ]]
	then
		echo "SISTEMA ALTERADO"
	else
		echo "SEM ALTERACOES"
	fi
else
	echo -e "$cpu\n$net\n$mem" > base.txt
	echo "ARQUIVO BASE CRIADO"
fi

