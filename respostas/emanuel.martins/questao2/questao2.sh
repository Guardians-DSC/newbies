#!/bin/bash
# Questão 2 - Seleção Guardians
# Emanuel Joivo Bezerra Martins - 116110919

# Não há tratamento de erros para quantidade de parâmetros inválida. ($# < 3)

OBS_NUMBER=$1
SECONDS=$2
P_USER=$3

for i in seq 1 OBS_NUMBER; do
  ps aux | grep '$P_USER' > arquivo_auxiliar.txt
  sleep "$SECONDS"
done

cat arquivo_auxiliar.txt | awk '{print $3}' > cpu.txt
cat arquivo_auxiliar.txt | awk '{print $4}' > mem.txt

# Comparação dos valores de cpu e memória.

CPU_MAX=0
CPU_MIN=0
MEM_MAX=0
MEM_MIN=0

while read line
do
  if [[ $line > $CPU_MAX ]];
  then
    CPU_MAX=$line
  fi

  if [[ $line < $CPU_MIN ]];
  then
    CPU_MIN=$line
  fi
done < cpu.txt

while read line
do
  if [[ $line > $MEM_MAX ]];
  then
    MEM_MAX=$line
  fi

  if [[ $line < $MEM_MIN ]];
  then
    MEM_MIN=$line
  fi
done < mem.txt

echo "Uso máximo e mínimo de cpu, respectivamente: $CPU_MAX | $CPU_MIN"
echo "Uso máximo e mínimo de memória, respectivamente: $MEM_MAX | $MEM_MIN"

# Remoção de arquivos auxiliares
rm cpu.txt arquivo_auxiliar.txt mem.txt
