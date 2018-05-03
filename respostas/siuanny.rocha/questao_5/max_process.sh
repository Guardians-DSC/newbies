#!/bin/bash
# @sbsr <... /guardians>
# max process
# last update: 2018.1

<<DESCRICAO
    Filtra as conexões  UDP e TCP, exi-
  bindo os  dois processos que mais fi-
  zeram conexões desses tipos.
    Exibe também as informações como  a
  quantidade total de conexões  TCP que
  estão em estado LISTEN,  ESTABLISHED,
  SYN_SENT e CLOSE_WAIT.
DESCRICAO

# Procura e exibe o processo que possui
# maior quantidade de conexões.
function busca_processo_maximo() {
  node=$1
  rodando=`lsof -i $node | awk 'NR > 1 {print $1}'`
  for processo in `echo $rodando | sort -u`; do
    quantidade=`echo $rodando | grep -wc $processo`
    if [[ $quantidade -gt $maximo ]]; then
      processo_maximo=$processo; maximo=$quantidade
    fi
  done

  if [[ -n $processo_maximo ]]; then
    echo "* $processo_maximo"
  else
    echo "- Não há processos $node."
  fi
}

echo "====== TOP ====="
echo "TOP conexões UDP:"
busca_processo_maximo "UDP"
echo "TOP conexões TCP:"
busca_processo_maximo "TCP"

echo -e "\n====== TCP ====="
echo "LISTEN: $(lsof -iTCP -sTCP:LISTEN | wc -l)"
echo "ESTABLISHED: $(lsof -iTCP -sTCP:ESTABLISHED | wc -l)"
echo "SYN_SENT: $(lsof -iTCP -sTCP:SYN_SENT | wc -l)"
echo "CLOSE_WAIT: $(lsof -iTCP -sTCP:CLOSE_WAIT | wc -l)"
