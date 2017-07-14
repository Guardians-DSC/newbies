#!/bin/bash
# Exercicio_2
# Áxel Medeiros, 117111889
# OBS: esse script deve está na pasta do arquivo ou ser adicionado no $PATH

# Ler as dados fornecidos pelo usuário
read -p "Número de observações: " num_obs
read -p "Intervalo de tempo: " tempo
read -p "Nome de um usuário: " user

for i in seq $num_obs:
do
	sleep $tempo
	ps aux | grep "$user" 2>/dev/null >> resultado.txt
done


while read linha
do 
	echo $linha | cut -d" " -f3 >> cpu_informacoes.txt 
	echo $linha | cut -d" " -f4 >> mem_informacoes.txt 
done < resultado.txt 


cpu_maior=0
cpu_menor=100
mem_maior=0
mem_menor=100

while read linha 
do
	linha=`echo $linha | cut -d"." -f1`
	if [[ $linha -gt $cpu_maior ]]; then
		cpu_maior=$linha
	fi
	if [[ $linha -lt $cpu_menor ]]; then
		cpu_menor=$linha
	fi
done < cpu_informacoes.txt 

while read linha 
do
	linha=`echo $linha | cut -d"." -f1`
	if [[ $linha -gt $mem_maior ]]; then
		mem_maior=$linha
	fi
	if [[ $linha -lt $mem_menor ]]; then
		mem_menor=$linha
	fi
done < mem_informacoes.txt 


echo "CPU, MAIOR = $cpu_maior MENOR = $cpu_menor"
echo "MEM, MAIOR = $mem_maior MENOR = $mem_menor"

# Apagando arquivos auxiliares
sleep 1
rm cpu_informacoes.txt
rm mem_informacoes.txt
rm resultado.txt
