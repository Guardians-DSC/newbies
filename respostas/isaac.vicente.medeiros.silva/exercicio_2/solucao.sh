#/usr/bin/env bash

read -p "Número de observações: " n_obs
read -p "Intervalo de tempo (em seg): " tempo
read -p "Começo de um nome de um usuário: " user

maior_cpu=
menor_cpu=
maior_mem=
menor_mem=

for ((i=0; i < $n_obs; i++))
do
    # Filtramos as linhas de `ps aux` pelo nome do usuário, printamos o 3° campo
    # (o de %MEM), ordenamos numericamente com `sort -n` e, ao final, pegamos
    # a primeira linha (ou seja, a menor, pois está em ordem)
    menor_cpu=$(ps aux | grep -E "^$user" | awk '{print $3}' | sort -n | head -1)
    menor_mem=$(ps aux | grep -E "^$user" | awk '{print $4}' | sort -n | head -1)

    # Repetimos o mesmo raciocínio anterior, mas em vez de pegarmos o menor valor
    # (o primeiro deles), pegamos o maior (o último deles)
    maior_cpu=$(ps aux | grep -E "^$user" | awk '{print $3}' | sort -n | tail -1)
    maior_mem=$(ps aux | grep -E "^$user" | awk '{print $4}' | sort -n | tail -1)

    # Espera `tempo` segundos
    sleep $tempo
done

echo "Maior valor de %CPU: ${maior_cpu}"
echo "Menor valor de %CPU: ${menor_cpu}"

echo "Maior valor de %MEM: ${maior_mem}"
echo "Menor valor de %MEM: ${menor_mem}"
