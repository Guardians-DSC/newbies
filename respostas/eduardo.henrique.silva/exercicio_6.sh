#!/bin/bash
# Autor: Eduardo Henrique Pontes Silva0
# Matrícula: 117210360
# Login_CCC: eduardo.henrique.silva
# Script: Exercício 6

teste=$(ls -l | cut -c8-10 | egrep -- "-w-|rw-|-wx|rwx" | wc -l)

if [ $teste -gt 0 ]; 
then
        echo "DIRETORIO INSEGURO"
else
        echo "DIRETORIO SEGURO"
fi
