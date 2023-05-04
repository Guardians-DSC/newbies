#!/usr/bin/env bash
#
# Por Isaac Vicente em 4 Mai 2023

# Primeiro argumento fornecido, se fornecido
diretorio=$1

if [[ -z "${diretorio}" ]]
then
    # Se a variável ´diretorio´ for vazia (não há primeiro argumento), então
    # é informado ao usuário como usar o script
    echo "Uso: bash solucao.sh <diretório>"
    # Sai do programa com saída 1 (erro)
    exit 1
fi

# Com o máximo de 2 diretórios (`--max-depth`), o `du` encontra todos os diretórios menores que 10MB (com `threshold`) numa forma
# humanamente legível. Em seguida, passo isso pro `sort`, o qual ordena pela primeira coluna (a coluna dos tamanhos dos
# diretórios) com `--key=1` numa forma numérica humanamente (de modo a diferenciar GB, MB, kB, etc) e inverto a ordenação
# (para ser decrescente) e direciono a um arquivo.
du --max-depth=2 --threshold=-10M --human-readable "${diretorio}" | sort --key=1 --human-numeric-sort --reverse > dirs_menos_de_10MB.txt

# A mesma coisa do que foi feito anteriormente, porém com diretórios maiores que 10MB.
du --max-depth=2 --threshold=+10M --human-readable "${diretorio}" | sort --key=1 --human-numeric-sort --reverse > dirs_mais_de_10MB.txt

# A mesma coisa do que foi feito anteriormente, porém com diretórios maiores que 200MB.
du --max-depth=2 --threshold=+200M --human-readable "${diretorio}" | sort --key=1 --human-numeric-sort --reverse > dirs_mais_de_200MB.txt

# A mesma coisa do que foi feito anteriormente, porém com diretórios menores que 200MB e sem inverter a ordenação.
du --max-depth=2 --threshold=-200M --human-readable "${diretorio}" | sort --key=1 --human-numeric-sort > dirs_menos_de_200MB.txt

# https://stackoverflow.com/questions/373810/shell-command-to-find-lines-common-in-two-files#comment51087686_373819
# Com `grep`, fixamos as linhas do arquivo `dirs_mais_de_10MB.txt` e fazemos delas um regex (expressão regular) a dar
# "match" no segundo arquivo (`dirs_menos_de_200MB.txt`). Ou seja, na prática, damos match em todas as linhas em
# comum com os dois arquivos, pegando os diretórios maiores que 10MB e menores que 200MB!
# Após isso, ordenamos como fizemos nos comandos anteriores (agora com as opções em formas reduzidas) e passamos
# esse output inversamente ordenado pro nosso arquivo temporário.
grep --fixed-strings --line-regexp --file=<(cat dirs_mais_de_10MB.txt) <(cat dirs_menos_de_200MB.txt) | sort -k1 -h -r > dirs_mais_de_10MB_e_menos_de_200M.txt

echo "========================================================="
echo "Relatório de utilização para o diretório ${diretorio}:"
echo "========================================================="
echo

echo "Diretórios que não excedem 10MB:"
cat dirs_menos_de_10MB.txt
echo

echo "Diretórios que excedem 10MB:"
cat dirs_mais_de_10MB.txt
echo

echo "Diretórios que excedem 200MB:"
cat dirs_mais_de_200MB.txt
echo

echo "Diretórios que excedem 10MB e não excedem 200MB:"
cat dirs_mais_de_10MB_e_menos_de_200M.txt
echo

# Remove os arquivos temporários
rm dirs_menos_de_10MB.txt
rm dirs_mais_de_10MB.txt
rm dirs_mais_de_200MB.txt
rm dirs_menos_de_200MB.txt
rm dirs_mais_de_10MB_e_menos_de_200M.txt
