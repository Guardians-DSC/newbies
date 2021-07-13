#!/bin/bash
# Sergio de Sousa Duarte - 117110814
# exercicio_2

echo "Informe o numero de observacoes: " ; read n
echo "Informe o intervalo de tempo(em segundos): " ; read s
echo "Informe o nome de um usuario " ; read user

maCPU=0
meCPU=0

maMEM=0
meMEM=0

while [ 0 -lt $n ]; do
	
	ps aux --sort=-pcpu | grep $user > cpu.txt;
	ps aux --sort=-pmem | grep $user > mem.txt;
	
	lMaC=(sed -n '1 p;' cpu.txt)
	calculaMaCPU() 'lMaC'

	lMeC=(sed -n '$ p;' cpu.txt)
	calculaMeCPU() 'lMeC'

	lMaM=(sed -n '1 p;' mem.txt)
	calculaMaMEM() 'lMaM'

	lMeM=(sed -n '$ p;' mem.txt)	
	calculaMeMEM() 'lMeM'	

	sleep $s
	n=$[$n-1];
done

echo maiorCPU $maCPU menorCPU $meCPU maiorMemoria $maMEM menorMemora $meMEM

rm ./cpu.txt
rm ./mem.txt

calculaMaCPU(){
maCpu= $3

if [ maCPU -le maCpu]; then
	maCPU=$maCpu
fi

}

calculaMeCPU(){
meCpu= $3

if [ meCpu -le meCPU]; then
	meCPU=$meCpu
fi

}

calculaMaMEM(){
maMem= $3

if [ maMEM -le maMem]; then
	maMEM=$maMem
fi

}

calculaMeMEM(){
meCpu= $3

if [ maMem -le maMEM]; then
	maMEM=$maMem
fi

}
