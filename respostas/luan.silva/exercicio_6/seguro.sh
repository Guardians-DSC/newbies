#!/bin/bash

linha=$(ls -l | cut -c 8-10)
a="-w-"
b="rw-"
c="-wx"
d="rwx"

if [ $linha = $a -o $linha = $b -o $linha = $c -o $linha = $d ]
then
    echo "DIRETORIO INSEGURO"
else
    echo "DIRETORIO SEGURO"
fi
