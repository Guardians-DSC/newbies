# Questão 10

Todos os usuários dos LCCs possuem um limite máximo de espaço em disco que seus arquivos podem ocupar nos laboratórios (o que chamamos de **cota**).

Dado um diretório **passado como parâmetro**, forneça um script que imprima um relatório de espaço em disco ocupado e o caminho (absoluto) de diretórios abaixo da raiz do diretório passado como parâmetro, e que atendam às seguintes características:

```
a) diretórios cujo espaço em disco ocupado não exceda 10MB
b) diretórios cujo espaço em disco ocupado exceda 10MB
c) diretórios cujo espaço em disco ocupado exceda 200MB
d) diretórios cujo espaço em disco ocupado exceda 10MB e não exceda 200MB
```

Formate sua saída de forma a imprimir os caminhos absolutos e características especificadas para cada quesito acima.

**Importante**: seu script deve avaliar e imprimir diretórios em 2 níveis de profundidade (não menos e não mais que isso) abaixo do diretório passado como parâmetro.

## Exemplo de execução:

```
$ bash cota.sh /home/guardians

=========================================================
Relatório de utilização para o diretório /home/guardians:
=========================================================

Diretórios que não excedem 10MB:
    1.2M      /home/guardians/repositorio
    10K       /home/guardians/teste
    5M        /home/guardians/teste/um_diretorio
    640K      /home/guardians/teste/tasks
    9.2M      /home/guardians/eclipse-workspace/.recommenders
     
Diretórios que excedem 10MB:
    80M       /home/guardians/.config/autostart
    540M      /home/guardians/.config/Postman
    1.3G      /home/guardians/.config
    12.1M     /home/guardians/.eclipse/org.eclipse.oomph.p2
    14M       /home/guardians/.eclipse
    50M       /home/guardians/eclipse-workspace/.metadata
    60M       /home/guardians/eclipse-workspace
    292M      /home/guardians/R/x86_64-pc-linux-gnu-library
    292M      /home/guardians/R

Diretórios que excedem 200MB:
    540M      /home/guardians/.config/Postman
    1.3G      /home/guardians/.config
    292M      /home/guardians/R/x86_64-pc-linux-gnu-library
    292M      /home/guardians/R

Diretórios que excedem 10MB e não excedem 200MB:
    80M       /home/guardians/.config/autostart
    12.1M     /home/guardians/.eclipse/org.eclipse.oomph.p2
    14M       /home/guardians/.eclipse
    50M       /home/guardians/eclipse-workspace/.metadata
    60M       /home/guardians/eclipse-workspace
```

A ordem de impressão dos diretórios não importa, mas você terá um **bônus** se optar por ordenar pelo espaço ocupado de forma descrescente. Lembre-se que, em todos os casos, os diretórios devem ser impressos com o caminho absoluto (e.g.: `./eclipse-workspace` é um caminho relativo, `/home/guardians/eclipse-workspace` é um caminho absoluto).
