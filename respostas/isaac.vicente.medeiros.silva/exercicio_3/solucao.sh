#!/usr/bin/env bash
#
# Por Isaac Vicente em 29 Mar 2023

arquivo_temporario="tmp.txt"

# Vamos explicar cada "passada de pipe":
# 1) Primeiro, ordenamos alfabeticamente o arquivo `ls.log`
# 2) Com o `awk`, printamos a última coluna (separada por espaço) de cada linha e, depois, a linha em si
# 3) Ordenamos numericamente a saída do último comando, pois sabemos que a primeira coluna, agora, tem números.
#    Por exemplo: <0.032> virá primeiro do que <0.029>, pois estamos ordenando em ordem reversa
#    (Obs.: <0.032>, na questão, é o tempo gasto em segundos)
# 4) Damos match nas linhas que apenas começam com `<` (há um padrão no log)
# 5) Com `head`, pegamos as 3 primeiras linhas
# 6) Com `cut`, passamos um delimitador (um espaço) e printamos apenas a segunda coluna em diante
# 7) Nossa saída agora será do tipo: nome_de_função(parametros) ... etc.
#    Como sabemos que o nome da função é composta apenas por letras, damos match nas primeiras letras de cada linha
#    (o nome de cada função). No fim, passamos isso pro nosso arquivo temporário.
sort ls.log \
| awk '{print $NF, $0}' \
| sort --reverse --numeric-sort \
| grep --extended-regexp '^<' \
| head -3 \
| cut --delimiter=' ' --field=2- \
| grep --extended-regexp --only-matching '^[a-z]+' > $arquivo_temporario

syscalls_maior_duracao=$(cat ${arquivo_temporario})

echo "As 3 chamadas de maior duração foram:"
echo "${syscalls_maior_duracao}"

# De novo, vamos explicar a ordem dos nossos pipes:
# 1) Ordeno alfabeticamente o arquivo `ls.log`
# 2) Com `grep`, dou match nas linhas em que as saídas tem número menores que zero
#    (um sinal de menos seguidos por dígitos)
# 3) Com `grep`, dou match apenas no nome das funções, pois sei que cada linha começa com:
#    nome_da_função(parametros) ... etc. Com a opção `-o` de `grep` printo apenas esses matches,
#    e não a linha que dá o match.
# 4) Agora, teremos vários nomes de funções repetidas. Com `uniq`, contamos o número de repetições
#    e a string repetida.
# 5) Nossa saída agora está um pouco estranha, com espaços no começo. Com `sed` podemos substituir esses
#    espaços no começo por nada.
# 6) Finalmente, pegamos o comando que mais se repete e colocamos essa string no nosso arquivo temporário.
sort ls.log \
| grep --perl-regexp '= -\d+ ' \
| grep --extended-regexp --only-matching '^[a-z]+' \
| uniq --count \
| sed --expression='s/^[[:space:]]*//' \
| head -1 > $arquivo_temporario

syscall_mais_erros=$(cat ${arquivo_temporario})

echo "-------------------------------------------------------------------"
echo "A syscall com mais erros precedida com o número de chamadas feitas:"
echo "${syscall_mais_erros}"

rm "${arquivo_temporario}"
