#!/bin/bash

#Descompactação do arquivo
arquivo=`ls *.txt.gz`
gzip -d  $arquivo

ARQUIVOTXT='jan_95.txt'

#Deletar linhas incorretas
grep -i "\ - - " $ARQUIVOTXT >> tratado.txt


#Contagem de requisições
REQ_REMOTE=`grep -c remote tratado.txt`
REQ_LOCAL=`grep -c local tratado.txt`

echo "Número de requisições remotas: $req_remote"
echo "Número de requisições locais: $req_local"

rm *.txt
