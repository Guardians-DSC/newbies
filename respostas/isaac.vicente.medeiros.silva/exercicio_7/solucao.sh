#!/usr/bin/env bash
#
# Por Isaac Vicente em 2 Abr 2023

# Nossos arquivos: base e um arquivo temporário para comparação
arq_base="base.txt"
arq_temp="tmp.txt"

# Em `/proc/cpuinfo` filtramos pela string "model name" e pegamos o modelo da
# CPU, retirando os espaços no começo com `sed`
modelo_CPU=$(cat /proc/cpuinfo | grep "model name" | uniq | cut --delimiter=':' --field=2 | sed 's/^[[:space:]]*//')
# Analogamente, faz-se a mesma coisa aqui, tanto para o modelo da placa de rede
# quanto pro total de memória disponível
modelo_placa_rede=$(lspci | grep "Ethernet controller" | cut --delimiter=':' --field=3 | sed 's/^[[:space:]]*//')
mem_disponivel=$(cat /proc/meminfo | grep "MemTotal" | cut --delimiter=':' --field=2 | sed 's/^[[:space:]]*//')

# Se nosso arquivo base não existe, nós o criamos, colocando as informações
# relevantes de antes
if [[ ! -f "${arq_base}" ]]
then
    echo "${modelo_CPU}" > "${arq_base}"
    echo "${modelo_placa_rede}" >> "${arq_base}"
    echo "${mem_disponivel}" >> "${arq_base}"
else
    # Se o arquivo base já existe, criamos um arquivo temporário, que armazena
    # as informações coletadas anteriormente
    echo "${modelo_CPU}" > "${arq_temp}"
    echo "${modelo_placa_rede}" >> "${arq_temp}"
    echo "${mem_disponivel}" >> "${arq_temp}"

    # Se não haver diferença na comparação (`cmp`) entre os arquivo base e
    # temporário, então informamos ao usuário que não há alterações
    if cmp --silent "${arq_base}" "${arq_temp}"
    then
        echo "SEM ALTERACOES"
    else
        # Se não, o informamos que houve alteração
        echo "SISTEMA ALTERADO"
    fi

    # Apagamos o arquivo temporário
    rm "${arq_temp}"
fi
