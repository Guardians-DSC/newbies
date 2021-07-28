#!/bin/sh
# Lucas Matheus Ferreira Barreto - 116210932
# Exercicio 1 - Script de resposta para seleção dos Guardians.


# Descompacta o arquivo jan_95.txt.gz
gunzip jan_95.txt.gz

# Gera um arquivo remote.txt apenas com os remotes válidos
cat jan_95.txt | grep "remote - -" > remote.txt

# Gera um arquivo local.txt apenas com os locais válidos
cat jan_95.txt | grep "local - -" > local.txt

# Atribuindo a quantidade de comandos de cada tipo de solicitação às variaveis
removidas=`cat remote.txt | wc -l`
locais=`cat local.txt | wc -l`

# Imprime as variáveis correspondentes às solicitações remotas e locais
echo $removidas
echo $locais

