#!/bin/usr/env bash
#
# Por Isaac Vicente em 1 Abr 2023

arq_temporario="tmp.txt"

# Adicionamos todas as linhas que dão match com o termo "TCP" em nosso arquivo
# temporário
lsof | grep "TCP" > "${arq_temporario}"
# Após receber de `cat` as linhas que contêm "TCP", pegamos a primeira coluna (nome do processo/comando)
# com `awk` e, como há várias linhas com o mesmo processo/comando, filtramos as repetições junto com o número
# de repetições. Logo em seguida, tiramos os espaços desnecessários que `uniq` põem com o comando `sed`, passando
# isso para o `head`, que pega o processo/comando mais requisitado. Finalmente, pegamos a segunda coluna, que é
# o nome do processo/comando (a primeira coluna é o número de repetições).
maior_em_TCP=$(cat ${arq_temporario} | awk '{print $1}' | uniq --count | sed 's/^[[:space:]]*//' | head -1 | awk '{print $2}')
# Analogamente, temos o mesmo procedimento anterior, trocando "TCP" por "UDP"
maior_em_UDP=$(lsof | grep "UDP" | awk '{print $1}' | uniq --count | sed 's/^[[:space:]]*//' | head -1 | awk '{print $2}')

# Em cada variável a seguir exibimos o conteúdo do nosso arquivo temporário
# e damos match nas linhas que contêm os termos LISTEN, ESTABLISHED, SYN_SENT ou CLOSE_WAIT
# e, ao final, contamos o número de linhas.
num_LISTEN=$(cat ${arq_temporario} | grep "LISTEN" | wc -l)
num_ESTABLISHED=$(cat ${arq_temporario} | grep "ESTABLISHED" | wc -l)
num_SYN_SENT=$(cat ${arq_temporario} | grep "SYN_SENT" | wc -l)
num_CLOSE_WAIT=$(cat ${arq_temporario} | grep "CLOSE_WAIT" | wc -l)

# Removemos nosso arquivo temporário
rm "${arq_temporario}"

echo "====== TOP ======"
echo "TOP conexões UDP:"
echo "* ${maior_em_UDP}"
echo "TOP conexões TCP:"
echo "* ${maior_em_TCP}"

echo " "
echo "====== TCP ======"
echo " "
echo "LISTEN: ${num_LISTEN}"
echo "ESTABLISHED: ${num_ESTABLISHED}"
echo "SYN_SENT: ${num_SYN_SENT}"
echo "CLOSE_WAIT: ${num_CLOSE_WAIT}"
