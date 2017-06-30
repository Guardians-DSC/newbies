#!/bin/bash
# Questão 2 - Seleção Guardians
# Emanuel Joivo Bezerra Martins - 116110919

# Não há tratamento de erros para quantidade de parâmetros inválida. ($# < 3)

OBS_NUMBER=$1
SECONDS=$2
P_USER=$3

for ((i = 0; i < $OBS_NUMBER; i++));
do
  sleep "$SECONDS"
  ps aux > processos.txt
done
