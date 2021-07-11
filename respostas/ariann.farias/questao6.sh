#!/bin/bash

linha=$(ls -l | cut -c8-10 | grep -- "-w-\|rw-\|-wx\|rwx")

if [ "${#linha}" -eq 0 ]; 
then
    echo "DIRETORIO SEGURO";
else
    echo "DIRETORIO INSEGURO";
fi

