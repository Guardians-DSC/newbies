#!/bin/sh

# Estou pegando as 3 informações, e comecei a 'tentar' tratar elas
awk '/model name/{print}' /proc/cpuinfo | tr ":" "\n" | awk 'NR==2 {print}'
lspci | awk '/Ethernet controller/{print}' | tr ":" "\n" | awk 'NR==3 {print}'
awk '/MemTotal/{print}' /proc/meminfo | tr ":" "\n" | awk 'NR==2 {print $1}'

# Não pude ir além nessa questão devido ao pouco tempo, pois está perto do deadline de submissão
# Encontrei dificuldades em associar a saída de um comando a uma variável, pois pelo que vi em todo canto
# nada estava funcionado. (EX.: "minha_var=${comando}" não está funcionando). O próximo passo depois disso
# seria salvar em arquivo

