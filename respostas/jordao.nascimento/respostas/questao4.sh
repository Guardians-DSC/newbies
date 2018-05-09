read -p "\n======================\nRegistre sua senha: " -s senha

if [ ${#senha} -lt 8 ]; then
	echo -e "\nsenha insegura - precisa conter mais do que 8 digitos"
elif [[ ! $senha =~ [A-Z] ]]; then
	echo -e "\nsenha insegura - precisa conter uma letra maiuscula"
elif [[ ! $senha =~ [0-9] ]]; then
	echo -e "\nsenha insegura - precisa conter um numero";
else
	echo -e "\nsenha segura";
fi
