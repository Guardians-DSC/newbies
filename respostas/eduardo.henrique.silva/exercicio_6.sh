#!/bin/bash
# Autor: Eduardo Henrique Pontes Silva0
# Matrícula: 117210360
# Login_CCC: eduardo.henrique.silva
# Script: Exercício 6

# Variável de teste que vai contar quantas vezes as permissões aparecem
teste=$(ls -l | cut -c8-10 | egrep -- "-w-|rw-|-wx|rwx" | wc -l)

# Condição que teste se o diretorio é seguro ou não
if [ $teste -eq 0 ]; 
then
        echo "DIRETORIO SEGURO"
else
        echo "DIRETORIO INSEGURO"
fi
