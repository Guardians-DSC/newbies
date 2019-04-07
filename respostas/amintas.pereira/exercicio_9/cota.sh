#!/bin/bash

# Amintas Victor Ramos Pereira - 116110761

# Armazenando entrada
entrada=$1

echo
echo =========================================================
echo Relatório de utilização para o diretório /home/guardians:
echo =========================================================
echo
echo Diretórios que não excedem 10MB:
du -h $1 --threshold=-10MB | sort -rh
echo
echo Diretórios que excedem 10MB:
du -h $1 --threshold=10MB | sort -rh
echo
echo Diretórios que excedem 200MB:
du -h $1 --threshold=200MB | sort -rh
echo
echo Diretórios que excedem 10MB e não excedem 200MB:
(du -h . --threshold=-200MB && du -h . --threshold=10MB) | uniq -d
