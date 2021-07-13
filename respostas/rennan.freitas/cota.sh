#!/bin/bash
# Rennan Rocha de Freitas - 119110746
# exercicio_9

listar_diretorios() {
	if [ -e $1 ]; then
        	while read di; do
			tam=$( (du -hs "$di" | awk '{print $1}') 2> /dev/null )
			echo -e "\t$tam \t $di"
		done <<< $(cat $1)
	fi
}

remover_cache() {
	rm -f diretorios.txt
	rm -f LT_MB10.txt
	rm -f GT_MB10.txt
	rm -f GT_MB200.txt
	rm -f MB10_MB200.txt
}

if [ "$(id -u)" != "0" ]; then
	echo -e "O programa pode não listar todos os arquivos sem sudo.\n"
	sleep 1
fi

remover_cache

diret=$(readlink -f $1)
n_barras=$(echo $diret | tr -cd '/' | wc -c)
n_barras=$(($n_barras + 3))

$( (ls -Rla $diret | grep ^$diret/ | cut -f-$n_barras -d"/" | tr -d ":" | uniq > diretorios.txt) 2> /dev/null ) # Escreve em diretorios.txt os subdiretórios em 2 níveis do diretório requerido e suprime erros de permissão.

MB10=$((1024 * 1024 * 10))
MB200=$(($MB10 * 20))

while read line; do
	tamanho=$( (du -hsb "$line" | awk '{print $1}') 2> /dev/null )  #Tamanho do diretório line
	if [ $tamanho -lt $MB10 ]; then
		echo $line >> LT_MB10.txt
	else
		echo $line >> GT_MB10.txt
	fi

	if [ $tamanho -gt $MB200 ]; then
		echo $line >> GT_MB200.txt
	elif [ $tamanho -lt $MB200 -a $tamanho -gt $MB10 ]; then
		echo $line >> MB10_MB200.txt
	fi

done <<< $(cat diretorios.txt)

echo "========================================================="
echo "Relatório de utilização para o diretório $diret:"
echo -e "=========================================================\n"

echo -e "\nDiretórios que não excedem 10MB:\n"
listar_diretorios LT_MB10.txt

echo -e "\nDiretórios que excedem 10MB:\n"
listar_diretorios GT_MB10.txt

echo -e "\nDiretórios que excedem 200MB:\n"
listar_diretorios GT_MB200.txt

echo -e "\nDiretórios que excedem 10MB e não excedem 200MB:\n"
listar_diretorios MB10_MB200.txt

remover_cache
