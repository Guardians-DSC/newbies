#!/bin/bash
# Autor: Daniel Rodrigues Coura
# Matrícula: 117111915 
# Script: Exercício 3
# ----------------------------------------------------------------

m_temp=(0 0 0)
declare -A erro

# Filtrando chamadas
cat ls.log | grep '<' | grep '(' | while read linha
do
	prog=`echo $linha | cut -s -d '(' -f 1` 
	cod=`echo $linha | cut -s -d ')' -f 2 | cut -s -d ' ' -f 3`
	temp=`echo $linha | cut -s -d '<' -f 2 | cut -s -d '>' -f 1` 

	# 3 chamadas de maior duração
	if [ `echo "$temp > ${m_temp[0]}" | bc` == 1 ]; then
		m_temp[2]=${m_temp[1]}
		m_temp[1]=${m_temp[0]}
		m_temp[0]=$temp
		
		m_prog[2]=${m_prog[1]}
		m_prog[1]=${m_prog[0]}
		m_prog[0]=$prog
	elif [ `echo "$temp > ${m_temp[1]}" | bc` == 1 ]; then
		m_temp[2]=${m_temp[1]}
		m_temp[1]=$temp
		
		m_prog[2]=${m_prog[1]}
		m_prog[1]=$prog
	elif [ `echo "$temp > ${m_temp[0]}" | bc` == 1 ]; then
		m_temp[0]=$temp
		m_prof[0]=$prog
	fi

	# Array programas com erro
	if [[ $cod == -* ]] ; then 
		erro[$prog]=$[${erro[$prog]} + 1]
	fi
	
	# Pegando as chaves
	key=${!erro[@]}
	
	# Salvando: Chamadas de maior duração, chamadas com erro
	echo ${m_prog[@]} > .maior.txt
	echo -e "${erro[@]}\n${!erro[@]}\n${#erro[@]}" > .erro.txt
done

# Recolhendo dados para fazer comparações
num=`head -n1 .erro.txt | cut -d ' ' -f 1`
erro=`head -n2 .erro.txt | tail -n1 | cut -d ' ' -f 1`

# Encontrando chamada com mais erros
for ((i=2; i<=`tail -n1 .erro.txt`; i++)); do
	prog=`head -n1 .erro.txt | cut -d ' ' -f $i`
	if [ $prog -gt $num ]; then
		num=$prog
		erro=`head -n2 .erro.txt | tail -n1 | cut -d ' ' -f $i`
	fi
done

# Quantidade de chamadas com erro
chamadas=`tail -n1 .erro.txt`

echo --------------- RESULTADOS ----------------
echo As 3 chamadas de maior duração: `cat .maior.txt`
echo "A syscall com mais erros: $erro ($chamadas chamadas com erro)"

rm -rf .maior.txt .erro.txt


