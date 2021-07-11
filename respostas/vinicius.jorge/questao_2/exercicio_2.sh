#!/bin/bash
#Vinicius Jorge Pereira - 116210568
#Exercicio 2

#Pegando os dados
echo "Digite a qtd de repetições: "
read repeticoes
echo "Digite o tempo: "
read tempo
echo "Digite o nome do usuario: "
read usuario
a
#Inicializando as variavéis
cpuMax=0
memMax=0

#Começando com valores altos para simplificar o processo
cpuMin=9999999
memMin=9999999

#Delay 
sleep $tempo

#For para preencher o arquivo com os dados do usuario
for ((i=0; i<$repeticoes; i++)) 
do
	#ps para listar os processos em execução mostrando daquele usuario
	ps -u $usuario >> dados.txt
done

#Pego os dados da cpu para utilizar no for
DadosCPU=$(cat dados.txt | awk '{print $3}')

for cpu in $DadosCPU
do
	#Compara se o valor da Ćpu é maior ou igual ao do máximo
	if [ $cpu -ge $cpuMax ]
	then
		cpuMax=$cpu
	else
		cpuMin=$cpu
	fi
done

#Pego os dados da memmória para utilizar no for
DadosMEM=$(cat dados.txt | awk '{print $4}')

for mem in $DadosMEM
do
	#Compara se o valor de Mem é maior ou igual ao do máximo
	if [ $mem -ge $memMax ]
	then
		memMax=$mem
	else
		memMin=$mem
	fi
done

#Imprime os resultados obtidos
echo
echo "CPU Max: $cpuMax"
echo "CPU Min: $cpuMin"
echo "MEM Max: $memMax"
echo "MEM Min: $memMin"
