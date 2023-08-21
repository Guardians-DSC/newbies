# !/usr/bin/bash
# Júlio César da Silva Alcantara - 122110504

# descompacta o arquivo.
gunzip jan_95.txt.gz 

num_requisicoes_locais="$(grep -E '^(local|remote) - -' jan_95.txt | grep --extended-regexp '^local' | wc -l)"
num_requisicoes_remotas="$(grep -E '^(local|remote) - -' jan_95.txt | grep --extended-regexp '^remote' | wc -l)"

echo "Número de requisições locais: ${num_requisicoes_locais}"
echo "Número de requisições remote: ${num_requisicoes_remotas}"

# Quick Tips
# shebang -> interpretador do .sh  #!/usr/bin/bash
# Caso queira tornar o .sh como um executável, rode: chmod +x nome_arq
# grep | printar as linhas com o match (regex) 
# -E | --extended-regexp (suporta outros caracteres) 
# wc -l | (w)ord(c)ount --lines


