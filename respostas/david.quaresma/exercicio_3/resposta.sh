#!/bin/bash
# David Ferreira Quaresma - 116210041
# exercicio 3

# Copio o arquivo ls.log em /questoes para a pasta local, como Victor sugeriu para o exercicio 1.
cp ../../../questoes/exercicio_3/ls.log ./

# PRIMEIRA PARTE!

# Crio um arquivo contendo as syscalls sem erros.
sed '/ENOENT/d'  ls.log > ls_validos.txt

# filtro os valores de interesse em arquivos.
cat ls_validos.txt | cut -d"<" -f2 | cut -d">" -f1 > time.txt
cat ls_validos.txt | cut -d"(" -f1 > syscall.txt

# Uno os dois arquivos em outro concatenando linha por linha. 
paste time.txt syscall.txt > time_syscall.txt

# Ordeno do invertido guardando em outro arquivo.
sort -r time_syscall.txt > time_syscall_ordenado.txt

# Guardo as 3 chamadas de maior duração em um arquivo. as chamadas 
# das linhas 5, 6 e 6 são as de maior duração, porque o arquivo ls.log 
# quebrou nas linhas 91, 92 e 93. Estou assumindo isso como uma falha no arquivo.
# Também estou descartando as linhas 96 e 97 do mesmo arquivo. 
cat time_syscall_ordenado.txt | head -n 5 | tail -n 1 >> result.txt
cat time_syscall_ordenado.txt | head -n 6 | tail -n 1 >> result.txt
cat time_syscall_ordenado.txt | head -n 7 | tail -n 1 >> result.txt

echo 'As 3 chamadas de maior duração: '
count=1
while read line; do
    
    # faço um split da linha
    IFS=' ' read -ra splitado <<< "$line"
     
    # exibo a chamada e sua colocação.
    echo $countº ${splitado[0]} 
    
    # incremento 1 a count.
    count=$((count+1))

done < result.txt

# SEGUNDA PARTE!

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
rm ls_validos.txt
rm time.txt
rm syscall.txt
rm time_syscall.txt
rm time_syscall_ordenado.txt
rm result.txt
rm erros.txt
rm erros_splitados.txt






