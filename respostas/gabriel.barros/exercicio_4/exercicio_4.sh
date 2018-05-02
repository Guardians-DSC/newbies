#!/bin/bash
# Exercicio 4
# Gabriel Barros, 117111892
senha=""
echo "Entre com a senha:"
read senha

if [  $(expr length $senha) -lt 8 ];
then
    echo "Senha insegura! Senha muito curta"
elif [ $(echo $senha | grep '.*[a-Z].*' | wc -l) = 0 ] || [ $(echo $senha | grep '.*[0-9].*' | wc -l) = 0 ];
then
    echo "Senha insegura! A senha deve ter letras e números"
elif [ $(echo $senha | grep '.*[A-Z].*' | wc -l) = 0 ];
then
    echo "Senha insegura! A senha deve ter pelo menos uma letra maiúscula"
else
    echo "Senha segura! :)"
fi



