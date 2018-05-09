#!/bin/bash
# Exercicio 5
# Gabriel Barros, 117111892

nome_maior_tcp="Nenhum processo está utilizando conexões TCP"
nome_maior_udp="Nenhum processo está utilizando conexões UDP"
maior_tcp=0
maior_udp=0

echo $( lsof | egrep 'UDP' | cut -d" " -f1) > processos
for i in $( lsof | egrep 'UDP' | cut -d" " -f1 | uniq );do
	processo_atual=0
	processo_atual=$( grep $i processos | wc -l )
	if [ $processo_atual -gt $maior_udp ];then
		maior_udp=$processo_atual
		nome_maior_udp=$i
	fi
done

echo $( lsof | egrep 'TCP' | cut -d" " -f1) > processos
for i in $( lsof | egrep 'TCP' | cut -d" " -f1 | uniq );do
	processo_atual=0
	processo_atual=$( grep $i processos | wc -l )
	if [ $processo_atual -gt $maior_tcp ];then
		maior_tcp=$processo_atual
		nome_maior_tcp=$i
	fi
done 

echo $(lsof | egrep 'TCP') > processos
tcp_listen=$( egrep -o '(LISTEN)' processos | wc -l )
tcp_established=$(egrep -o '(ESTABLISHED)' processos | wc -l)
tcp_syn_sent=$( egrep -o '(SYN_SENT)' processos | wc -l )
tcp_close_wait=$( egrep -o '(CLOSE_WAIT)' processos | wc -l )
rm processos

echo "====== TOP ====="
echo "TOP conexões UDP:"
echo "*" $nome_maior_udp
echo "TOP conexões TCP:" 
echo "*" $nome_maior_tcp
echo ""
echo "====== TCP ====="
echo ""
echo "LISTEN:" $tcp_listen
echo "ESTABLISHED:" $tcp_established
echo "SYN_SENT:" $tcp_syn_sent
echo "CLOSE_WAIT:" $tcp_close_wait
