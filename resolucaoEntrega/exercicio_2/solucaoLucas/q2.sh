#!/bin/bash

# As três linhas abaixo são a associação das váriaveis usadas no script com seus respectivos valores,
# passados por linha de comando durante a invocação do script. Pelo fato desses valores serem posicionais
# devemos especificar qual parâmetro queremos associar á determinada variável, por isso a sintaxe `${NUM}`.

N=${1}
S=${2}
P_USER=${3}

# O pipe abaixo tem o objetivo de selecionar os processos relacionados ao usuário P_USER. O comando `top`
# fornece informações sobre os processos em execução, tais como pid, usuário associado, porcentagem de memória
# e de cpu utilizada por determinado processo, estado do processo, etc. A opção `-b` indica a listagem de todos
# processos em execução de forma estática (por default, `top` lista os processos de forma iterativa), a opção `-d` 
# indica o delay, em segundos, de atualização da tela com as informaçãoes dos processos e a opção `-n` indica o número 
# de iterações para atualização da tela com as informações dos processos (`-d` indica de quantos em quantos 
# segundos `top` deve atualizar a tela e `-n` indica quantas vezes isso será feito).
#
# O comando `grep` receberá a saída do comando `top` e irá filtrar a saída para que só linhas associadas a P_USER
# sejam selecionadas. Note que 'linhas relacionadas' engloba também linhas em que P_USER seja uma substring do nome
# de algum processo que esteja rodando, e não é isso que queremos.
# 
# Por esse motivo, utilizaremos o comando `awk` pra isolar da saída do `grep`, somente os dados que precisaremos
# para gerar o report dos processos, são esses dados: USER PID NOME_PROCESSO %CPU %MEM, exatamente nessa ordem de 
# saída. Essa ordenação foi proposital para facilitar a filtragem dos processos pelo nome de usuário.
# 
# Um segundo `grep` foi utilizado para filtrar somente as linhas que comecem com P_USER, dessa forma, garante-se
# que somente processos em que o usuário comece com P_USER sejam analisados. 

PROCESSOS=$(top -b -d ${S} -n ${N} | grep $P_USER | awk '{print $2, $1, $12, $9, $10}' | grep ^$P_USER)

# As próximas quatro linhas são para fins de seleção do processo que mais consumiu cpu, que mais consumiu memória, que
# menos consumiu cpu e menos consumiu memória, respectivamente. A ordenação foi feita na variável PROCESSOS considerando
# os campos que representam consumo de cpu ($4) e consumo de memória ($5). O parâmetro `-b` serve para ignorar os espaços
# em branco a esqueda do campo, o parâmetro `-g` serve para ordenar com comparação numérica geral e o parâmetro `-r` serve
# para para inverter a ordenação a fim de mostrar os processos mais consumidores primeiro.
#
# O comando `head` foi utilizado unicamente para capturar os dados do primeiro processo, de $PROCESSOS, de acordo com a 
# a ordenação feita.

MAIS_CPU=$(echo "${PROCESSOS}" | sort -k 4 -brg | head -n 1)
MAIS_MEM=$(echo "${PROCESSOS}" | sort -k 5 -brg | head -n 1)

MENOS_CPU=$(echo "${PROCESSOS}" | sort -k 4 -bg | head -n 1)
MENOS_MEM=$(echo "${PROCESSOS}" | sort -k 5 -bg | head -n 1)

# Apresentação das categorias dos processos com seus respectivos dados, sendo eles da forma:
#   USER | PID | NOME-PROCESSO | %CPU | %MEM

echo
echo "Processo que MAIS está consumindo CPU  => ${MAIS_CPU}"
echo "Processo que MAIS está consumindo MEM  => ${MAIS_MEM}"
echo
echo "Processo que MENOS está consumindo CPU => ${MENOS_CPU}"
echo "Processo que MENOS está consumindo MEM => ${MENOS_MEM}"

# Sucesso

exit 0