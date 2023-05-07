#!/usr/bin/env bash
#
# Por Isaac Vicente em 1 Abr 2023

# Lemos a variável `senha` do usuário
read -p "Entre com a senha: " senha

# Checamos se o tamanho da senha é maior ou igual a 8 (`g`reater or `e`quals to)
if [[ ${#senha} -ge 8 ]]
then
    # Checamos se a senha é composta apenas por letras ou números (`\w`)
    # (Obs. nº 1: ^ e $ representam o começo e o fim, respectivamente, então
    # desde o começo ao fim checamos um padrão)
    # (Obs. nº 2: a opção `--silent` faz com que `grep` não printe nada)
    if  echo "${senha}" | grep --extended-regexp --silent "^\w+$"
    then
	# Checamos se a senha tem pelo menos uma letra maiúscula
	# (`+` em regex é para 1 ou mais)
	if echo "${senha}" | grep --extended-regexp --silent "[A-Z]+"
	then
	    echo "Senha segura! :)"
	else
	    echo "Senha insegura! Sua senha deve conter pelo menos uma letra maiúscula"
	fi
    else
	echo "Senha insegura! Sua senha deve conter apenas letras ou números"
    fi
else
    echo "Senha insegura! Sua senha deve conter 8 caracteres ou mais"
fi

