 #!/bin/bash

gzip -d jan_95.txt.gz # Descompacta o arquivo

sed '/ - - /!d' jan_95.txt > validreq.txt # Cria um novo arquivo txt com as linhas corretas

qtremote=`grep -wc remote validreq.txt` # Cria uma variavel para armazenar os processos locais
qtlocal=`grep -wc local validreq.txt` # Cria uma variavel para armazenar os processos remotos

# Imprime a quantidade de processos locais e remotos respectivamente
echo "Quantidade de processos locais: $qtlocal"
echo "Quantidade de processos remotos: $qtremote"
