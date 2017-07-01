#!/bin/bash
# David Ferreira Quaresma - 116210041
# exercicio 3

# Copio o arquivo ls.log em /questoes para a pasta local, como Victor sugeriu para o exercicio 1.
cp ../../../questoes/exercicio_3/ls.log ./

# Converto o .log em .txt
cat ls.log > ls.txt

# Com base nos padrões das linhas anteriores, o conteúdo dessas 3 linhas (91,92,93)
# Deveriam estar em uma única linha. Assim, considerarei isto como erro e vou elimina-las. 
sed -i '91d' ls.txt
sed -i '91d' ls.txt
sed -i '91d' ls.txt

# Excluo essas linhas também porque não possuem valores operáveis para a solução do exercicio.
sed -i '93d' ls.txt
sed -i '93d' ls.txt

# Crio um arquivo contendo as syscalls sem erros.
sed '/ENOENT/d'  ls.txt > ls_validos.txt

# Filtro os valores de interesse em arquivos.
cat ls_validos.txt | cut -d"<" -f2 | cut -d">" -f1 > time.txt
cat ls_validos.txt | cut -d"(" -f1 > syscall.txt

# Uno os dois arquivos em outro concatenando linha por linha. 
paste time.txt syscall.txt > time_syscall.txt

# Ordeno invertido guardando em outro arquivo.
sort -r time_syscall.txt > time_syscall_ordenado.txt

# Guardo em variáveis as maiores syscall.
primeira_maior_chamada=$(head -n 1 time_syscall_ordenado.txt | tail -n 1)
segunda_maior_chamada=$(head -n 2 time_syscall_ordenado.txt | tail -n 1)
terceira_maior_chamada=$(head -n 3 time_syscall_ordenado.txt | tail -n 1)

# Descarto o tempo de cada syscall.
echo $primeira_maior_chamada | cut -d" " -f2 > maiores_chamadas.txt
echo $segunda_maior_chamada | cut -d" " -f2 >> maiores_chamadas.txt
echo $terceira_maior_chamada | cut -d" " -f2 >> maiores_chamadas.txt

echo 'As 3 chamadas de maior duração: '
echo 1 - $(head -n 1 maiores_chamadas.txt | tail -n 1)
echo 2 - $(head -n 2 maiores_chamadas.txt | tail -n 1)
echo 3 - $(head -n 3 maiores_chamadas.txt | tail -n 1)

# Apago os arquivos criados.
rm ls.txt
rm ls_validos.txt
rm time.txt
rm syscall.txt
rm time_syscall.txt
rm time_syscall_ordenado.txt
rm maiores_chamadas.txt

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

# Exibo os dados obtidos.
echo 'Syscall com mais erros: ' $syscall
echo 'Número de chamadas: ' $max_call 

# Apago os arquivos criados.
rm erros.txt
rm erros_splitados.txt






