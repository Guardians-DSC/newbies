#!/bin/bash
# @sbsr <... /guardians>
# password analyzer
# last update: 2018.1

<<DESCRICAO
    Analisa se  uma senha é considerada
  ou não segura.
    Para que seja  considerada  segura,
  a senha deve possuir 8 ou mais carac-
  teres e,  dentre estes, letras maiús-
  culas, minúsculas e números.
DESCRICAO

# Informa os motivos pelos quais a sen-
# ha inserida não é  segura e o que de-
# ve possuir para que seja.
function informacoes() {
  emoticon=$1; definicao=$2
  echo -e "\n\nSenha insegura. ${emoticon}"
  echo -e "A sua senha não possui ${definicao}."
  echo -e "\nA senha deve possuir:"
  echo -e "* 8 ou mais caracteres;"
  echo -e "* letras (maiúsculas e minúsculas);"
  echo -e "* e números.\n"
}

read -s -p "Entre com a senha: " senha

if [ ${#senha} -lt 8 ]; then
  informacoes "(╹︹╹)" "8 ou mais caracteres"
elif ! [[ $senha =~ [a-z] && $senha =~ [0-9] ]]; then
  informacoes "(╹︵╹)" "letras e números"
elif ! [[ $senha =~ [A-Z] ]]; then
  informacoes "(╹_╹)" "letras maiúsculas"
else
  echo -e "\nSenha segura! (╹ᴗ╹)"
fi
