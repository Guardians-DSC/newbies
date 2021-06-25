#!/bin/bash
# Baseado na resolução de Yovanni Cunha
cp ../jan_95.txt.gz ./ #copia o arquivo do diretório superior (../) para o diretório local (./)
gzip --decompress jan_95.txt.gz #descomprime o arquivo

# O comando cat é usado para unir, criar e exibir arquivos
#	cat no formato 
#		cat arquivo1.txt > arquivo2.txt 
#	serve pra copiar o conteúdo do primeiro para criar o segundo arquivo

# No caso abaixo, o cat serve pra criar um novo arquivo junto com o grep, que vai pegar todas
# as linhas que tenham "- -"
# grep é um comando que procura padrões num arquivo
cat jan_95.txt | grep "\- -" > valid-request.txt
#
local_req=0
remote_req=0

while read line; do
	if echo $line | egrep -q "\local"; then
		local_req=$((local_req+1))
		#echo "$local_req"
	else
		remote_req=$((remote_req+1))
		#echo "$remote_req"
	fi
done <valid-request.txt

echo "Requisições Locais: $local_req"
echo "Requisições Remotas: $remote_req"

