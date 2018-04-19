# Questão 5

`lsof` é um comando dos sistemas Unix que permite listar os descritores de arquivos abertos pelos 
processos em execução no sistema operacional. Em sistemas Linux **TUDO** são arquivos. Ou seja, uma 
ferramenta como essa permite que você exiba informações sobre determinados usuários, processos, mostre 
apenas tráfego para determinados protocolos de rede, identificadores de arquivos e muito mais.

Aqui abaixo encontra-se um exemplo de saída produzida ao executar esse comando no terminal:


```
COMMAND     PID   TID TASKCMD      USER   FD      TYPE             DEVICE   SIZE/OFF       NODE NAME
systemd     618                 darklyn  cwd       DIR                8,2       4096          2 /
systemd     618                 darklyn  rtd       DIR                8,2       4096          2 /
systemd     618                 darklyn  txt       REG                8,2    1535416    1847890 /usr/lib/systemd/systemd
systemd     618                 darklyn  mem       REG                8,2     549992    1884430 /usr/lib/libsystemd.so.0.22.0
systemd     618                 darklyn  mem       REG                8,2     330904    1845630 /usr/lib/libdbus-1.so.3.19.6
systemd     618                 darklyn    0r      CHR                1,3        0t0       1028 /dev/null
pcmanfm     649                 darklyn  mem       REG                8,2   26890904    1884166 /usr/lib/libicudata.so.61.1
compton     641                 darklyn  DEL       REG                0,5               8968467 /memfd:xshmfence
openbox     626  9149 gmain     darklyn  cwd       DIR                8,2     184320     524290 /home/darklyn
transmiss   651                 darklyn   15w     FIFO               0,12        0t0      21915 pipe
transmiss   651                 darklyn   16u     IPv4              21917        0t0        UDP *:40414 
transmiss   651                 darklyn   17u     IPv4              21918        0t0        UDP *:40304 
transmiss   651                 darklyn   18u     IPv4              21919        0t0        UDP *:52979 
transmiss   651                 darklyn   19u     IPv4              25730        0t0        TCP *:51413 (LISTEN)
transmiss   651                 darklyn   20u     IPv6              25732        0t0        TCP *:51413 (LISTEN)
transmiss   651  5674 transmiss darklyn   61u     IPv4           10736023        0t0        TCP arcan-PC:36211->103.83.166.149:56735 (SYN_SENT)
firefox     9525 27087 DOM\x20Wo darklyn  137u     IPv6           10716583        0t0        TCP arcan-PC:53944->[2800:3f0:4004:806::200e]:https (ESTABLISHED)
firefox     9525 27087 DOM\x20Wo darklyn  138u     IPv6           10716523        0t0        TCP arcan-PC:33988->[2800:3f0:4004:808::2003]:https (ESTABLISHED)
plugin_ho 26755                 darklyn   17u     IPv4            9596240        0t0        TCP arcan-PC:43288->45.55.41.223:http (CLOSE_WAIT)
systemd     618                 darklyn    1u     unix   0xffff8817572bfc00        0t0      20424 type=STREAM
systemd     618                 darklyn    2u     unix   0xffff8817572bfc00        0t0      20424 type=STREAM
systemd     618                 darklyn    3u     unix   0xffff8817600d0400        0t0      16271 type=DGRAM
```

São vistas informações relevantes como o processo, PID, usuário, tipo, tamanho e nome do arquivo.

Você deve fazer um progrma que dado a saída do comando `lsof` filtre as conexões que sejam UDP 
ou TCP (internet) e exiba os dois processos que mais fizeram conexões desse tipo, respectivamente.

Bônus: Exiba as informações como a quantidade total de conexões TCP que estão em estado LISTEN, ESTABLISHED, SYN_SENT e CLOSE_WAIT.

## Exemplo de execução

```
$ ./questao_5.sh
====== TOP =====
TOP conexões UDP:
* transmiss
TOP conexões TCP: 
* firefox

====== TCP =====

LISTEN: 72
ESTABLISHED: 582
SYN_SENT: 50
CLOSE_WAIT: 3

```