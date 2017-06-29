#!/bin/sh
# David Ferreira Quaresma - 116210041
# Exercicio 1

# Copio o arquivo .txt.gz em /questoes para a pasta local, como Victor sugeriu.
cp ../../../questoes/exercicio_1/jan_95.txt.gz ./
# Descompacto o arquivo com o comando gunzip -k, onde o -k evita que o gunzip apague o .gz inicial.
gunzip -k jan_95.txt.gz

# Salvo as linhas com os padroes desejados em outro arquivo.
sed '/ - - /!d'  jan_95.txt > jan_valido.txt

remotecount=0
localcount=0
#leio o novo arquivo linha por linha.
while read line; do

    # verifico se a linha contem o padrao de interesse.
    if echo "$line" | egrep 'remote' >/dev/null; then
	# incremento 1 na variavel que contabiliza as repeticoes desse padrao. 
	remotecount=$((remotecount+1))
        
    elif echo "$line" | egrep 'local' >/dev/null; then 
	localcount=$((localcount+1))
    fi

done < jan_valido.txt

# exibo os resultados 
echo $remotecount 'requisições remotas realizadas'
echo $localcount 'requisições locais realizadas'





