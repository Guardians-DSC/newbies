#!/bin/bash
# Iago Tito Oliveria - 118110162
# Email CCC: iago.oliveira@
# Atividade 4

read -p "Insira a senha: " senha

regexnumeros=[0-9]
regexmaiusculas=[A-Z]

if [ ${#senha} -ge 8 ] ; then
  if [[ $senha =~ $regexmaiusculas ]] ; then
    if [[ $senha =~ $regexnumeros ]] ; then
      echo "Senha segura."
    else
      echo "Senha insegura. Digite uma senha com melo menos um número."
    fi
  else
    echo "Senha insegura. Digite uma senha com pelo meno uma letra maiúscula."
  fi
else
  echo "Senha insegura. Digite uma senha com pelo menos 8 caracteres."
fi
