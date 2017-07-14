#!/bin/bash
# Exercicio 1
# Áxel Medeiros, 117111889
# OBS: esse script deve está na pasta do arquivo ou ser adicionado no $PATH

#1
gunzip jan_95.txt.gz 2>/dev/null

#3
cat jan_95.txt | grep -E "\- \-" > saida.txt

#4

cont_remote=0
cont_local=0

while read linha
do	
	linha=`echo $linha | cut -c -6`
	if [[ $linha == "remote" ]]; then
		cont_remote=`expr $cont_remote + 1`
	else
		cont_local=`expr $cont_local + 1`
	fi
done < saida.txt


echo "Numero de requisiçoes locais : $cont_local"
echo "Numero de requisições remotas: $cont_remote"

# Removendo arquivos auxiliares
sleep 1
rm saida.txt
