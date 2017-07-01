#!/bin/sh
#Vinicius Jorge Pereira - 116210568
#Questão 1


#Copiando o arquivo compactado para o diretorio
cp ../../questoes/exercicio_1/jan_95.txt.gz ./

#Descompactando o arquivo
gzip -d jan_95.txt.gz

#Salvo as linhas válidas que contem os dois traços em um novo arquivo txt
#Sempre atualizando o mesmo arquivo
sed '/ - - /!d' jan_95.txt > arquivos_validos.txt

# Por meio do novo arquivo, pego as linhas que contem as palavras
# remote e Local e as salvo em duas variáveis locais
remote=`grep -wc remote arquivos_validos.txt`
local=`grep -wc local arquivos_validos.txt`

#Faço a impressão dos resultados obtidos
echo "Processos Locais: $local"
echo "Processos Remotos: $remote"


