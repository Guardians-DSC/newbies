#!/bin/bash
# José Ramon Fragoso da Silva - 116210412
# exercicio_2 -  Script exemplo de reposta para as questoes dos guardians.
###############################################################################################################

read N		# Le a quantidade de vezes que vai repetir
read S 		# Le o tempo
read P_USER	# Le o usuario

for i in `seq 1 $N`	# Repete N vezes
do
	sleep "$S"		# Delay  de S segundos para executar os proximos comandos
	ps -ef | grep "$P_USER" >> processos.txt # Lista todos os processos que contem a string P_USER e armazena em um arquivo processos.txt

done

# %CPU = Coluna 3 | %MEM = Coluna 4

cat processos.txt | awk '{print $3}' > cpu_processos.txt # Lista todos os processos de CPU em processos.txt e armazena em outro arquivo
cat processos.txt | awk '{print $4}' > mem_processos.txt # Lista todos os processos de MEM em processos.txt e armazena em outro arquivo

maiorcpu=0	# Variavel para ser armazenado o maior %CPU
menorcpu=`sed -n "1p" cpu_processos.txt `	# Variavel para ser armazenado o menor %CPU

while read linha	# Loop que ir ler cada linha do arquivo cpu_processos.txt 
do
	if [[ $linha -gt $maiorcpu ]]; then	# Parte responsavel por armazenar os maiores valores encontrados na variavel maiorcpu
	 	maiorcpu=$linha;
	 fi 

	 if [[ $linha -lt $menorcpu ]]; then	# Parte responsavel por armazenar os menores valores encontrados na variavel menorcpu
	 	menorcpu=$linha
	 fi

done < cpu_processos.txt

maiormem=0	# Repeticao de tudo o que foi feito com %CPU, mas agora utilizando o %MEM
menormem=`sed -n "1p" mem_processos.txt `

while read linha
do
	if [[ $linha -gt $maiormem ]]; then
	 	maiormem=$linha;
	 fi 

	if [[ $linha -lt $menormem ]]; then
		menormem=$linha
	fi

done < mem_processos.txt

echo "Menor valor de CPU total encontrado: " $menorcpu
echo "Maior valor de CPU total encontrado: "$maiorcpu
echo "Menor valor de MEM total encontrado: "$menormem
echo "Maior valor de MEM total encontrado: "$maiormem