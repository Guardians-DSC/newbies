#!/bin/sh
# Igor Araújo Tavares de Farias - 116210056
# exercicio_1 - Script de resposta para seleção dos Guardians

# Descompacta o arquivo jan_95.txt.gz
gunzip jan_95.txt.gz
# Gera um arquivo remote.txt apenas com os remotes válidos
cat jan_95.txt | grep "remote - -" > remote.txt
# Gera um arquivo local.txt apenas com os locales válidos
cat jan_95.txt | grep "local - -" > local.txt
# Atribui a quantidade de comandos de cada tipo de solicitação às respectivas variáveis
qnt_remote=`cat remote.txt | wc -l`
qnt_local=`cat local.txt | wc -l`
# Imprime as variáveis correspondentes às solicitações remotas e locais
echo $qnt_remote
echo $qnt_local

