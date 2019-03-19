# Questão 9
Logs são arquivos que, em geral, registram as diversas operações e informações úteis  que foram executadas ou geradas por um sistema específico, como por exemplo mensagens de erro provenientes de uma aplicação, informação de quem solicitou acesso à uma coisa X, etc.

Por exemplo, é comum que um administrador de sistemas precise verificar logs a fim de extrair dados cruciais sobre um execução passada de um sistema: seja por motivos de segurança, correção de erros ou outros.

No diretório deste exercício, existem dois arquivos ```access.log``` e ```error.log``` compactados em um arquivo chamado ```log.tar.gz```. Eles correspodem aos registros de um serviço de impressão.

Cada linha do arquivo access.log tem o seguinte formato:

```[date] bytes command```

No qual ```date``` é a data e hora em que o comando ```command``` foi processado e ```bytes``` é o número de bytes que foram enviados para o serviço.

Cada linha do arquivo error.log tem o seguinte formato:

```date [job number] /fonte```

No qual ```date``` representa a data e hora de quando um certo erro ocorreu, ```job number``` é o número do job que gerou o erro e ```fonte``` é o nome da fonte que causou o erro na impressão.

## Problema 1:
Faça um programa que receba um ano por parâmetro e responda quantos arquivos foram impressos e quantos bytes foram transmitidos (no ano específico).

### Exemplo de execução (valores ilustrativos):
```
$ bash analyze_access.sh 2017
Quantidade de arquivos impressos em 2017: 102
Quantidade de bytes transimitidos em 2017: 304568 bytes
```

## Problema 2:
Faça um problema que leia o error.log e calcule qual o número médio de erros por ano.

### Exemplo de execução (valores ilustrativos):
```
$ bash analyze_errors.sh
Média de falhas por ano: 250
```
