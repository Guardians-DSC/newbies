# Questão 1 - Seleção Guardians
# Emanuel Joivo Bezerra Martins - 116110919
# Deve-se executar o script no mesmo diretório do arquivo compactado.

# Descompactando arquivo.
gzip -d jan_95.txt.gz

# Descartando linhas indesejadas e colocando em novo arquivo.
egrep -E '(local|remote) - -' jan_95.txt > file_filtered.txt

# Contagem de ocorrências de cada tipo de requisição.
LOCAL_REQUISITIONS=$(egrep -E '^local' file_filtered.txt | wc -l)
REMOTE_REQUISITIONS=$(egrep -E '^remote' file_filtered.txt | wc -l)

echo "Processamento das requisições."
echo ""
echo "Quantidade de requisições locais: $LOCAL_REQUISITIONS"
echo "Quantidade de requisições remotas: $REMOTE_REQUISITIONS"
