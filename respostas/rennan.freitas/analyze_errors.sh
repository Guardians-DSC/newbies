#!/bin/bash
# Rennan Rocha de Freitas - 119110746
# exercicio_8 problema 2

tar -vzxf ../../questoes/exercicio_8/log.tar.gz > /dev/null #descompactar arquivos log

qtd_falhas=$(cat error.log | wc -l)
qtd_anos=$(cat error.log | cut -f1 -d' ' | cut -f1 -d':' | cut -f3 -d'/' | uniq | wc -l)

media_falhas=$(($qtd_falhas/$qtd_anos))

echo "Média de falhas por ano: $media_falhas"

rm access.log
rm error.log
