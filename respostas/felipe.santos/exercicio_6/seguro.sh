#!/bin/bash

## FELIPE MOTA DOS SANTOS ##
# QUESTAO 6 #

inseguros=$(ls -l | cut -c8-10 | grep -- "-w-\|rw-\|-wx\|rwx" | wc -l);

if [ $inseguros -gt 0 ]; then
    echo 'DIRETORIO INSEGURO'
else
    echo 'DIRETORIO SEGURO'
fi
