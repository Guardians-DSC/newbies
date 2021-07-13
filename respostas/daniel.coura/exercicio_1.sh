#!/bin/bash
# Autor: Daniel Rodrigues Coura
# Matrícula: 117111915 
# Script: Exercício 1
#
# OBS: O script deve estar na mesma pasta do arquivo jan_65.txt.gz
# ----------------------------------------------------------------

echo Extraindo...
gunzip jan_95.txt.gz

echo
echo Salvando novo arquivo...

# Filtrando
cat jan_95.txt | grep " - - " | while read linha
do
	echo $linha >> .test.txt
	
	# Calculando número de chamadas locais e remotas
	if [ `echo $linha | cut -d ' ' -f 1` == 'local' ]; then
		local=$[ $local + 1 ]
		echo $local > .local.txt
	else
		remota=$[ $remota + 1 ]
		echo $remota > .remota.txt
	fi
done

# Exibindo resultados
echo
echo Requisições locais : `cat .local.txt` 
echo Requisições remotas : `cat .remota.txt`

# Ajustes
cat .test.txt > jan_95.txt
rm -rf .test.txt .local.txt .remota.txt
