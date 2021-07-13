#!/bin/bash
# Resposta do Exércicio 3
# Áxel Medeiros, 117111889
# OBS: esse script deve está na pasta do arquivo ou ser adicionado no $PATH

# Selecionando as linhas para evitar erros
sed -n '1,90p' ls.log >> tempo.txt  
sed -n '93,95p' ls.log >> tempo.txt
tempo=`cat tempo.txt | cut -d"<" -f2 | cut -d">" -f1 | sort -r | sed -n '1,3p'`

echo "Maiores durações:" $tempo

# Buscando erros de Syscall
erros=`cat ls.log | grep "= \-1" | cut -d"(" -f1` 

# Observando os erros com o comando anterior direto do console, 
# tenho que só existe erros com "access","stratfs","ioctl"
access_cont=0
stratfs_cont=0
ioctl_cont=0

for i in $erros
do
	if [ $i == "access" ]; then
		access_cont=`expr $access_cont + 1`
	elif [ $i == "statfs" ]; then
		stratfs_cont=`expr $stratfs_cont + 1`
	elif [ $i == "ioctl" ]; then
		ioctl_cont=`expr $ioctl_cont + 1`
	fi
done

if [ $access_cont -gt $stratfs_cont ] && [ $access_cont -gt $ioctl_cont ]; then
	echo "A syscall Access teve mais erros, com $access_cont"
elif [ $stratfs_cont -gt $ioctl_cont ]; then
	echo "A syscall Stratfs teve mais erros, com $stratfs_cont"
else
	echo "A syscall Ioctl teve mais erros, com $ioctl_cont"
fi

# Apagando arquivos auxiliares
sleep 1
rm "tempo.txt"
