#!/bin/bash

linha=$(ls -la | cut -c7-9 | grep -- "-r-\|xr-")

if [ "${#linha}" -eq 0 ]; 
then
    echo "DIRETORIO SEGURO";
else
    echo "DIRETORIO INSEGURO";
fi

