#!/usr/bin/env bash
#
# Por Isaac Vicente em 28 Mar 2023
# Edit: 4 Mai 2023

# Checamos se o arquivo `jan_95.txt.gz` existe e `jan_95.tx` não existe, e então extraímos seu conteúdo
# (Obs.: é necessário ter esse arquivo)
if [[ -f jan_95.txt.gz && ! -f jan_95.txt ]]
then
    gunzip jan_95.txt.gz
elif [[ ! -f jan_95.txt ]]
then
    # Se `jan_95.txt` não existe, alertamos o usuário
    echo "Erro: arquivo 'jan_95.txt.gz' não existe no diretório corrente"
    exit 1
fi

# Pegamos o output apenas das linhas que têm o regex desejado
# no arquivo `jan_95.txt` esse conteúdo com o pipe
# para que `wc` conte o número de linhas (`-l`),
# ou seja, o número de ocorrências.
requis_locais=$(grep -E '^local - -' jan_95.txt | wc -l)
requis_remotas=$(grep -E '^remote - -' jan_95.txt | wc -l)

# Printamos as respectivas quantidades locais e remotas.
echo "Quantidade de requisições locais: ${requis_locais}"
echo "Quantidade de requisições remotas: ${requis_remotas}"
