#!/bin/bash
# Izaquiel Nascimento  
# Matrícula: 117111446 
# Email: izaquiel.nascimento@ccc.ufcg.edu.br
# Questão 7

# Busca informação do modelo da CPU
CPUModel="$(cat /proc/cpuinfo | # Lê arquivo que contéminformações da CPU
			 grep 'model name'| # Filtra as linhas que contêm 'model name'
			 cut -d: -f 2     | # Extrai a segunda coluna. Delimitador dos campos é ':'
			 sed -n '1p'      | # Seleciona apenas a primeira linha
			 sed 's/^ *//')"    # Remove os espaços do começo da linha

# Busca informação da placa de rede
PlacaRede="$(lspci                      | # Comando que lista dispositivos PCI
             grep 'Ethernet controller' | # Filtra a linha que contém 'Ethernet controller' (placa de rede)
             cut -d: -f 3               | # Extrai a terceira coluna que detalha a placa de rede
             sed 's/^ *//')"              # Remove espaços do começo da linha

# Busca informação do total de memória disponível
MemTotal="$(cat /proc/meminfo | # Lê arquivo que contém informações da memória
            grep 'MemTotal'   | # Filtra linha que contém 'MemTotal'
            cut -d: -f 2      | # Extrai a segunda coluna
            sed 's/^ *//')"     # Remove espaços do começo da linha

info=$CPUModel'\n'$PlacaRede'\n'$MemTotal
echo -e $info > info-temp.txt  # Guarda as informações em arquivo temporário

if [[ !(-e base.txt) ]]; then  # Testa se o arquivo base existe, senão existir
 	touch base.txt             # cria o arquivo,
 	echo -e $info  >> base.txt # escreve as informações no arquivo base e
 	echo ARQUIVO BASE CRIADO   # informa ao usuário
 # Se o arquivo existir, verifica se existe diferença entre o arquivo temporário (com as informações atuais)
 # e o arquivo base
 elif [[ $(diff base.txt info-temp.txt) ]]; then # Se a saída do comando diff conter algo, então
 	echo -e $info > base.txt    # atualiza o arquivo base com as novas informações
 	echo SISTEMA ALTERADO       # informa ao usuário
 else  # Se a saída do comando diff for vazia, então não houve alterações
 	echo SEM ALTERACOES
 fi

# remove aquivo temporário
 rm info-temp.txt