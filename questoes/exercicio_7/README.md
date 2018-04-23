# Questao 7

Todo administrador de sistema precisa se basear em ferramentas para acompanhar o iventário de suas máquinas. Por exemplo, é importante garantir que não houve alterações no hardware das máquinas entre duas datas distintas.

Para isso, faça um programa que pegue informações do sistema e gere uma base de referência com a descrição do modelo da CPU (ver o campo `model name` do arquivo `/proc/cpuinfo`), da placa de rede (ver o campo `Ethernet controller` da saída do comando `lspci`) e total de memória disponível (ver o campo `MemTotal` do arquivo `/proc/meminfo`).

Por exemplo, o arquivo `base.txt` poderia ter como conteúdo:

```
Intel(R) Core(TM) i5-2400 CPU @ 3.10GHz
Intel Corporation 82579LM Gigabit Network Connection (rev 04)
8048104 kB
```

Após criado o arquivo de base, a cada execução do programa, você deve detectar se houve, ou não, alguma alteração na especificação do sistema.

Você é livre para procurar e colocar mais informações sobre o hardware do sistema e como essas alterações são notificadas.

Exemplos de execução:
---------------------

```
$ bash especificacao.sh
ARQUIVO BASE CRIADO
$ bash especificacao.sh
SEM ALTERACOES
$ bash especificacao.sh
SEM ALTERACOES
# digamos que aqui eu tire um pente de memoria
$ bash especificacao.sh
SISTEMA ALTERADO
```
