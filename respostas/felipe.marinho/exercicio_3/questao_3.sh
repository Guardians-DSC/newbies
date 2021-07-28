#!/bin/bash
# Felipe Vasconcelos Marinho - 116110223 - <felipe.marinho@ccc.ufcg.edu.br>

# Copiando o arquivo para o diretorio local.
cp ../../../questoes/exercicio_3/ls.log ./

# Limpeza da saída retirando infomações desnecessárias para o processamento.
PENTE_FINO=`cat ls.log | grep -E ".*(.*) = .* <.*>" | sed 's/(.*= / /g;s/\(<\|>\)//g;$d' | sed '$d' | awk '{print $1 " " $2 " " $NF}'`

echo "===== 3 CHAMADAS DE MAIOR DURAÇÃO ====="
# As 3 syscalls mais longas seguindo o critério de duração.
echo "$PENTE_FINO" | sort -r -k 3 | head -3

# Filtragem das syscalls com saída de erro.
PENTE_FINO_ERRO=`echo "$PENTE_FINO" | awk '{if ($2<0) print $0}'`
# Simples contagem de ocorrências.
QTD_ERROS=`echo "$PENTE_FINO_ERRO" | wc -l`

echo -e "\n===== CHAMADA COM MAIS OCORRÊNCIAS COM ERRO ====="
# Busca pela syscall mais frequente.
echo "$PENTE_FINO_ERRO" | awk -v qt_err=$QTD_ERROS '{ocorrencias[$1]++} END {for (ocorrencia in ocorrencias) {if (ocorrencias[ocorrencia]>max) max=ocorrencia};print max ", com " ocorrencias[max] " ocorrências do total de " qt_err " erros."}'

