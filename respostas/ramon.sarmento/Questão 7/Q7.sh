#!/bin/bash
# Ramon Sousa Sarmento,117210402

touch config_atual.txt

#copia hardware
cat /proc/cpuinfo | awk -F":" '/model name/{print $2;exit 0}'  >> config_atual.txt
lspci | awk -F":" '/Ethernet controller/{print $3}'  >> config_atual.txt
cat /proc/meminfo | awk -F":" '/MemTotal/{print $2;exit 0}'  >> config_atual.txt

lsusb >>config_atual.txt


if [ -e config_base.txt ]; then
	if [ "$(cat config_atual.txt)" == "$(cat config_base.txt)" ]
	then echo "SEM ALTERACOES"
	else echo "SISTEMA ALTERADO"
		cat config_atual.txt > config_base.txt
	fi
	
	
else
	touch config_base.txt
	cat config_atual.txt > config_base.txt
	echo "ARQUIVO BASE CRIADO"
fi


rm ./config_atual.txt
