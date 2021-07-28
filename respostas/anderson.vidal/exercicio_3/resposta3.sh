#!/bin/bash
#Anderson Fellipe de Vasconcelos Vidal - 117110162 - anderson.vidal@ccc.ufcg.edu.br

#copiando o arquivo ls.log para o diretório de trabalho
cp ~/newbies/questoes/exercicio_3/ls.log .

#inicializando variaveis
maiorTempo1=0.0;
maiorTempo2=0.0;
maiorTempo3=0.0;

#buscando as 3 syscall com maiores tempos de execução
for t in $(cut -d'<' -f2 ls.log | cut -d'>' -f1 | sed '/[[:alpha:]]/ d');
do
	if [[ $maiorTempo1 < $t ]];
	then
		maiorTempo1=$t
	fi
done
for t in $(cut -d'<' -f2 ls.log | cut -d'>' -f1 | sed '/[[:alpha:]]/ d');
do
	if [[ $maiorTempo2 < $t ]];
	then
		if [[ $t < $maiorTempo1 ]];
		then
			maiorTempo2=$t
		fi
	fi
done
for t in $(cut -d'<' -f2 ls.log | cut -d'>' -f1 | sed '/[[:alpha:]]/ d');
do
	if [[ $maiorTempo3 < $t ]];
	then
		if [[ $t < $maiorTempo2 ]];
		then
			maiorTempo3=$t
		fi
	fi
done

echo "As três Syscall's com os maiores tempos:"
echo " "
echo $(grep "<"$maiorTempo1">" ls.log)
echo $(grep "<"$maiorTempo2">" ls.log)
echo $(grep "<"$maiorTempo3">" ls.log)
echo " "

#Inicializando variáveis
erros=$(grep -c "= -1" ls.log);
maisErra='';
quantErro=0;

#arquivoAuxiliar
grep "= -1" ls.log > sysCallErros.txt

#buscando o erro mais recorrente
while read LINHA;
do
	if [[ $(egrep -c $LINHA ls.log) < $quantErro ]];
	then
		quantErro=$(egrep -c $LINHA ls.log);
		maisErra=$LINHA;
	fi
done < sysCallErros.txt

#O resultado é mostrado como pede a questão, porém aparecem mensagens de erro com relação a alguns caracteres
#(metacaracteres) que não consegui fazer o egrep interpreta-los de forma literal
echo "A Syscall com mais erros, com "$quantErro", é:"
echo " "
echo $maisErra
echo " "
echo "O número de Syscall que não tiveram sucesso é de:"
echo $erros	
