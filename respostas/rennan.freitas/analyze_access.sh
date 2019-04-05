#!/bin/bash

if [ $# -lt 1 ];
then
	echo "Adicione o ano como argumento."
	exit
fi

ano=$1

tar -vzxf ../../questoes/exercicio_8/log.tar.gz > /dev/null #descompactar arquivos log

ano_impressos=0
ano_bytes=0

while read line; do
	data=$(echo $line | cut -f1 -d' ')
	data_ano=$(echo $data | cut -f1 -d':' | cut -f3 -d'/' )

	if [ $data_ano -eq $ano ];
	then
		bytes=$(echo $line | cut -f2 -d' ')
		ano_bytes=$(($ano_bytes + $bytes))
		
		comando=$(echo $line | cut -f3 -d' ')	
		if [ $comando = "Send-Document" ];
		then
			ano_impressos=$(($ano_impressos + 1))
		fi
	fi	
done < access.log

echo "Quantidade de arquivos impressos em $ano: $ano_impressos"
echo "Quantidade de bytes transmitidos em $ano: $ano_bytes"

rm access.log
rm error.log
