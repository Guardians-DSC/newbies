#!/bin/bash
# Damiao Robson Domiciano - 116210003
# exercicio_1

cp ../../../questoes/exercicio_1/jan_95.txt.gz ./
gzip -d jan_95.txt.gz

grep " - - " jan_95.txt | grep " 200 " | uniq - - > Requisicoes_Validas.txt

echo -n "Requisicoes locais: "
grep -c ^"local" Requisicoes_Validas.txt

echo -n "Requisicoes remotas: "
grep -c ^"remote" Requisicoes_Validas.txt
