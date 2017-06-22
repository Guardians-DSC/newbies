# Questao 1

1. Descompacte o arquivo jan_95.txt.gz.

2. Considere que o formato do arquivo é como se segue: ```ORIGEM - - DATA “AÇÃO” STATUS TAMANHO```
 
Onde ORIGEM pode ser *local* ou *remote*, a data é no formato *DD/Mon/YYYY:HH:MM:SStz* a ação é um comando [HTTP](https://pt.wikipedia.org/wiki/Hypertext_Transfer_Protocol), o `Status` é um código de resultado e o tamanho é o tamanho da requisição (ou - quando não existir).
 
A linha abaixo Representa uma requisição local realizado no dia 24 de Outubro de 1994 para pegar o arquivo 1.gif no servidor. O resultado (200) representa sucesso para baixar 1210 bytes:
 
```local - - [24/Oct/1994:13:47:19 -0600] "GET 1.gif HTTP/1.0" 200 1210```

3. Sua primeira atividade é descartar as linhas que tem nenhum ou apenas um traço depois de remote ou de local. Exemplo, as linhas abaixo devem ser **DESCARTADAS**:
 
```local - [01/Feb/1995:14:46:36 -0700] "GET /images/gtr.gif 1350.0" 200 36403 ```

```local      index.html```

 
4. Em seguida, processe os dados após a filtragem e ache:
- quantas requisições locais foram feitas
- quantas requisições remotas foram feitas
