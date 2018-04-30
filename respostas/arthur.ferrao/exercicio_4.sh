#!/bin/bash

REGEX="[A-Z]{1,}"
REGEX2="[1-9]{1,}"
echo "Entre com a senha:"
read senha
if [ ${#senha} -lt 8 ];
   then
      echo "Senha insegura!"
   else
      if [[ "$senha" =~ ${REGEX} ]];
         then
            if [[ "$senha" =~ ${REGEX2} ]];
               then
                  echo "Senha segura!"
               else
                  echo "Senha insegura!"
            fi
         else
            echo "Senha insegura!"
      fi
fi


