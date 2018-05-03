#!/bin/bash
# @sbsr <... /guardians>
# hardware analyzer
# last update: 2018.1

<<DESCRICAO
    Script que captura informações do sis-
  tema e gera uma base de referência  com
  a descrição do modelo da CPU, da  placa
  de rede e total de memória disponível.
    Após a criação  do arquivo de base, a
  cada execução do programa, é  detectado
  se houve ou não alguma modificação  nas
  especificações da máquina.
DESCRICAO

# Recolhe informações sobre o hardware de
# uma determinada máquina, criando um ar-
# quivo base e um hash para que seja tes-
# tada a integridade desse componentes em
# outro momento.
function criador_arquivo_base() {
  model_name=$(cat /proc/cpuinfo | grep "model name" | head -n 1 | sed -e "s/.*:.//")
  ethernet_controller=$(lspci | grep "Ethernet controller" | sed -e "s/.*:.//")
  mem_total=$(cat /proc/meminfo | grep "MemTotal" | sed -e "s/.*:.//" | awk '$1=$1')

  echo -e "$model_name\n$ethernet_controller\n$mem_total" > .arquivo_base.txt
  md5sum .arquivo_base.txt > .hash.md5
}

if ! [ -e ".arquivo_base.txt" ]; then
  criador_arquivo_base
  echo "O arquivo base foi criado com sucesso!"
elif [[ `md5sum -c .hash.md5 2> /dev/null | grep "SUCESSO"` ]]; then
  echo "SEM ALTERACOES"
else
  echo -e "SISTEMA ALTERADO!!!"
fi
