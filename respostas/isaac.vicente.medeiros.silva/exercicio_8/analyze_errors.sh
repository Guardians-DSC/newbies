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

# Pegamos a quantidade total de erros apenas contando o número de linhas que o
# arquivo `error.log` tem.
qntd_erros=$(cat error.log | wc -l)
# Após termos o conteúdo de `error.log`, demos match e exibimos esse match nas linhas que têm o formato de data,
# por exemplo, 20/Set/2017. Com isso teremos várias linhas com as datas de cada erro. Como sabemos que o ano é formado
# por 4 dígitos em cada data, printamos esse match mais uma vez, obtendo apenas o ano de cada erro. Como, evidentemente,
# teremos vários anos repetidos, cortamos todos os repetidos, tendo apenas os únicos. Por fim, contamos quantos anos
# temos ao final.
qntd_anos=$(cat error.log | grep --perl-regexp --only-matching '^\d{2}/\w{3}/\d{4}' | grep -Po '\d{4}' | uniq | wc -l)

media_falhas_ano=$(( qntd_erros / qntd_anos ))

echo "Média de falhas por ano: ${media_falhas_ano}"
