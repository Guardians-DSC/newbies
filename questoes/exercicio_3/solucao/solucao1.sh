#!/bin/bash


cp ../ls.log ./

	#	Compreendendo o comando cut abaixo:
	# O comando cut serve para "cortar" seções de cada linha de um arquivo, produzindo uma saída
	#	cut [opções] ... [arquivo]
	# a saída produzida pelo cut dependerá das opções selecionadas;
	# é obrigatório que haja a escolha de opção entre -c, -b e -f, sendo -c para caracter (ou coluna), -f para "field" e -b para byte;
	# Em cada uma dessas opções pode-se indicar um intervalo, ou não, sendo o default o intervalo de 0 a 1
	# 	Por exemplo, quando digitamos -b1,2,3 queremos que a saída sejam os bytes 1, 2 e 3
	#	Já quando digitamos -b1-3,5-7 queremos que a saída sejam os bytes 1 a 3 e 5 a 7
	# "field" são campos de conjuntos de caracteres delimitados por um caracter, que é definido por -d, seguido do caracter delimitador
	# 
	#	Traduzindo o comando cut -f2 -d'<' ls.log, primeiro se entende que o delimitador é "<"
	#	A partir do delimitador, surgem dois campos de caracteres: todos aqueles antecedentes ao delimitador (f1)
	#	e todos aqueles posteriores ao delimitador (f2). Caso tivesse mais ocorrências do delimitador na linha haveria mais campos.
	#	No nosse exemplo temos ... <tempo> ...	
	#		sendo o delimitador "<", teremos os campos ... e tempo> ...
	#	Caso fosse ... <tempo<a<b>> ...
	#		os campos seriam ..., tempo, a, b>> ...

	#	Vindo à explicação do comando no caso da resolução: 
	#	Exibiremos o arquivo ls.log (cat ls.log) sendo feito corte para exibir o campo após "<" (cut -f2 -d'<') e anterior a ">" 
       	#	(cut -f1 -d'>') e direcionaremos essa filtragem ao arquivo tempo.txt, já que o tempo gasto por uma syscall nesse arquivo
	#	é encontrada entre os sinais <>.
		

cat ls.log | cut -f2 -d'<' | cut -f1 -d'>' > tempo.txt 
cat ls.log | cut -f1 -d"<" | rev | cut -f1 -d"=" | rev > saida.txt

	# O processo para recolher os tipos de saída já é um pouco mais complexo
	# Ao observar as linhas do arquivo ls.log, a primeira solução que ocorre em mente é fazer um processo parecido ao do tempo, que é
	# identificar os caracteres dentre os quais o número que indica o tempo se encontra. No caso, seria somente fazer um cut de forma
	# que resultasse no campo que está entre o sinal "=" e "<". A primeira tentativa seria de uma saída produzida por
	#	cat ls.log | cut -f2 -d'=' | cut -f1 -d'<'
	# Todavia, não teríamos a saída que desejamos pois há outras ocorrências do caracter = antes de se representar o tipo de saída.
	# Ou seja, o f2 não seria o mesmo em todas as linhas.
	# Percebemos que queremos o último campo delimitado por "="
	# O que foi feito, então?
	# Primeiro, o comando cut -f1 -d"<" vai resultar no campo anterior à representação de tempo <>
	# Segundo, se executa o comando rev, que vai inverter a ordem dos caracteres
	# 	Essa inversão dos caracteres irá resultar em saídas como (...) [tipo de saída] = (...)
	# Assim, se executa o cut para separar o primeiro campo delimitado por "=" (cut -f1 -d"="), que resultará na saída
	#	(...) [tipo de saída]
	# Por último, invertemos novamente a saída para ela não continuar invertida.
	#
	# Esse procedimento todo foi feito para se conseguir o último campo existente numa linha. Ou seja,
	# o último campo é o equivalente ao primeiro da inversão da linha

	# Para filtrarmos o nome da chamada, executaremos:
cat ls.log | cut -f1 -d"(" > syscall.txt
	# Pois queremos somente o nome sem os parâmetros entre parênteses


	# A atividade consiste em ordenar os tempos das chamadas para se saber quais são
	# as 3 chamadas de maior duração. Temos 3 arquivos de informações de chamadas, e a única coisa no momento que
	# ainda relacionam essas informações entre si de é a ordem delas. Se ordenarmos o arquivo tempo.txt para saber quais
	# são os maiores tempos, não saberemos de quais chamadas são referentes. 
	# Sendo assim, usaremos o comando paste.
	# Esse comando concatena arquivos "verticalmente". Ele concatena o conteúdo de linhas correspondentes de vários arquivos,
	# delimitando esse conteúdo por tab. Então, se executarmos
	#	paste tempo.txt saida.txt syscall.txt > chamadas.txt
	# teremos um arquivo com três colunas de informação: tempo, tipo de saída e syscall

paste tempo.txt syscall.txt | sort -rn > tempo_ordenado.txt
saida1=`head -n 3 tempo_ordenado.txt`
echo "3 chamadas com maior duração:"
echo "$saida1"
echo "-----------------------"


#paste syscall.txt saida.txt | grep "\-" > erros.txt
grep "\-" ls.log | cut -f1 -d"(" > nomes_erros.txt

rm tempo.txt syscall.txt saida.txt ls.log tempo_ordenado.txt

erros=0
chamada=""

for nome in $(cat nomes_erros.txt)
do
	if [[ $(grep -wc $nome nomes_erros.txt) > $erros ]]; then
		erros=$(grep -wc $nome nomes_erros.txt)
		chamada=$nome
	fi
	
done 

echo "Chamada com mais erros: $chamada"
echo "Número de chamadas com erro: $erros"

rm nomes_erros.txt

exit 0
