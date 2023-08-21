# !/usr/bin/bash
# Júlio César da Silva Alcantara - 122110504

read -p "Numero de observações: " num_observacoes
read -p "Intervalo de tempo: " segundos
read -p "Nome de usuario: " usuario

# Laço que roda até o número de observações definido previamente, espera o tempo em segundos com o sleep para então quebrar o laço
for ((i=0; i < num_observacoes; i++))	
do	
	maior_cpu=$(ps aux | grep '^julio' | awk '{print $3}' | sort -n | tail -1)
	menor_cpu=$(ps aux | grep '^julio' | awk '{print $3}' | sort -n | head -1)
	maior_mem=$(ps aux | grep '^julio' | awk '{print $4}' | sort -n | tail -1)
	menor_mem=$(ps aux | grep '^julio' | awk '{print $4}' | sort -n | head -1)
	
	sleep "${segundos}"
done

echo "Maior uso de %CPU: ${maior_cpu}"
echo "Menor uso de %CPU: ${menor_cpu}"
echo "Maior uso de %MEM: ${maior_mem}"
echo "Menor uso de %MEM: ${menor_mem}"

# Quick Tips
# -p | prompt
# brace expansions
# ps aux | lista processos em execução
# -n | --numeric-sort
# tail(rabo - abaixo) --line(s)
# head(cabeça - acima) --line(s)
# awk | permite a manipulação de dados(textos) a partir de uma sequência de padrões
# "${segundos}" | output: 2
# '${segundos}' | output: ${segundos}
