#!/bin/bash

gunzip -d ./jan_95.txt.gz

req_locais=`cat jan_95.txt | grep -e "- -" | grep -e "local" -c`
req_remotas=`cat jan_95.txt | grep -e "- -" | grep -e "remote" -c`

echo "Requisições locais: $req_locais"
echo "Requisições remotas: $req_remotas"