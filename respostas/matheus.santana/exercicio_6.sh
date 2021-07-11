#!/bin/bash

output=$(find . -maxdepth 1 -perm -o+w)

if [[ -z $output ]] 
then
	echo "DIRETORIO SEGURO"

else
	echo "DIRETORIO INSEGURO"

fi


