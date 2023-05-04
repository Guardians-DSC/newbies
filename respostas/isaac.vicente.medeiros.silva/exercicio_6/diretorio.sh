#!/usr/bin/env bash
#
# Por Isaac Vicente em 2 Abr 2023

# Encontramos, com `find`, todos os arquivos no diretório atual que possuem permissão de
# escrita para 'outros' e contamos quantos arquivos com essas especificações existem.
num_arq_inseguros=$(find . -type f -perm /o+w | wc -l)

# Se existe pelo menos um arquivo que tenha permissão de escrita,
# nosso diretório atual é inseguro.
if [[ "${num_arq_inseguros}" -gt 0 ]]
then
    echo "DIRETORIO INSEGURO"
else
    echo "DIRETORIO SEGURO"
fi
