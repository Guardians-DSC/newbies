#!/bin/bash
# @sbsr <... /guardians>
# directory security status
# last update: 2018.1

<<DESCRICAO
    Verifica, utilizando o comando  find,
  se o  diretório onde o script se encon-
  tra é considerado ou não seguro.
    Um diretório é considerado seguro  se
  nenhum dos arquivos contidos neste pode
  ser editado por outro usuário.
DESCRICAO

if [[ `find . -perm -o+w` ]]; then
  echo "DIRETORIO INSEGURO"
else
  echo "DIRETORIO SEGURO"
fi
