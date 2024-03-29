#!/bin/bash

# Por Henrique Lemos

# Antes de mais nada, baixe o arquivo 'jan_95.txt.gz' disponível no diretório 'newbies/questoes/exercicio_1' no GitHub.

# Após a realização do download do arquivo 'jan_95.txt.gz' o primeiro passo é possuir este
# arquivo no mesmo diretório de execução do nosso script. Para isso utilizamos o comando 'cp' para
# realizar uma cópia do arquivo no diretório 'Downloads' para o mesmo diretório de execução do
# script './' onde '.' refere-se ao diretório que está atualmente (o mesmo que está sendo
# executado o script).

cp ~/Downloads/jan_95.txt.gz ./

# Com o nosso arquivo em mãos (no caso, no mesmo diretório) vamos descompactar o arquivo. Portanto,
# utilizamos o comando 'gunzip', onde o prefixo 'un' refere-se a uma negação no inglês, realizando
# o contrário de compactar (que seria o comando 'gzip' para compactação no formato '.gz'). Sua
# descompactação será realizada no mesmo diretório de execução do script.

gunzip jan_95.txt.gz


# Antes de avançarmos, primeiro explicarei alguns comandos e recurso que serão utilizados na linha de comando a seguir: 
# 
# - Um recurso bastante utilizado na criação de Bash Script's, conhecido como "pipe", nada mais é do que
# uma forma de construção de linhas de comando no shell tornando-os mais práticos e mais fáceis de serem
# escritos; Uma comunicação entre processos, de forma simplória, um encadeamento de processos, conhecido
# pela simbologia "|".
#
# - O comando 'cat', uma derivação da palavra 'concatenate' (concatenação, em português), em que permite
# que você crie, una, e exiba arquivos no formato padrão de tela ou em outro arquivo, entre outras coisas.
# Sua sintaxe é: cat [OPÇÃO] [ARQUIVO].
#
# - O comando 'grep', procura por padrões especificados pelo usuário dentro de arquivos de texto. Em
# outras palavras, você pode pesquisar por palavras ou padrões e a(s) linha(s) que serão exibidas. Sua
# sintaxe é: grep [OPÇÂO] padrão [ARQUIVO], onde 'padrão' é o que está sendo pesquisado.


# Voltando à resolução do nosso script, utilizaremos os comandos citados anteriormente junto ao pipe
# para realizar um descarte das linhas, no arquivo 'jan_95.txt', que contêm apenas um traço ou
# nenhum, depois do termo 'remote' e/ou 'local'. Para isso, primeiro usamos o comando 'cat' para
# exibir o nosso arquivo 'jan_95.txt'; Junto ao pipe (mostrando ao interpretador do comando que
# junto a operação anterior, no caso o 'cat', execute a operação seguinte nele) realizamos uma
# procura por meio do comando 'grep' de todas as linhas que possuem os termos 'local - -' e
# 'remote - -'; Após esta seleção o '>' (stdout - standard output - de sobrescrita de uma mensagem,
# no lado esquerdo do sinal, para ser escrito no arquivo, do lado direito do sinal) vai escrever no
# documento 'requisicoes.txt' todos os 'local' e 'remote' não removíveis.

cat jan_95.txt | grep '[local - -][remote - -]' > requisicoes.txt


# Após a nossa filtragem do documento 'jan_95.txt', para que o arquivo 'requisicoes.txt' possua as
# informações úteis para nós, em seguida vamos processar quantas requisições locais e remotas
# foram feitas, retornando essas informações. Para isso, em primeiro lugar vamos definir duas
# variáveis reqLocal e reqRemoto, que estará alocado o valor da nossa consulta do número de
# requisições de cada. Para isso, vamos antes para algumas definições rápidas:
#
# - Em shell não existem tipos de variáveis, aqui tudo é string. A ordem para declarar uma variável é:
# <nomeDaVariavel>=<valor>. O nome da variável não pode conter nunhum caractere especial, começar
# por números e ter espaços; Após a definição de um BOM nome, deve inserir um sinal de '=' (sem espaço
# depois do nome) e o valor/conteúdo.
#
# - Aproveitando a definição do comando 'grep' (citado anteriormente), vou aproveitar para fazer umas
# complementações. O comando possui várias opcões do comando que aperfeiçoam a sua habilidade. Na
# execução desta consulta usaremos específicamente duas, a 'w' e a 'c' (Para conhecer mais opções digite 
# 'man grep' no terminal e verifique no manual todas as opções disponíveis no 'grep').
#
#	* -w: seleciona as linhas que contêm correspondências.
#	* -c: irá mostrar o número de linhas que combinam com o padrão pesquisado.


# Agora sim, vamos a resolução da linha de comando. O conteúdo alocado em cada uma das variáveis será
# praticamente a mesma consulta, o que as diferencia é o termo (no caso uma é "local" e a outra é
# "remote") usado para a procura. Então usamos o comando 'grep' com as opções 'w' e 'c' consultando
# no arquivo 'requisicoes.txt'.

reqLocal=$(grep -wc local requisicoes.txt)
reqRemoto=$(grep -wc remote requisicoes.txt) 

# Quase finalizando, vamos agora retornar os números de requisições de 'local' e 'remote' usando o
# comando 'echo'.

echo 'Local:' $reqLocal
echo 'Remoto:' $reqRemoto

# Por fim, e não menos importante, para que não fique o acúmulo de "lixo" digital no seu computador,
# removemos com o camando 'rm' os arquivos 'jan_95.txt' (o arquivo baixado descompactado) e o arquivo
# 'requisicoes.txt' (que criamos no meio do processo).

rm ./jan_95.txt ./requisicoes.txt
