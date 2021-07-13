#!/bin/bash

read psswrd
e=0
char="${#psswrd}"
insegura=""
if [ $char -ge 8 ]
then e=$(($e+1))
else a=" no mínimo 8 caracteres;"
fi

if [[ "$psswrd" =~ [a-zA-Z] && "$psswrd" =~ [0-9] ]]
then e=$(($e+1))
else b=" letras e números;" 
fi 

if [[ "$psswrd" =~ [A-Z] ]]
then e=$(($e+1))
else c=" pelo menos uma letra maiúscula."
fi

if [ $e -eq 3 ]
then echo "Senha segura! :)"
else echo "Senha insegura! A senha deve conter:$a$b$c"
fi
