#!/usr/bin/env bash

filename=jan_95.txt

gzip -d -k -f "$filename.gz"

req_local=0
req_remote=0

requestRegex='[-] [-]'

local_regex='\<local\>'


while read -r line

do
	if [[ $line =~ $requestRegex ]]; then
		if [[ $line =~ $local_regex  ]]; then

			req_local=$(($req_local+1))
		else

			req_remote=$(($req_remote+1))
		fi

	fi
	echo "Locais: $req_local | Remotas  $req_remote"

done < $filename

rm $filename
