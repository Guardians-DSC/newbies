#!bin/sh

# constant with break line
NEWLINE=$'\n'

# hardware info
model_name=$(cat /proc/cpuinfo | grep "model name" | head -n 1 | sed -e "s/.*:.//")
ethernet_controller=$(lspci | grep "Ethernet controller" | sed -e "s/.*:.//")
mem_total=$(cat /proc/meminfo  | grep "MemTotal" | sed -e "s/.*:.//" | awk '$1=$1')

# verify if file doesn't exist
if [ ! "$(ls | grep "arquivo_base.txt")" ]; then 
    echo -e "$model_name\n$ethernet_controller\n$mem_total" > arquivo_base.txt  #create file

    elif [[ "$model_name${NEWLINE}$ethernet_controller${NEWLINE}$mem_total" != $(< arquivo_base.txt) ]]; then #file was changed
        echo "SISTEMA ALTERADO"
        echo -e "$model_name\n$ethernet_controller\n$mem_total" > arquivo_base.txt
    else 
        echo "SEM ALTERACOES"
    
fi

