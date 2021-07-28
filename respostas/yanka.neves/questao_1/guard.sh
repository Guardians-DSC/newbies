#!/bin/bash
# Yanka Yohana Pereira das Neves - 116211079
# exercicio_1 

# ta errado isso aí, mas vou mandar mesmo assim 

# copiando o arquivo compactado
cp ../../../questoes/exercicio_1/jan_95.txt.gz ./


# descompactando o arquivo

gunzip jan_95.txt.gz


sed '/ - - /!d' jan_95.txt > arqvalidos.txt

remote=`grep -wc remote arqvalidos.txt`
local=`grep -wc local arqvalidos.txt`

# print 

echo "Locais: $local"
echo "Remotos: $remote"
