#!/bin/bash

# Amintas Victor Ramos Pereira - 116110761

# Descompactando arquivo tar.gz
tar -vzxf log.tar.gz

# Armazenando entrada
entrada=$1

arquivos=0
bytes=0

# Lendo linha a linha
while read linha; do
    ano=$(echo $linha | cut -c9-12) # Pegando o ano
    if [[ "$entrada" == "$ano" ]]; then 
        arquivos=$(($arquivos+1)) 
        bytesLinha=$(echo $linha | cut -d" " -f2) # Pegando os bytes
        bytes=$(($bytes+$bytesLinha))
    fi
done < access.log # Arquivo acessado

echo "Quantidade de arquivos impressos em ${entrada}: ${arquivos}"
echo "Quantidade de bytes transimitidos em ${entrada}: ${bytes} bytes"
