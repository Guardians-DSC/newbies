#!/bin/bash
# Yovany Marroquin da Cunha - 115210445
# exercicio_1

cp ../../../questoes/exercicio_1/jan_95.txt.gz ./
gzip --decompress jan_95.txt.gz


#a saída do cat será utilizada pelo grep
cat jan_95.txt | grep "\- -" > valid-request.txt


local_req=0
remote_req=0


while read line; do
    if echo $line | egrep -q "\local"; then
        local_req=$((local_req+1))
        
    else
        remote_req=$((remote_req+1))
            
    fi
done <valid-request.txt

echo "Requisições Locais: $local_req"
echo "Requisições Remotas: $remote_req"
