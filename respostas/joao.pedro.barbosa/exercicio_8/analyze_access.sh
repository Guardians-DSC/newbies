#!/bin/bash
#Exercicio 8
#Joao Pedro de Barros Barbosa, 117210327
#joao.pedro.barbosa

tar -xf log.tar.gz  

year=$1

echo -ne "Quantidade de arquivos impressos em $year: "
cat access.log | grep $year | grep -c "Send-Document"
echo -ne "Quantidade de bytes transimitidos em $year: "
cat access.log | grep $year | awk '{ SUM += $2 } END {print SUM " bytes"}'

rm *.log