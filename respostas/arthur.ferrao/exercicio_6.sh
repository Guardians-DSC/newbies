#!/bin/bash

comando=$(ls -l | cut -d" " -f1 | egrep [a-z-]{8}w | wc -l)


if [ $comando = 0 ];
   then
      echo 'DIRETORIO SEGURO'
   else
      echo 'DIRETORIO INSEGURO'
fi



