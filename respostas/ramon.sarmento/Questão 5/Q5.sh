#!/bin/bash
# Ramon Sousa Sarmento,117210402

#verifica tcp atual
tcp=`lsof -i tcp | awk '!/COMMAND/{print $1}'`
maior=0
nome_processo="-"
for x in `echo "$tcp" | sort -u`;do
	tamanho=$(echo "$tcp" | grep -c $x)
	if [ $tamanho -gt $maior ];then
		maior=$tamanho
		nome_processo=$x
	elif [ $tamanho -eq $maior ];then
		nome_processo="$nome_processo ,$x"
	fi
done
echo "Processo(s) Com Mais TCP: $nome_processo"


#verifica udp atual
udp=`lsof -i udp | awk '!/COMMAND/{print $1}'`
maior=0
nome_processo="-"
for x in `echo "$udp"| sort -u`;do
	tamanho=$(echo "$udp" | grep -c $x)
	if [ $tamanho -gt $maior ];then
		maior=$tamanho
		nome_processo=$x
	elif [ $tamanho -eq $maior ];then
		nome_processo="$nome_processo ,$x"
	fi
done
echo "Processo(s) Com Mais UDP: $nome_processo"

