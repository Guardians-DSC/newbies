#!/bin/bash
#
# José Ramon Fragoso da Silva - 116210412
#
# jose.ramon.silva@ccc.ufcg.edu.br
#
# exercicio_3 -  Script exemplo de reposta para as questoes dos guardians.
#
###############################################################################################################

# Copio o arquivo para a pasta local
cp ../../../questoes/exercicio_3/ls.log ./

# Crio 3 arquivos, um com os tempos de execucao, outro com a saida e outro com o nome da chamada
cat ls.log | cut -d"<" -f2 | cut -d">" -f1 > tempo.txt
cat ls.log | cut -d"=" -f2 | cut -d"<" -f1 > saida.txt
cat ls.log | sed 's/ *(.*//' > syscall.txt

# Junto os 3 arquivos em outro arquivo "sys_tempo.txt" contendo as 3 informacoes
paste tempo.txt saida.txt syscall.txt > sys_tempo.txt

# Removo os arquivos que nao vao servir mais
# Porem mantenho o arquivo saida.txt, para poder contar quantas chamadas tem saida -1
rm tempo.txt
rm syscall.txt

# Ordeno o arquivo sys_tempo.txt para que os maiores tempos fiquem no fim do arquivo
sort -n sys_tempo.txt> processos_ordenados.txt

# Reordeno para que a ordem seja invertida
tac processos_ordenados.txt > processos_reordenados.txt

# Removo o arquivo com a primeira ordenacao
rm processos_ordenados.txt


echo "CHAMADAS DE MAIOR DURACAO: "
# Imprimo as 3 primeiras chamadas do arquivo.
cat processos_reordenados.txt | head -3 

# só sei fazer até aqui
