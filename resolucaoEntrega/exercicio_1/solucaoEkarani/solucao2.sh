#!/bin/bash

cp ../jan_95.txt.gz ./ # copia o arquivo do diretório superior (../) para o diretório local (./)
gzip --decompress jan_95.txt.gz #descomprime o arquivo

# O comando cat é usado para unir, criar e exibir arquivos
# 	cat no formato
#		cat arquivo1.txt > arquivo2.txt
#	serve pra copiar o conteúdo do primeiro arquivo para criar o segundo

# No caso abaixo, o cat serve para criar um novo arquivo junto ao grep
# O grep é um comando que procura padrões num arquivo
cat jan_95.txt | grep "\- -" > valid-requests.txt

# grep -o quer dizer "only matching", que mostra partes não vazias da linha que é igual ao padrão
# já wc -l conta o número de linhas em que o padrão aparece
local_req=`grep -o "local" valid-requests.txt | wc -l`
remote_req=`grep -o "remote" valid-requests.txt | wc -l`

echo "Requisições Locais: $local_req"
echo "Requisições Remotas: $remote_req"
