#!/bin/bash

# Por Lucas Salustiano

# Este script deve ser executado dentro da mesma pasta que contém o arquivo `jan_95.txt.gz`.

# Primeiro, deve-se extrair o arquivo em questão e para isso usa-se o `gunzip` que, em suma,
# descomprime os arquivos recebidos como parâmetros. A opção `-k` indica que queremos manter 
# uma cópia dos arquivos comprimidos.
#
# A sintaxe `$(COMMAND1 | COMMAND2 | ... | COMMANDN)` indica que deseja-se que execute-se o(s) 
# comando(s) interno(s) aos parentesis, e após a execução completa de todos os comandos, a saída
# final seja associada à variável `FILE`.

FILE=$(gunzip -k jan_95.txt.gz)

# A linha abaixo é usada para filtrar os dois tipos de saídas desejadas, isto é, as requisições locais
# e as requisições remotas. Para isso, o `grep` foi usado para filtrar cada requisição contida no txt 
# gerado no passo anterior, pelo seu tipo (remote e local) e para cada match nas requisições, a 
# respectiva linha era escrita (ver `file descriptors`) no arquivo adequado.
#
# O conectivo `&&` foi usado somente para possibilitar a realização das duas filtragens numa única linha.
#
# A sintaxe `COMMAND1 | COMMAND2 | ... | COMMANDN` indica fluxo por pipe (`|`). Em resumo, a saída padrão
# (ver `file descriptors`) do `COMMAND1` será direcionada para a entrada padrão do `COMMAND2` e assim 
# sucessivamente até o último comando presente no fluxo.
#
# Para file descriptors, fluxos e pipes, ver: 
#       https://dev.to/lucasalustiano/a-brief-introduction-in-redirections-pipes-and-the-tee-command-1plm

cat jan_95.txt | grep remote > remotas.txt && cat jan_95.txt | grep local > locais.txt

# As linhas abaixo tem como função contar o número de linhas de cada arquivo após o fim da filtragem. O
# comando `wc -l` conta o número de linhas do arquivo passado como parâmetro e sua saída é da forma 
# `Nª_de_linhas  Nome_do_arquivo`. O comando `awk` é um comando usado para processar e buscar padrões em 
# textos na linha de comando, e tem como única função, nas linhas abaixo, receber a saída do comando `wc`
# e imprimir somente o número de linhas de cada arquivo. O texto entre aspas simples e chaves indica o
# comando a ser executado com os parâmetros posicionais vindos do `wc`. $1 indica que queremos imprimir 
# somente o primeiro parâmentro que no caso é o número de linhas. Esse número será alocado na sua 
# respectiva variável.  

LOCAIS=$(wc -l locais.txt | awk '{print $1}')
REMOTAS=$(wc -l remotas.txt | awk '{print $1}')

# Apresentação dos resultados obtidos.

echo "Quantidade de requisições locais feitas: ${LOCAIS}."
echo "Quantidade de requisições remotas feitas: ${REMOTAS}."

# Remoção dos arquivos criados ao longo da execução do script. O símbolo `*` (ver coringas) indica
# um match com qualquer sequência de caracteres, isto é, `*.txt` é equivalente a dizer `qualquer
# arquivo que termine em .txt`. Dessa forma, comando `rm` recebe de uma única vez os três arquivos
# criados durante a execução do script como parâmetro para remoção.

rm *.txt

# Sucesso 

exit 0