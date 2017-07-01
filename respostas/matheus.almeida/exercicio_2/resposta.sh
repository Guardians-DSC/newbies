#!/bin/bash
# Matheus da Cunha Melo Almeida - 115210030
# exercicio_2

max_cpu=0
min_cpu=100
max_mem=0
min_mem=100

function process {

	while read line; do
		process_line $line
	done <result.txt
}


function process_line {
	cpu=$3
	mem=$4

	if [ 1 -eq "$(echo "${cpu} > ${max_cpu}" | bc)" ]
	then
		max_cpu=${cpu}
	elif [ 1 -eq "$(echo "${cpu} < ${min_cpu}" | bc)" ]
	then
		min_cpu=${cpu}
	fi
	
	if [ 1 -eq "$(echo "${mem} > ${max_mem}" | bc)" ]
	then
		max_mem=${mem}
	elif [ 1 -eq "$(echo "${mem} < ${min_mem}" | bc)" ]
	then
		min_mem=${mem}
	fi
}


read input
array=( $input )
n_operations=${array[0]}
interval=${array[1]}
p_user=${array[2]}

for i in `seq 1 $n_operations`; do
	ps aux | grep matheus > result.txt
	process
	sleep $interval
done

rm result.txt

echo MAX CPU: $max_cpu %
echo MIN CPU: $min_cpu %
echo MAX MEM: $max_mem %
echo MIN MEM: $min_mem %