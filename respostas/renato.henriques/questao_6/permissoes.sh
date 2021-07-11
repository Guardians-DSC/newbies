#!/bin/bash

linha=$(ls -la | cut -c7-9 | grep -E -- "-w-|rw-|-wx|rwx")

if [ ${#linha} -eq 0 ]; 
then
        echo DIRETORIO SEGURO
else
        echo DIRETORIO INSEGURO
fi
