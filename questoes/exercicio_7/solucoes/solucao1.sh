#!/bin/bash

#	Para não adicionar especificações manualmente, introduzirei uma ferramenta de informaçõo
#	sobre o computador por linha de comando. Essa ferramenta é o inxi, para computadores com linux.
#	A instalação dessa ferramenta des=ve ser feita por 
#		sudo apt install inxi
#	Dentre várias opções de execução, a que executaremos é inxi -Fm.
#	A opção -F é para "full output" e -m é para "Memory (RAM) data"
#	Assim, teremos informações de hardware tais como CPU, memória, drivers, bateria etc.

# Para a criação do arquivo base, usaremos esse comando

#	Vale mencionar que para computadores com Windows, é possível ver essas informações de hardware pelo comando systeminfo

# Verificando se existe um arquivo base
verificacao=$(ls | grep -c "base.txt")

if [ $verificacao -eq 0 ];
then
	inxi -Fm | grep -v "Info" | grep -v "used" > base.txt # Estou retirando a sessão info pois ela mostra detalhes acerca de quantos processos estão ocorrendo
								# Também retiro as linhas que têm a palavra "used" pois a própria criação desse arquivo base já
								# altera o dado "used"
	echo "ARQUIVO BASE CRIADO"
else
	inxi -Fm | grep -v "Info" | grep -v "used" > atual.txt # Criação de um arquivo para ser comparado com a base
	
	if [[ $(diff base.txt atual.txt) ]];
	       # Aqui introduzimos o comando diff	
	       # diff vem de "difference" e ele é usado para a comparação
	       # entre arquivos linha por linha
	       # No caso de haver alguma diferença, o comando lançará uma saída,
	       # caso os dois arquivos têm o mesmo conteúdo, a saída é nada
	       # Nesse if acina, caso tenha alguma diferença, será entendido com "true"
	       # e caso não hava saída, será entendido como "false"
	then
		echo "SISTEMA ALTERADO"
	else
		echo "SEM ALTERACAO"
	fi
fi	

