#!/bin/bash

# Amanda Vivial Alves de Luna e Costa - 116210896
# Resposta ao exercicio 3

# Criando um arquivo com as Syscalls.
sed '/ENOENT/d'  ls.log > ls_calls.txt

# Colocando os valores importantes em dois arquivos.
cat ls_calls.txt | cut -d"<" -f2 | cut -d">" -f1 > tempo.txt
cat ls_calls.txt | cut -d"(" -f1 > syscall.txt


# Só consegui fazer até aí

