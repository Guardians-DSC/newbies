#!/bin/bash
#Exercicio 8
#Joao Pedro de Barros Barbosa, 117210327
#joao.pedro.barbosa

tar -xf log.tar.gz  

numb_of_years=$(grep -E -o [[:digit:]]{4}: error.log | uniq | wc -l)
numb_of_error=$(cat error.log | wc -l)

echo -ne "Média de falhas por ano: "
echo $(( ($numb_of_error+1) / $numb_of_years ))

rm *.log