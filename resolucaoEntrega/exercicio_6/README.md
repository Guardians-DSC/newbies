# Questao 6

Uma das atividades mais rotineiras do administrador de sistemas é a de garantir a segurança do sistema. Dentre os aspectos a serem observados está a proteção dos arquivos dos usuários.

Uma das maneiras de ver as permissões dos arquivos do usuário está em fazer uma listagem completa dos arquivos com o comando `ls -l`. Uma saída como `-rw-r--r--` significa que o arquivo pode ser lido e escrito pelo usuário, que pode ser lido pelos usuários do mesmo grupo e que também pode ser lidos por todos os usuários do sistema.

Faça um script que verifique se nenhum arquivo de um diretório pode ser escrito por outros usuários, ou seja, se as permissões NÃO terminam em `-w-`, `rw-`, `-wx` ou `rwx`. Se nenhum arquivo tiver essas permissão, imprima a mensagem "DIRETORIO SEGURO". Caso contrário, imprima "DIRETORIO INSEGURO".

Você pode analisar a saída do próprio `ls` para verificar tais permissões ou usar aplicações como o `find` para fazer essa verificação.

Exemplos de execução:
---------------------

No exemplo abaixo, o `arquivo.txt` pode ser escrito pelo próprio usuários ou por usuários do mesmo grupo mas não pelos demais usuários do sistema (permissão não termina em `w`).

```
$ ls -l
total 8
-rw-rw---- 1 matheusgr matheusgr    6 Apr 23 10:09 arquivo.txt
drwxr-x--- 2 matheusgr matheusgr 4096 Apr 23 10:09 diretorio
$ bash seguro.sh
DIRETORIO SEGURO
```

No exemplo abaixo, é possível observar que o `arquivo.txt` pode ser escrito por todos os usuários do sistema.

```
$ ls -l
total 8
-rw-rw-rw- 1 matheusgr matheusgr    6 Apr 23 10:09 arquivo.txt
drwxr-x--- 2 matheusgr matheusgr 4096 Apr 23 10:09 diretorio
$ bash seguro.sh
DIRETORIO INSEGURO
```
