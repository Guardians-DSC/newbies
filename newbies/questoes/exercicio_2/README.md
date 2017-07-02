# Questão 2

Seu programa deve ler um número, que é o número de observações **(N)** a serem feitas, um outro número representando um intervalo de tempo em segundos **(S)**, e um começo de nome de um usuário **(P_USER)**. Estes três dados serão recebidos como 3 parâmetros em sequencia.
 
A cada **S** segundos, seu programa precisa executar um ```ps aux``` (ou equivalente) que irá listar os processos em execução. Seu script deve parar depois de executar **N** vezes e deve capturar todos os programas dos usuários que comecem com **P_USER**. Considerando todas as observações feitas, o programa deve exibir:
- o maior e menor valor de %CPU total encontrado
- o maior e menor valor de %MEM total encontrado
