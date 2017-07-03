# Questão 3

O *strace* é uma importante ferramenta para diagnóstico de problemas em aplicações. Com ele, é possível visualizar o comportamento de diferentes *syscalls* (chamadas do sistema). Ao executar ```strace -T```, é possível, por exemplo, visualizar a chamada e o tempo gasto em cada chamada do sistema. Exemplo de parte da execução de um ```strace -T ls```:
 
`close(3)                                = 0 <0.000013>
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory) <0.000015>
open("/lib/x86_64-linux-gnu/libselinux.so.1", O_RDONLY|O_CLOEXEC) = 3 <0.000016>
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20c\0\0\0\0\0\0"..., 832) = 832 <0.000013>
fstat(3, {st_mode=S_IFREG|0644, st_size=142728, ...}) = 0 <0.000013>
mmap(NULL, 2246896, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f6072c3d000 <0.000015>
mprotect(0x7f6072c5e000, 2097152, PROT_NONE) = 0 <0.000018>
mmap(0x7f6072e5e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x21000) = 0x7f6072e5e000 <0.000017>
mmap(0x7f6072e60000, 6384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f6072e60000 <0.000017>`
 
Onde:
Uma *syscall* segue o formato **SYSCALL**(parametros) = **SAÍDA** <TEMPO>
O tempo entre **< >** representa o tempo gasto em segundos por cada *syscall*
Saídas de sucesso são maior do que 0, saídas de falha são negativas.

Considerando o resultado do strace existente no **ls.log**. Processe esse arquivo para achar:

- As 3 chamadas de maior duração
- A *syscall* com mais erros (e o número de chamadas com erro)
