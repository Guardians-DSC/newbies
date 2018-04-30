#!/bin/bash

modelName=$(cat /proc/cpuinfo | grep 'model name' | grep -n ^ | grep ^1 | cut -d: -f3 | sed 's/ //')
ethernet=$(lspci | grep 'Ethernet controller' | cut -d: -f3 | sed 's/ //')
memTotal=$(cat /proc/meminfo | grep 'MemTotal' | awk '{print $2 $3}')
textoBase="$modelName\n$ethernet\n$memTotal"

if [ $(ls | grep 'ArquivoBase' | wc -l) = 0 ];
   then
      echo -e $textoBase > 'ArquivoBase.txt'
   else
      if [ "$(cat ArquivoBase.txt | sed ':a;$!N;s/\n/\\n/g;ta')" = "$textoBase" ];
         then
            echo 'SEM ALTERACOES' 
         else
            echo 'SISTEMA ALTERADO' 
      fi
fi 



