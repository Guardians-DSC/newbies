#!/bin/bash 
# Felipe Vasconcelos Marinho - 116110223 - <felipe.marinho@ccc.ufcg.edu.br>

# Copiando o arquivo para o diretorio local.
cp ../../../questoes/exercicio_1/jan_95.txt.gz ./

# Descomprimindo o arquivo .txt.gz
gunzip jan_95.txt.gz

# A idéia deveria ser apenas filtrar '^(local|remote) - - ', mas quis fazer a ER completa :)
grep -E '^(local|remote) - - \[(0[1-9]|[1-2][0-9]|3[01])/[A-Z][a-z]{2}/[0-9]{4}:([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9] (-|\+)[0-9]{4}] ".*" [0-9]{3} (-|[0-9]{0,})$' jan_95.txt > jan_95_filtered.txt

# Filtrando as ocorrências locais e remotas e contando com o wc.
REQ_LOCAIS="`grep -E '^local' jan_95_filtered.txt | wc -l`"
REQ_REMOTAS="`grep -E '^remote' jan_95_filtered.txt | wc -l`"

echo "Foram realizadas $REQ_LOCAIS rquesições locais."
echo -e "Foram realizadas $REQ_REMOTAS rquesições remotas.\n"

echo "No total, $(($REQ_LOCAIS + $REQ_REMOTAS)) requesições foram feitas."
