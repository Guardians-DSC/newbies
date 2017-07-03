#!/bin/sh
# Bruno Rodrigo Pinheiro de Meneses - 116211401
# exercicio_1 - Script de reposta para as questoes dos guardians

# Copio o arquivo .txt.gz em /questoes para a pasta local e depois descompacto
cp /home/brunorpm/newbies/questoes/exercicio_1/jan_95.txt.gz ./

gunzip jan_95.txt.gz

# Filtro as requisicoes validas e salvo em um novo arquivo txt
cat jan_95.txt | grep " - - " > requisicoes_validas.txt

# Verifico a quantidade de requisicoes locais e remotas
requisicoes_locais=$(grep -c "local" requisicoes_validas.txt)
requisicoes_remotas=$(grep -c "remote" requisicoes_validas.txt)

# Resultado das requisicoes locais e remotas
echo "Requisições locais: $requisicoes_locais"
echo "Requisições remotas: $requisicoes_remotas "
