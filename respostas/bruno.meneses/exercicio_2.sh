#!/bin/sh
# Bruno Rodrigo Pinheiro de Meneses - 116211401
# exercicio_2 - Script de reposta para as questoes dos guardians

# Pegando os dados
echo "Digite a quantidade de observações: "
read quant_obs

echo "Digite o tempo em segundos: "
read tempo

echo "Digite o nome do usuario: "
read usuario

# Coletando as informacoes do usuario informado e salvando em um arquivo txt
for i in $(seq 1 $quant_obs)
do
	ps -u | grep $usuario >> dados.txt
	sleep $tempo
done

# Pegando só os numeros da coluna %CPU e %MEM e colocando em ordem crescente em arquivos separados
sed '/%CPU/d' dados.txt | awk '{print $3}' | sort >> dadosCPU.txt
sed '/%MEM/d' dados.txt | awk '{print $4}' | sort >> dadosMEM.txt

# Atribuindo os valores as variaveis
max_cpu=$(tail -1 dadosCPU.txt)
min_cpu=$(head -1 dadosCPU.txt)

max_mem=$(tail -1 dadosMEM.txt)
min_mem=$(head -1 dadosMEM.txt)

# Exibindo resultados
echo "--------------------------------------------"
echo "CPU maximo: $max_cpu | CPU minimo: $min_cpu"
echo
echo "Memoria maxima: $max_mem | Memoria minima: $min_mem"
echo "--------------------------------------------"

# Realizando limpeza dos arquivos
rm dadosCPU.txt
rm dadosMEM.txt
rm dados.txt
