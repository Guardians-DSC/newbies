#!/bin/bash

# Amintas Victor Ramos Pereira - 116110761

# Descompactando tar.gz
tar -vzxf log.tar.gz

total=0
quant=0
ano=0

# Lenod linha a linha
while read linha; do
   anoLinha=$(echo $linha | cut -c8-11) # Pegando o ano
   if [[ "$ano" != "$anoLinha" ]]; then
       quant=$(($quant+1)) # Contando os anos
       ano=$anoLinha
   fi
   jobs=$(echo $linha | cut -d" " -f3 | cut -d"]" -f1) # Pegando os jobs
   total=$(($total+$jobs)) # Contando os jobs
done < error.log

media=$(($total/$quant))

echo "Média de falhas por ano: ${media}"
