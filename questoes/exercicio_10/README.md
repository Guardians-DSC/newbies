Todos os usuários dos LCCs possuem um limite máximo de espaço em disco que seus arquivos podem ocupar nos laboratórios (o que chamamos de *cota*). Dado um diretório passado como parâmetro, forneça um script que imprima um relatório d espaço em disco ocupado e o caminho (absoluto) de diretórios abaixo da raiz do diretório passado como parâmetro, e que atendam às seguintes características:

    a) diretórios cujo espaço em disco ocupado não exceda 10MB
    a) diretórios cujo espaço em disco ocupado exceda 10MB
    b) diretórios cujo espaço em disco ocupado exceda 200MB
    c) diretórios cujo espaço em disco ocupado exceda 10MB e não exceda 200MB

Formate sua saída de forma a imprimir os caminhos e características especificadas para cada quesito acima.
*Importante*: seu script deve avaliar e imprimir diretórios em 2 níveis de profundidade (não menos e não mais que isso) abaixo do diretório passado como parâmetro.

Exemplo de execução:

     $ bash cota.sh /home/guardian

     ========================================================
     Relatório de utilização para o diretório /home/guardian:
     ========================================================

     Diretórios que não excedem 10MB:
       1.2M      /home/guardian/repositorio
       10K       /home/guardian/teste
       5M        /home/guardian/teste/um_diretorio
       640K      /home/guardian/teste/tasks
       9.2M      /home/guardian/eclipse-workspace/.recommenders
     
     Diretórios que excedem 10MB:
       80M       /home/guardian/.config/autostart
       540M      /home/guardian/.config/Postman
       1.3G      /home/guardian/.config
       12.1M     /home/guardian/.eclipse/org.eclipse.oomph.p2
       14M       /home/guardian/.eclipse
       50M       /home/guardian/eclipse-workspace/.metadata
       60M       /home/guardian/eclipse-workspace
       292M      /home/guardian/R/x86_64-pc-linux-gnu-library
       292M      /home/guardian/R

     Diretórios que excedem 200MB:
       540M      /home/guardian/.config/Postman
       1.3G      /home/guardian/.config
       292M      /home/guardian/R/x86_64-pc-linux-gnu-library
       292M      /home/guardian/R

     Diretórios que excedem 10MB e não excedem 200MB:
       80M       /home/guardian/.config/autostart
       12.1M     /home/guardian/.eclipse/org.eclipse.oomph.p2
       14M       /home/guardian/.eclipse
       50M       /home/guardian/eclipse-workspace/.metadata
       60M       /home/guardian/eclipse-workspace
