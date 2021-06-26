#!/bin/bash


TCP=$(lsof | grep TCP | sort -k 1)
UDP=$(lsof | grep UDP | sort -k 1)

TOP_TCP=$(echo "${TCP}" | awk '{print $1}' | uniq -c | sort -gr | head -n 1 | awk '{print $2}')
TOP_UDP=$(echo "${UDP}" | awk '{print $1}' | uniq -c | sort -gr | head -n 1 | awk '{print $2}')

LISTEN=$(echo "${TCP}" | grep LISTEN | wc -w)
STABLISHED=$(echo "${TCP}" | grep STABLISHED | wc -w)
SYN_SENT=$(echo "${TCP}" | grep SYN_SENT | wc -w)
CLOSE_WAIT=$(echo "${TCP}" | grep CLOSE_WAIT | wc -w)

echo "====== TOP ======"
echo "TOP conexões UDP:"
echo "* ${TOP_UDP}"
echo "TOP conexões TCP:" 
echo "* ${TOP_TCP}"
echo
echo "====== TCP ======"
echo "LISTEN: ${LISTEN}"
echo "ESTABLISHED: ${STABLISHED}"
echo "SYN_SENT: ${SYN_SENT}"
echo "CLOSE_WAIT: ${CLOSE_WAIT}"