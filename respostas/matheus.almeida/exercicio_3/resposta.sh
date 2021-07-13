#!/bin/bash
# Matheus da Cunha Melo Almeida - 115210030
# exercicio_3

float_regex=^[+-]?[0-9]+\.?[0-9]*$
integer_regex=^-?[0-9]+$

cp ../../../questoes/exercicio_3/ls.log ./

while read line; do

	call=${line% = *}
	result=( ${line##* = } )
	callresult=${result[0]}
	calltime=${result[-1]}
	calltime=${calltime:1:8}

	if [[ $calltime =~ $float_regex && $callresult =~ $integer_regex ]]; then
		calltime=$(echo $calltime*1000000 | bc)
		calltime=${calltime%.*}
		echo "$calltime;$call;$callresult" >> valuable_information.txt
	fi

done <ls.log

IFS=";"
sort valuable_information.txt -k1 -nr -t ";" > sorted_information.txt
arr=( $(head -n 1 sorted_information.txt) )
most_consuming_call=${arr[1]}


awk -F ";" '(NR > 1) && ($3 < 0 )' valuable_information.txt | sort -k2 -t ";" > error_calls.txt

n_errors=`wc -l < error_calls.txt`

last_call=""
last_call_errors=0
most_errors_call=""
n_errors_call=0

while read line; do
	call=( $line )
	call_name=${call[1]}

	if [ "$call_name" = "$last_call" ]; then
		let last_call_errors++
	else
		if [[ $last_call_errors > $n_errors_call ]]; then
			n_errors_call=$last_call_errors
			most_errors_call=$last_call
		fi
		last_call=$call_name
	fi
done <error_calls.txt

echo CHAMADA MAIS DEMORADA: $most_consuming_call
echo NUMERO DE ERROS: $n_errors
echo CHAMADA COM MAIS ERROS: $most_errors_call

rm ls.log
rm error_calls.txt
rm valuable_information.txt
rm sorted_information.txt
unset IFS