#!/bin/bash

#Entrada de dados:
echo "Numero de observações: " 
read N

echo "Intervalo de tempo em segundos: "
read S 

echo "Usuario: "
read P_USER 

#Sequência de ps
for i in $(seq -w 1 $N);
do
  sleep $S | ps -U $P_USER -u $P_USER u >> processos.txt 

done


#Tratamento da informação
echo "USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND" > mem_maior.txt
echo "USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND" > mem_menor.txt
echo "USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND" > cpu_maior.txt
echo "USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND" > cpu_menor.txt
sort -nk 3 processos.txt | tail -n 1 >> cpu_maior.txt | sort -nk 4 processos.txt | tail -n 1 >> mem_maior.txt 
sort -nk 3 processos.txt | head -n 1 >> cpu_menor.txt | sort -nk 4 processos.txt | head -n 1 >> mem_menor.txt 


#Exibição de resultados

echo "
-------- Filtragem de dados: --------
" 

echo "Processo com maior gasto de CPU: " 
cat cpu_maior.txt
echo " "

echo "Processo com menor gasto de CPU: "
cat cpu_menor.txt
echo " "

echo "Processo com maior gasto de MEMORIA: "
cat mem_maior.txt
echo " "

echo "Processo com menor gasto de MEMORIA: "
cat mem_menor.txt
echo " "

rm *.txt