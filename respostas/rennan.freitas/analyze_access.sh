#!/bin/bash
# Rennan Rocha de Freitas - 119110746
# exercicio_8 problema 1

if [ $# -lt 1 ];
then
	echo "Adicione o ano como argumento."
	exit
fi

tar -vzxf ../../questoes/exercicio_8/log.tar.gz > /dev/null #descompactar arquivos log

ano=$1

acessos_ano=$(cat access.log | grep /$ano)
qtd_impressos=$(cat access.log | grep /$ano | grep Send-Document | wc -l)

echo "Quantidade de arquivos impressos em $ano: $qtd_impressos"
echo -e "\nCalculando bytes transmitidos...\n"

bytes_transm=0
while read line; do
	bytes=$(echo $line | cut -f2 -d' ')
	bytes_transm=$(($bytes_transm + $bytes))	
done <<< "$acessos_ano"

echo "Quantidade de bytes transmitidos em $ano: $bytes_transm"

rm access.log
rm error.log
