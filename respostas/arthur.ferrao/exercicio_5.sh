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

echo -e "\n====== TCP =====\n"
echo "LISTEN: "$(lsof | grep TCP | grep LISTEN | wc -l) 
echo "ESTABLISHED: "$(lsof | grep TCP | grep ESTABLISHED | wc -l) 
echo "SYN_SENT: "$(lsof | grep TCP | grep SYN_SENT | wc -l) 
echo "CLOSE_WAIT: "$(lsof | grep TCP | grep CLOSE_WAIT | wc -l) 
