#!/bin/sh

ls -l | awk '
BEGIN {
	status = "SEGURO"
}

{if ($1 ~/w/) {
	status = "INSEGURO"
}}

END {
	print "DIRETORIO " status
}
'

