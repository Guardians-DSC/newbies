read -p "\n======================\nRegistre sua senha: " -s senha

if [[ ${#senha} -lt 8 || ! $senha =~ [A-Z] || ! $senha =~ [0-9] ]]; then
	echo -e "senha insegura"
else
	echo -e "\nsenha segura";
fi
