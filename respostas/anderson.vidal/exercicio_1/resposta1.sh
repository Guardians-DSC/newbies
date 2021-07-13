#!/bin/bash
#Anderson Fellipe de Vasconcelos Vidal - 117110162 - anderson.vidal@ccc.ufcg.edu.br

#Descompacta arquivo jan_95.txt.gz e o copia para o diretório atual:
cp ~/newbies/questoes/exercicio_1/jan_95.txt.gz .
gzip -d jan_95.txt.gz

#Modelo de requisição considerado:
#local - - [24/Oct/1994:13:47:19 -0600] "GET 1.gif HTTP/1.0" 200 1210

#Descarta as linhas que não tiverem o " - - [":
sed -i '/ - - \[/! d' jan_95.txt

#Grava a quantidade de requisições remotas e locais descritas no log
quantRemote=$(grep -c "remote - -" jan_95.txt)
quantLocal=$(grep -c "local - -" jan_95.txt)

#Imprime as variaveis
echo "Quantas Requisições remotas foram feitas?" $quantRemote
echo "Quantas Requisições locais foram feitas?" $quantLocal
