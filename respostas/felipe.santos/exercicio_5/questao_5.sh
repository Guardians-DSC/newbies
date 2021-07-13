#!/bin/bash

## FELIPE MOTA DOS SANTOS ##
# QUESTAO 5 #

### Top conexoes UDP e TCP

echo "====== TOP ====="

lsof -i udp | awk '{print $1}'  > temp_file.txt; ## salvando registro dos arquivos gerados
												 ## por conexao udp em arquivo
quantidade_maxima=0;

for comando_udp in $(cat temp_file.txt | uniq); do ## percorrendo nome de conexoes diferentes

	if [ "$comando_udp" != "COMMAND" ]; then ## checando se nao eh um nome valido

		quantidade_agora=$(cat temp_file.txt | grep $comando_udp | wc -l) ## conta o numero de ocorrencias
																		  ## no arquivo
		if [ $quantidade_maxima -lt $quantidade_agora ]; then ## atualizando numero maximo
			quantidade_maxima=$quantidade_agora;
		fi

	fi

done


echo "TOP conexões UDP:"

for comando_udp in $(cat temp_file.txt | uniq); do ## exibe todos os commandos que geraram o numero maximo de arquivos

	if [ "$comando_udp" != "COMMAND" ]; then

		quantidade_agora=$(cat temp_file.txt | grep $comando_udp | wc -l)

		if [ $quantidade_maxima -eq $quantidade_agora ]; then
			echo "*"$comando_udp
		fi

	fi

done

## logica similar a do UDP
lsof -i tcp | awk '{print $1}'  > temp_file.txt;

quantidade_maxima=0;

for comando_tcp in $(cat temp_file.txt | uniq); do

	if [ "$comando_tcp" != "COMMAND" ]; then

		quantidade_agora=$(cat temp_file.txt | grep $comando_tcp | wc -l)

		if [ $quantidade_maxima -lt $quantidade_agora ]; then
			quantidade_maxima=$quantidade_agora;
		fi

	fi

done

echo "TOP conexões TCP:"

for comando_tcp in $(cat temp_file.txt | uniq); do

	if [ "$comando_tcp" != "COMMAND" ]; then

		quantidade_agora=$(cat temp_file.txt | grep $comando_tcp | wc -l)

		if [ $quantidade_maxima -eq $quantidade_agora ]; then
			echo "*"$comando_tcp
		fi

	fi

done

echo

rm temp_file.txt

echo "====== TCP ====="
echo

quantidade_listen=$(lsof -i tcp | grep "LISTEN" | wc -l)
echo "LISTEN: "$quantidade_listen

quantidade_established=$(lsof -i tcp | grep "ESTABLISHED" | wc -l)
echo "ESTABLISHED: "$quantidade_established

quantidade_syn_sent=$(lsof -i tcp | grep "SYN_SENT" | wc -l)
echo "SYN_SENT: "$quantidade_syn_sent

quantidade_close_wait=$(lsof -i tcp | grep "CLOSE_WAIT" | wc -l)
echo "CLOSE_WAIT: "$quantidade_close_wait
