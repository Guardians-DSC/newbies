#!/bin/bash

N=$1
S=$2
P_USER=$3

CPU_FILE=cpu_processes.txt
MEM_FILE=mem_processes.txt

for i in `seq $N`; do
  sleep $S

  ps aux | grep -e "^$P_USER" > temp_processes.txt

  cat temp_processes.txt | awk -F' ' '{ print $3 }' >> $CPU_FILE
  cat temp_processes.txt | awk -F' ' '{ print $4 }' >> $MEM_FILE

  rm temp_processes.txt
done;

sort -n $CPU_FILE -o $CPU_FILE
sort -n $MEM_FILE -o $MEM_FILE

echo "CPU máximo: `tail -n 1 $CPU_FILE`"
echo "CPU mínimo: `head -n 1 $CPU_FILE`"

echo "MEM máximo: `tail -n 1 $MEM_FILE`"
echo "MEM mínimo: `head -n 1 $MEM_FILE`"

rm $CPU_FILE $MEM_FILE
