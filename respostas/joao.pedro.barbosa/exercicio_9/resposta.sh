#!/bin/bash
#Exercicio 8
#Joao Pedro de Barros Barbosa, 117210327
#joao.pedro.barbosa

loc=$(pwd)

echo
echo "========================================================="
echo "Relatório de utilização para o diretório $loc:"
echo "========================================================="

loc+="/"

#du -h(human-readable)t(limits size) ...M(size limit) -d 2(Max depth) | sort -hr(Sorts humanly-readable data) | awk ...(prints 4 spaces before each command result)
echo -e "\nDiretórios que não excedem 10MB:"
du -ht -10M -d 2 $loc | sort -hr | awk '{ print "\t"$0 }'

echo -e "\nDiretórios que excedem 10MB:"
du -ht  10M -d 2 $loc | sort -hr | awk '{ print "\t"$0 }'

echo -e "\nDiretórios que excedem 200MB:" 
du -ht 200M -d 2 $loc | sort -hr | awk '{ print "\t"$0 }'

#awk being used to see check if directory exceeds 10M, if so it prints
echo -e "\nDiretórios que excedem 10MB e não excedem 200MB:"
du -ht -200M -d 2 $loc | sort -hr | awk '(substr($1,0,length($1) - 1)+0.0) >= 10.0 && substr($1,length($1),1) == "M" { print "\t"$0 }'

echo 
