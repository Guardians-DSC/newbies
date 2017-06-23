#!/bin/bash

if [[ $# < 3 ]]; then
	echo "Quantidade de parâmetros inválida!"
	echo -e "Você deve informar $0 [N_VEZES] [SEGUNDOS] [P_USER]\n"
	kill $$
fi

N=$1
SEG=$2
P_USER=$3

echo -e "Rodando algoritmo $1 vezes para ocorrências de \"$3\".\nO tempo estimado é de $(($N*$SEG)) segundos.\n"

CPU_MAX_ABS=0
CPU_MIN_ABS=0
MEM_MAX_ABS=0
MEM_MIN_ABS=0

for (( i = 0; i < $N; i++ )); do
	DATA=`ps aux | grep -E "^$P_USER" | awk '{print $3 " " $4}' | sed '1,1d'`
	# echo "$DATA"
	CPU_MAX=`echo "$DATA" | awk -v CPU_MAX=0 '{if ($1>CPU_MAX) CPU_MAX=$1} END {print CPU_MAX}'`
	CPU_MIN=`echo "$DATA" | awk -v CPU_MIN=0 '{if ($1<CPU_MIN) CPU_MIN=$1} END {print CPU_MIN}'`

	MEM_MAX=`echo "$DATA" | awk -v MEM_MAX=0 '{if ($2>MEM_MAX) MEM_MAX=$2} END {print MEM_MAX}'`
	MEM_MIN=`echo "$DATA" | awk -v MEM_MIN=0 '{if ($2<MEM_MIN) MEM_MIN=$2} END {print MEM_MIN}'`

	if [[ $CPU_MAX_ABS < $CPU_MAX ]]; then
		CPU_MAX_ABS=$CPU_MAX
	fi
	if [[ $CPU_MIN_ABS > $CPU_MIN ]]; then
		CPU_MIN_ABS=$CPU_MIN
	fi
	if [[ $MEM_MAX_ABS < $MEM_MAX ]]; then
		MEM_MAX_ABS=$MEM_MAX
	fi
	if [[ $MEM_MIN_ABS > $MEM_MIN ]]; then
		MEM_MIN_ABS=$MEM_MIN
	fi

	sleep "$SEG"s
done

echo "Mínimo %CPU: $CPU_MIN_ABS" "Máximo %CPU: $CPU_MAX_ABS"
echo "Mínimo %CPU: $MEM_MIN_ABS" "Máximo %MEM: $MEM_MAX_ABS"