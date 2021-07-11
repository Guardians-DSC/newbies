#!/bin/bash

TCP=$(lsof -iTCP | awk '{print $1}') &> /dev/null
UDP=$(lsof -iUDP | awk '{print $1}') &> /dev/null
CountTCP=0
CountUDP=0

for i in $TCP
do
	vezes=$(echo "$TCP" | grep $i | wc -l) &> /dev/null
	
	if [[ $vezes -gt $CountTCP ]]
	then
		CountTCP=$vezes
		maior_TCP=$i
	fi
done

for i in $UDP
do
	vezes=$(echo "$UDP" | grep $i | wc -l) &> /dev/null
	
	if [[ $vezes -gt $CountUDP ]]
	then
		CountUDP=$vezes
		maior_UDP=$i
	fi
done

echo "====== TOP ====="
echo "TOP conexões UDP:"
echo "* $maior_UDP"
echo "TOP conexões TCP:"
echo "* $maior_TCP"
echo ""
echo "====== TCP ====="
echo ""
echo "LISTEN: $(lsof -iTCP -sTCP:LISTEN | wc -l)"
echo "ESTABLISHED: $(lsof -iTCP -sTCP:ESTABLISHED | wc -l)"
echo "SYN_SENT: $(lsof -iTCP -sTCP:SYN_SENT | wc -l)"
echo "CLOSE_WAIT: $(lsof -iTCP -sTCP:CLOSE_WAIT | wc -l)"
	
