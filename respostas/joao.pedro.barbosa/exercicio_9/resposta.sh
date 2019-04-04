#!/bin/bash

loc=$(pwd)

echo
echo "========================================================="
echo "Relatório de utilização para o diretório $loc:"
echo "========================================================="

loc+="/*"

echo -e "\nDiretórios que não excedem 10MB:"
du -h -t -10M -d 1 $loc | sort -hr | awk '{ print "\t"$0 }'

echo -e "\nDiretórios que excedem 10MB:"
du -h -t  10M -d 1 $loc | sort -hr | awk '{ print "\t"$0 }'

echo -e "\nDiretórios que excedem 200MB:" 
du -h -t 200M -d 1 $loc | sort -hr | awk '{ print "\t"$0 }'

echo -e "\nDiretórios que excedem 10MB e não excedem 200MB:"
du -h -t -200M -d 1 $loc | sort -hr | awk '{ print "\t"$0 }'

#Usar sed para mudar de starting line para 2 espaços

echo 
