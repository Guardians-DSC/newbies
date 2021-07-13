#!/bin/bash
# Autor: Daniel Rodrigues Coura
# Matrícula: 117111915 
# Script: Exercício 2
# ----------------------------------------------------------------

# Recebendo dados
read -p "Observações a serem feitas: " n
read -p "Intervalo de tempo em segundos: " s
read -p "Começo de nome de usuário: " p_user

# Arquivos auxiliares
echo 0 > .cpu_maior.txt
echo 100 > .cpu_menor.txt
echo 0 > .mem_maior.txt
echo 100 > .mem_menor.txt

for ((i=1; i <= $n; i++))
do
	ps aux | while read linha; do
		# Filtrando resultados
		if echo $linha | cut -d ' ' -f 1 | grep $p_user > /dev/null; then
			echo $linha
			cpu=`echo $linha | cut -d ' ' -f 3`
			mem=`echo $linha | cut -d ' ' -f 4`
			c_maior=`cat .cpu_maior.txt`
			c_menor=`cat .cpu_menor.txt`
			m_maior=`cat .mem_maior.txt`
			m_menor=`cat .mem_menor.txt`
			
			# Calculando maior e menor %cpu e %mem
			if [ `echo "$cpu > $c_maior" | bc` == 1 ]; then
				echo $cpu > .cpu_maior.txt
			fi
			if [ `echo "$cpu < $c_menor" | bc` == 1 ]; then
				echo $cpu > .cpu_menor.txt
			fi
			if [ `echo "$mem > $m_maior" | bc` == 1 ]; then
				echo $mem > .mem_maior.txt
			fi
			if [ `echo "$mem < $m_menor" | bc` == 1 ]; then
				echo $mem > .mem_menor.txt
			fi
			
		fi
	done

	# Tempo de espera
	if [ $i -lt $[$n] ]; then
		echo; echo; echo
		sleep $s
	fi
done

# Exibindo resultados
echo;echo
echo '---------- Resultados ----------'
echo Maior valor de CPU: %`cat .cpu_maior.txt`
echo Menor valor de CPU: %`cat .cpu_menor.txt`
echo Maior valor de MEM: %`cat .mem_maior.txt`
echo Menor valor de MEM: %`cat .mem_menor.txt`

# Removendo arquivos auxiliares
rm -rf .cpu_maior.txt .cpu_menor.txt .mem_maior.txt .mem_menor.txt




