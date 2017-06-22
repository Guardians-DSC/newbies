#!/bin/bash
cp ../../../questoes/exercicio_1/jan_95.txt.gz ./
gzip -d jan_95.txt.gz

cat jan_95.txt | uniq - - > valid_lines.txt

local_requests=0
remote_requests=0

while read line; do
	request_type=${line%% *}
	if [ "$request_type" == "local" ]; then
		let local_requests++
		
	else
		let remote_requests++
	fi
done <valid_lines.txt

echo "Requisicoes locais: $local_requests"
echo "Requisicoes remotas: $remote_requests"