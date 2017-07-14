#!/bin/bash
# Leandro de Souto Lima- 116211245
# exercicio_1 


LOCAL=$(grep '\- \-' jan_95.txt | grep 'local' | wc -l)
REMOTE=$(grep '\- \-' jan_95.txt | grep 'remote' | wc -l)

echo "Quantidade Local" $LOCAL
echo "Quantidade Remote" $REMOTE
