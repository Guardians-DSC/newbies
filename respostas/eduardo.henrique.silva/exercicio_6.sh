#!/bin/bash
# Autor: Eduardo Henrique Pontes Silva0
# Matrícula: 117210360
# Login_CCC: eduardo.henrique.silva
# Script: Exercício 6

linha=$(ls -la | cut -c7-9 | grep -E -- "-w-|rw-|-wx|rwx")

if [ ${#linha} -eq 0 ]; 
then
        echo DIRETORIO SEGURO
else
        echo DIRETORIO INSEGURO
fi