#!/bin/sh

lsof | awk '
BEGIN{
	maxUDP=0
	maxTCP=0
	listen=0
	established=0
	syn_sent=0
	close_wait=0
}

/ UDP /{
	UDP_count[$1]++
	if (UDP_count[$1] >= maxUDP){
		maxUDP = UDP_count[$1]
	}
}

/TCP/{
	TCP_count[$1]++
	if (TCP_count[$1] >= maxTCP){
		maxTCP = TCP_count[$1]
	}
	if (/LISTEN/) {
		listen++
	}
	if (/ESTABLISHED/) {
		established++
	}
	if (/SYN_SENT/) {
		syn_sent++
	}
	if (/CLOSE_WAIT/) {
		close_wait++
	}
}


END {
	print "====== TOP ====="
	print "TOP conexões UDP:"
	for (key in UDP_count){
		if (UDP_count[key] == maxUDP) {
			print "* " key
		}
	}
	print "TOP conexões TCP:"
	for (key in TCP_count){
		if (TCP_count[key] == maxTCP) {
			print "* " key
		}
	}
	print ""
	print "====== TCP ====="
	print "LISTEN: " listen
	print "ESTABLISHED: " established
	print "SYN_SENT: " syn_sent
	print "CLOSE_WAIT: " close_wait
}
'
