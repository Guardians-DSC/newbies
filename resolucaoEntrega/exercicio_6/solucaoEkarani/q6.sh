#!/bin/bash

# A resolução dessa questão é mais simples que outras anteriores
# Faremos com duas abordagens: utilizando o comando ls -l e o comando find -perm

# Caso local de diretório inseguro
#path1='/mnt/c/Users/ekara/Downloads' #adicionar o caminho completo do diretório
# Caso local de diretório seguro
#path2='/mnt/c/Windows/System/Speech'


echo "Verificando permissões com comando ls -l"

# Primeiro direcionaremos todas as permissões de demais usuários num arquivo ou variáveç por meio do comando cut
# Observamos que todas as linhas que saem do comando ls -l são começam com as permissões.
# O primeiro caracter é ocupado com o tipo de objeto, se é arquivo, diretório etc.
# Os três caracteres consecutivos são das permissões do proprietário, os três seguintes são do grupo proprietário
# e os três últimos são dos demais usuários.
# Dado o exemplo de saída 
#	-rw-rw----
# Se contarmos as "colunas" dos caracteres a partir do 1, teremos então que as permissões dos demais usuários se encontram
# entre os caracteres 8 e 10
#	- | r | w | - | r | w | - | - | - | -
#	1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10

#quantidade=$(ls -l $path1 | cut -c8-10 | grep -c w)
#quantidade=$(ls -l $path2 | cut -c8-10 | grep -c w)
quantidade=$(ls -l | cut -c8-10 | grep -c w)

if [ $quantidade -eq 0 ]; 
then
       echo "DIRETORIO SEGURO"
else
	echo "DIRETORIO INSEGURO"
fi

echo "-----------------------"
echo "Verificando permissões com o comando find -perm"

# O comando find -perm irá procurar os arquivos que têm as permissões que queremos
# Todavia, as permissões são referidas pelo valor octal nesse comando ou pelos seguintes especificações:
# 	Sobre nível de permissão:	
#		-u	Se refere ao proprietário
#		-g	Se refere ao grupo
#		-a	Se refere aos demais
#	Sobre o tipo de permissão:
#		w	Escrita
#		r	Leitura
#		x	Execução
# Essas duas especificações são "conectadas" por "=" ou "="
# Ou seja, procuraremos por arquivos da seguinte forma:
#	find -perm -a=w
# Pois queremos saber se há arquivos cuja permissão de escrita está disponível para os demais usuários

#inseguros=$(find $path1 -perm -a=w | wc -l)
#inseguros=$(find $path2 -perm -a=w | wc -l)
inseguros=$(find -perm -a=w | wc -l)

if [ $inseguros -eq 0 ];
then
	echo "DIRETORIO SEGURO"
else
	echo "DIRETORIO INSEGURO"
fi
