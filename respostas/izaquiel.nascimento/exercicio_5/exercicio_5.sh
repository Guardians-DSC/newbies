#!/bin/bash
# Izaquiel Nascimento  
# Matrícula: 117111446 
# Email: izaquiel.nascimento@ccc.ufcg.edu.br
# Questão 5

# Filtra conexôes IPv4 e IPv6 (internet) e guarda em aquivo temporário
echo "$(lsof | grep  -E 'IPv[4-6]')" > temp.txt

# os comandos abaixo filtram conexões UDP ou TCP de temp.text, cortam a primeira coluna (processos), ordenam, 
# contam e retiram duplicatas e por fim ordenam de forma decrescente. 
UDP="$(cat temp.txt | grep  'UDP' | cut -d' ' -f1 | sort | uniq -c | sort -nr)"
UDPList=($UDP)

TCP="$(cat temp.txt | grep  'TCP' | cut -d' ' -f1 | sort | uniq -c | sort -nr)"
TCPList=($TCP)

# os comandos abaixo filtram as linhas de conexão TCP e contam a quantidade de vezes que o estado aparece
LISTEM="$(cat temp.txt | grep 'TCP' | grep -c 'LISTEN')"
ESTABLISHED="$(cat temp.txt | grep 'TCP' | grep -c 'ESTABLISHED')"
SYN_SENT="$(cat temp.txt | grep 'TCP' | grep -c 'SYN_SENT')"
CLOSE_WAIT="$(cat temp.txt | grep 'TCP' | grep -c 'CLOSE_WAIT')"

# exibe resultados
echo "====== TOP ====="
echo "TOP conexões UDP:"
echo "*" "${UDPList[1]}"
echo "TOP conexões TCP:"
echo "*" "${TCPList[1]}"
echo
echo "====== TCP ====="
echo "LISTEN: $LISTEN"
echo "ESTABLISHED: $ESTABLISHED"
echo "SYN_SENT: $SYN_SENT"
echo "CLOSE_WAIT: $CLOSE_WAIT"

# remove arquivo temporario
rm temp.txt 