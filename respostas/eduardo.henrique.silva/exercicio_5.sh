#!/bin/bash
# Autor: Eduardo Henrique Pontes Silva0
# Matrícula: 117210360
# Login_CCC: eduardo.henrique.silva
# Script: Exercício 4

# Inicialização do Script
echo  "====== TOP ====="

# Variaveis de teste
entrada=""
entrada_anterior=""
i=0
saida_maior=0

# Top Conexoes UDP
echo "TOP conexões UDP:"

top_udp=""

for line in $(lsof -iUDP | cut -d' ' -f1) ;
	do
	entrada=$line
	if [[ $entrada != $entrada_anterior ]]; then
		i=0
	fi
	i=$(($i+1))
	if [ $i -gt $saida_maior ]; then
		saida_maior=$i
		top_udp="$line"
	fi
	entrada_anterior=$line
	done
	
# saída do Top UDP
echo "* $top_udp"

# Redefinindo Variaveis de teste
entrada=""
entrada_anterior=""
i=0
saida_maior=0

# TOP conexões TCP
echo "TOP conexões TCP:"

top_tcp=""

for line in $(lsof -iTCP | cut -d' ' -f1) ;
	do
	entrada=$line
	if [[ $entrada != $entrada_anterior ]]; then
		i=0
	fi
	i=$(($i+1))
	if [ $i -gt $saida_maior ]; then
		saida_maior=$i
		top_tcp="$line"
	fi
	entrada_anterior=$line
	done
	
# saída do Top TCP
echo "* $top_tcp"

echo # echo para pular uma linha

# Bônus: Quantidade total de conexões TCP
echo "====== TCP ====="

echo # echo para pular uma linha

echo "LISTEN: " $(lsof -iTCP | grep LISTEN | wc -l)
echo "ESTABLISHED: " $(lsof -iTCP | grep ESTABLISHED | wc -l)
echo "SYN_SENT: " $(lsof -iTCP | grep SYN_SENT | wc -l)
echo "CLOSE_WAIT: " $(lsof -iTCP | grep SYN_SENT | wc -l)
