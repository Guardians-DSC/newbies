#!/bin/bash
# Ramon Sousa Sarmento,117210402

if [ `ls -l | awk '{if(substr($1,9,1) == "w"){print 0;exit 0}}'` ];then echo "diretorio não seguro";else echo "diretorio seguro";fi
