#!/bin/bash
# Izaquiel Nascimento  
# Matrícula: 117111446 
# Email: izaquiel.nascimento@ccc.ufcg.edu.br
# Questão 4

# lê a senha
read -s -p "senha: " senha
echo

# verifica se a senha possui menos que 8 caracteres
if [[ ${#senha} -lt 8 ]]; then 
	echo "Senha insegura! Senha muito curta"
# verifica se a senha não possui numeros e letras
elif [[ !($senha =~ [0-9] && $senha =~ [a-zA-Z]) ]]; then
	echo "Senha insegura! Senha deve conter letras e números"
# verifica se a senha não possui letras maiusculas
elif [[ !($senha =~ [A-Z]) ]]; then
	echo "Senha insegura! Senha deve possuir pelo menos uma letra maiúscula"
# se não entrar em nehum dos casos acima, a senha é segura
else 
	echo "senha segura!"	
fi
