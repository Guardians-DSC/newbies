#!/bin/bash

loc=$(pwd)

echo
echo "========================================================="
echo "Relatório de utilização para o diretório $loc:"
echo "========================================================="

loc+="/*"

echo -e "\nDiretórios que não excedem 10MB:"
echo du -h -t -10M -d 2 $loc | sort -hr 

echo -e "\nDiretórios que excedem 10MB:"
du -h -t  10M -d 2 $loc | sort -hr

echo -e "\nDiretórios que excedem 200MB:"
du -h -t 200M -d 2 $loc | sort -hr

echo -e "\nDiretórios que excedem 10MB e não excedem 200MB:"
du -h -t -200M -d 2 $loc | sort -hr

#Usar sed para mudar de starting line para 2 espaços

echo 
