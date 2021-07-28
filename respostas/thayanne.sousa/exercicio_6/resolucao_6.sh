#!/bin/bash

if [[ $(find . -perm -o+w) ]]; then
    echo 'DIRETORIO INSEGURO'
    else
        echo 'DIRETORIO SEGURO'
fi