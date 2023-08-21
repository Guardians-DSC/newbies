# !/bin/bash
#
# @author Júlio Alcantara - 122110504

read password

if [[ "$password" =~ [A-Z] && "$password" =~ [0-9] && ${#password} -gt 8 ]]; then
	echo "Senha segura! :)"
else
	echo "Senha insegura!"
fi
