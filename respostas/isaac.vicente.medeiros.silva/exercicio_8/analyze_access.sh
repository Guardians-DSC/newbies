#!/usr/bin/env bash
#
# Por Isaac Vicente em 3 Abr 2023

# Checamos se o arquivo `log.tar.gz` existe, e então extraímos seu conteúdo
# (Obs.: é necessário ter esse arquivo)
if [[ -f log.tar.gz ]]
then
    tar -xf log.tar.gz
else
    # Se ele não existe, alertamos o usuário
    echo "Erro: arquivo 'log.tar.gz' não existe no diretório corrente"
    exit 1
fi

# O ano fornecido é o primeiro argumento passado
ano=$1

# Se a variável `ano` estiver vazia, então não foi passado nenhum argumento
if [[ -z "${ano}" ]]
then
    echo "Uso: bash analyze.access.sh <ano>"
    exit 1
fi

# Após termos todo o conteúdo de `access.log`, filtramos todas as linhas que contêm o ano que procuramos
# (lembre-se que nesse arquivo o ano é precedido pelo mês, uma barra, e procedido por uma hora, dois pontos).
# Em seguida, cortamos quaisquer linhas repetidas (com exatamente as mesmas coisas) e finalizamos
# contando quantas linhas (arquivos) temos.
qntd_arquivos=$(cat access.log | grep "/${ano}:" | uniq | wc -l)
# Aqui, até o comando `uniq` temos a mesma coisa que vimos anteriormente: a partir daí as coisas ficam interessantes.
# Com `cut` pegamos a coluna da quantidade de bytes que um comando de cada linha possui. Isso nos gera uma única
# coluna de vários números, que são nossos bytes. Com `paste` e sua opção `--serial` (ou `-s`), fazemos com que toda essa coluna
# seja representada por uma linha só, e, com a opção `--delimiters` intercalamos um sinal de mais entre cada número.
# Por fim, como teremos uma soma de vários números, passamos isso para nossa calculadora `bc`, que nos dará o resultado
# dessa soma.
qntd_bytes=$(cat access.log | grep "/${ano}:" | uniq | cut --delimiter=' ' --field=2 | paste --serial --delimiters='+' | bc)

echo "Quantidade de arquivos impressos em ${ano}: ${qntd_arquivos}"
echo "Quantidade de bytes transmitidos em ${ano}: ${qntd_bytes} bytes"

