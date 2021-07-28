#!/bin/bash

ANO=$1
SOMA=0
CONT=0

while read LINHA;
do
BYTES="$(cut -d' ' -f2 <<<"$LINHA")"
ANO_AUXILIAR=${LINHA:8:4}
STATUS="$(cut -d' ' -f3 <<<"$LINHA")"

if [ $ANO_AUXILIAR = $ANO -a $STATUS = "Send-Document" ]
then
	CONT=$(($CONT + 1))
	SOMA=$(($SOMA + $BYTES))
fi

done < access.log


echo "Quantidade de arquivos impressos em $ANO: $CONT"
echo "Quantidade de bytes transmitidos em $ANO: $SOMA bytes"


