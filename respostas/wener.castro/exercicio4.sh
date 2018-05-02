
#!/bin/sh
echo -n "Entre com a senha: "
read password


if [ ${#password} -lt 8 ]; then
    echo "Senha insegura! - Necessário que senha possua um mínimo de 8 caracteres."
elif [[ !($password =~ [A-Z|a-z]) || !($password =~ [0-9]) ]]; then
    echo "Senha insegura! - Necessário que a senha contenha letras e números."
elif [[ !($password =~ [A-Z]) ]]; then
	echo "Senha insegura! - Necessário que a senha possua pelo menos uma letra maiúscula"
else
	echo "Senha segura!"
fi

