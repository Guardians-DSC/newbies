#!/usr/bin/env bash
#
# Por Isaac Vicente em 2 Abr 2023

num_arq_inseguros=$(find . -type f -perm /o+w | wc -l)

if [[ "${num_arq_inseguros}" -gt 0 ]]
then
    echo "DIRETORIO INSEGURO"
else
    echo "DIRETORIO SEGURO"
fi
