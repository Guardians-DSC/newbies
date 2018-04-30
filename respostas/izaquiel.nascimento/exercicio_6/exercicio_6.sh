#!/bin/bash
# Izaquiel Nascimento  
# Matrícula: 117111446 
# Email: izaquiel.nascimento@ccc.ufcg.edu.br
# Questão 6

# filtra e conta as palavras que contenham 7 caracteres e terminam em -w-, rw-, -wx ou rwx e 
# que estejam no começo de linha do comando ls -l (no caso as permissões de escrita dos outros usuários)
num_w_outros="$(ls -l | egrep -wc '^.{7}(-w-|rw-|-wx|rwx)')"

# se o numero de aquivos que permitem a escrita por outros usuários for igual a 0, então
# o diretório é seguro, senão o diretório é dito inseguro
if [[ $num_w_outros == 0 ]]; then
	echo DIRETORIO SEGURO
else
	echo DIRETORIO INSEGURO
fi