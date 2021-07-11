#!/bin/bash

lsof > processos.txt

grep "UDP" processos.txt > UDP.txt
head -1 UDP.txt > linhaUDP.txt

grep "TCP" processos.txt > TCP.txt
head -1 TCP.txt > linhaTCP.txt

echo "====== TOP ====="
echo "TOP conexões UDP:"
cut -c 1-11 ./linhaUDP.txt

echo "TOP conexões TCP:" 
cut -c 1-11 ./linhaTCP.txt




