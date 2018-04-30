#!/bin/bash

echo '====== TOP ====='
echo 'TOP conexões UDP:'

maior=0
comando=""
anterior=""
atual=""
cont=0
for line in $(lsof | grep UDP | cut -d' ' -f1 | sort) ;
   do 
      atual="$line"

      if [ "$anterior" != "$atual" ];
         then
            cont=0
      fi

      cont=$(($cont+1))

      if [ $cont -gt $maior ];
         then
            maior=$cont
            comando="$line"
      fi 

      anterior="$line"
   done 

echo "* $comando"

echo 'TOP conexões TCP:'

maior=0
comando=""
anterior=""
atual=""
cont=0
for line in $(lsof | grep TCP | cut -d' ' -f1 | sort) ;
   do 
      atual="$line"

      if [ "$anterior" != "$atual" ];
         then
            cont=0
      fi

      cont=$(($cont+1))
   
      if [ $cont -gt $maior ];
         then
            maior=$cont
            comando="$line"
      fi 

      anterior="$line"
   done 

echo "* $comando"
