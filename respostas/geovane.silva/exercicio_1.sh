#!/bin/bash
# Geovane do Nascimento Silva - 116211149
# exercicio_1 - Script de reposta para as questoes dos guardians

# Copio o arquivo .txt.gz em /questoes para a pasta local e depois descompacto
cp /home/geovane/newbies/questoes/exercicio_1/jan_95.txt.gz ./
gunzip -k jan_95.txt.gz

# Salvo as requisicoes validas em um novo arquivo
cat jan_95.txt | grep ' - - ' > requisicoes_validas.txt

# Verifico a quantidade de requicoes locais e remotas
LOCAL=$(grep -c "local" requisicoes_validas.txt)
REMOTA=$(grep -c "remote" requisicoes_validas.txt)

# Mostro os resultados
echo "Resultado das requisições"
echo
echo "$LOCAL requisições locais foram realizadas."
echo "$REMOTA requisições remotas foram realizadas."
