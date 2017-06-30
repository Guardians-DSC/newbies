#!/bin/bash
# David Ferreira Quaresma - 116210041
# exercicio 3

# Copio o arquivo ls.log em /questoes para a pasta local, como Victor sugeriu para o exercicio 1.
cp ../../../questoes/exercicio_3/ls.log ./

# Crio um arquivo contendo as syscalls com erros.
sed '/ENOENT/!d'  ls.log > erros.txt

# Leio cada linha desse arquivo.
while read line; do
    
    # Faço um split de cada linha.
    IFS='(' read -ra splitado <<< "$line"
    # Salvo apenas o primeiro termo em um outro arquivo.
    echo ${splitado[0]} >> erros_splitados.txt

done < erros.txt

# Inicio duas variáveis para guardar a syscall com mais erros e seu numero de chamadas.
max_call=0
syscall=''

# Leio cada termo do novo arquivo criado. 
while read line; do

    # verifico se o numero de repetições do termo é maior que max_call.
    if [[ $(grep -wc $line erros_splitados.txt) > $max_call ]]; then
        # atualizo os valores quando necessário.
        max_call=$(grep -wc $line erros_splitados.txt)
        syscall=$line
    fi

done < erros_splitados.txt

# exibo os dados obtidos.
echo 'Syscall com mair erros: ' $syscall
echo 'Numero de chamadas: ' $count 

# apago os arquivos criados.
rm erros.txt
rm erros_splitados.txt








