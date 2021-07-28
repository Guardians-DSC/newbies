#!/usr/bin/env bash

N=$1
S=$2
P_USER=$3

maior_cpu=0
maior_mem=0

menor_cpu=100
menor_mem=100

user_found=0

t=0
while ((t++ < $N))
do
  while read -r line

  do

    line=($line)
    if [[ ${line[0]} =~ $P_USER ]]
    then
      user_found=1

      cpu=${line[2]}
      mem=${line[3]}

      if [[ $(echo "$cpu > $maior_cpu" | bc) -eq 1 ]];
      then
        maior_cpu=$cpu
      fi

      if [[ $(echo "$cpu < $menor_cpu" | bc) -eq 1 ]];
      then
        menor_cpu=$cpu
      fi

      if [[ $(echo "$mem > $maior_mem" | bc) -eq 1 ]];
      then
        maior_mem=$mem
      fi

      if [[ $(echo "$mem < $menor_mem" | bc) -eq 1 ]];
      then
        menor_mem=$mem
      fi
    fi
  done < <(ps -aux | sed -n '1!p')


  if [[ $user_found -eq 1 ]]
  then
    echo 'CPU - menor: '$menor_cpu' | maior: '$maior_cpu
    echo 'Memória - menor: '$menor_mem' | maior: '$maior_mem
    # echo $menor_mem $menor_cpu $maior_mem $maior_cpu
  else
    echo "Não existe nenhum processo para usuários iniciados em '$P_USER'"
  fi

  echo '----------------------------------------------'
  sleep $S

done
