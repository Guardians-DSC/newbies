#!/usr/bin/env bash

# Pegamos o output apenas das linhas que têm o regex desejado
# no arquivo `jan_95.txt` esse conteúdo com o pipe
# para que `wc` conte o número de linhas (`-l`),
# ou seja, o número de ocorrências.
requis_locais=$(grep -E '^local - -' jan_95.txt | wc -l)
requis_remotas=$(grep -E '^remote - -' jan_95.txt | wc -l)

# Printamos as respectivas quantidades locais e remotas.
echo "Quantidade de requisições locais: ${requis_locais}"
echo "Quantidade de requisições remotas: ${requis_remotas}"
