#!/bin/bash
# Exercicio 6
# Gabriel Barros, 117111892

a=$((ls -l) | cut -d" " -f1 | grep '.*w.$' | wc -l)
if [ $a = 0 ];
then
    echo "DIRETORIO SEGURO"
else
    echo "DIRETORIO INSEGURO"
fi
