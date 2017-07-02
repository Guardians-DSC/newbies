#!/bin/bash
# Questão 3 - Seleção Guardians
# Emanuel Joivo Bezerra Martins - 116110919
# O arquivo ls.log deve está no mesmo diretório do script.

# Filtrando apesar os valores das chamadas
cat ls.log | sed 's/<\|>//g' | awk '{print $NF}' | grep -E '[0-9]\.[0-9]*' > only_calls.txt

# Ordenando em ordem decrescente
sort -r only_calls.txt

# Tentativa de printar os 3 maiores
echo "Pódio de chamadas de maior duração:"
for i in seq 1 3;
do
  read line;

done < only_calls.txt

# Só sei até aqui.
