#!/bin/bash
# Anderson Fellipe de Vasconcelos Vidal - 117110162 - anderson.vidal@ccc.ufcg.edu.br


echo "Digite o número de observações"
read N;			 # número de observações 
echo "Digite o intervalo entre as análises"
read S;			 # intervalo em segundos 
echo "Digite o nome do usuário a ser analisado"
read P_USER;		 # nome de usuário

# Limpa o arquivo processos.txt sem exclui-lo
echo -n > processos.txt

# Laço que realizar N interações para cada S*N segundos
for i in $(seq 1 1 $N);
do
	sleep $S
	ps aux >> processos.txt
done

#Retira Linhas de cabeçalhos
sed -i '/USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND/ d' processos.txt

#Inicialização
maxCPU=0.0
maxMEM=0.0
minCPU=100.0
minMEM=100.0

#algoritimo para varrer as colunas %CPU e %MEM para encontrar max e min de ambos
for cpu in $(grep $P_USER processos.txt | awk '{print $3}');
do
	if [[ $cpu > $maxCPU ]];
	then
		maxCPU=$cpu
	fi
	
	if [[ $cpu < $minCPU ]];
	then
		minCPU=$cpu
	fi
done

for mem in $(grep $P_USER processos.txt | awk '{print $4}');
do
	if [[ $mem > $maxMEM ]];
	then
		maxMEM=$mem
	fi
	
	if [[ $mem < $minMEM ]];
	then
		minMEM=$mem
	fi
done	

#Retorno do script
echo ""
echo "==================================================================="
echo "USUÁRIO: " $P_USER
echo "MAX CPU: " $maxCPU
echo "MIN CPU: " $minCPU
echo "MAX MEM: " $maxMEM
echo "MIN MEM: " $minMEM 
