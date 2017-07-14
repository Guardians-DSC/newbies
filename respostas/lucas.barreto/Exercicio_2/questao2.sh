#!/bin/bash
# Lucas Matheus Ferreira Barreto - 116210932
# Exercicio_2 -  Script de reposta para seleção do guardians.

# Numero de observações a serem feitas.
read N
# Intervalo de tempo (em segundos).
read S 		
# Começo de nome de um usuário.
read P_USER


# Repetição do codigo N vezes.
for repeticao in `seq 1 $N`; do
	sleep "$S"	# Atraso de S segundos para executar os comandos.
	ps -ef | grep "$P_USER" >> processos.txt    # Lista todos os processos que contem a string P_USER e armazena em um arquivo processos.txt

done


# Lista todos os processos da CPU em "processos.txt", todos os processos são tirados da coluna 3 (print $3),e também armazena no arquivo processos_cpu.txt.
cat processos.txt | awk '{print $3}' > processos_cpu.txt 
# Lista todos os processos da MEM em "processos.txt", todos os processos são tirados da coluna 4 (print $4),e também armazena no arquivo memoria_cpu.txt.
cat processos.txt | awk '{print $4}' > memoria_cpu.txt 


# Variaveis que serão armazenados o maior valor da CPU(maiorcpu), e menor valor da CPU(menorcpu).
maiorcpu=0									
menorcpu=$(sed -n "1p" processos_cpu.txt)

# Loop que ir ler cada linha do arquivo cpu_processos.txt 
while read linha; do
    # Condição para armazenar os maiores valores de processamento na variavel maiorcpu.						
	if [[ $linha -gt $maiorcpu ]]; then		
	 	maiorcpu=$linha;
	 fi 

    
    # Condição para armazenar os menores valores de processamento na variavel menorcpu.
	 if [[ $linha -lt $menorcpu ]]; then
	 	menorcpu=$linha
	 fi

done < processos_cpu.txt

# Mesma logica apresentanda em processamento de CPU para as variaveis "maiorcpu" e "menorcpu". Agora aplicadas a MEM, maiormemoria e menormemoria.
maiormemoria=0									
menormemoria=$(sed -n "1p" memoria_cpu.txt)

while read linha
do
	if [[ $linha -gt $maiormemoria ]]; then
	 	maiormemoria=$linha;
	 fi 

	if [[ $linha -lt $menormemoria ]]; then
		menormemoria=$linha
	fi

done < memoria_cpu.txt

# Saidas esperadas pelo programa.
echo "Maior valor de %CPU total encontrado: "$maiorcpu
echo "Menor valor de %CPU total encontrado: " $menorcpu
echo "Maior valor de %MEM total encontrado: "$maiormemoria
echo "Menor valor de %MEM total encontrado: "$menormemoria

