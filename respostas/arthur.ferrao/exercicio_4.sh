#!/bin/bash

regexMaiusculas="[A-Z]{1,}"
regexNumeros="[1-9]{1,}"
regexLetras="[a-zA-Z]{1,}"
echo "Entre com a senha:"
read senha
if [ ${#senha} -lt 8 ];
   then
      echo "Senha insegura! <Minimo de 8 caracteres.>"
   else
      if [[ "$senha" =~ ${regexLetras} && "$senha" =~ ${regexNumeros} ]];
         then
            if [[ "$senha" =~ ${regexMaiusculas} ]];
               then
                  echo "Senha segura!"
               else
                  echo "Senha insegura! <Deve conter pelo menos uma letra maiuscula.>"
            fi
         else
            echo "Senha insegura! <Deve conter letras e numeros.>"
      fi
fi


