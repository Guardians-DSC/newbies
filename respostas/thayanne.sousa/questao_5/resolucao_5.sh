#!bin/sh
max_tcp=0
process_TCP=''
max_udp=0
process_udp=''

for process in `lsof -iTCP | awk '{print $1}'`; do
    number=$(lsof -iTCP| grep $process | wc -l)
    if [[ ${number} -gt $max_tcp ]]; then
        max_tcp=$number
        process_TCP=$process
    fi
done

for process in `lsof -iUDP | awk '{print $1}'`; do
    number=$(lsof -iUDP| grep $process | wc -l)
    if [[ ${number} -gt $max_udp ]]; then
        max_udp=$number
        process_udp=$process
    fi
done

echo '====== TOP ====='
echo 'TOP conexões UDP:'
echo "* $process_udp" 
echo 'TOP conexões TCP:' 
echo "* $process_TCP"

echo " "

echo '====== TCP ====='
echo "LISTEN: $(lsof -iTCP -sTCP:LISTEN | wc -l)"
echo "ESTABLISHED: $(lsof -iTCP -sTCP:ESTABLISHED | wc -l)"
echo "SYN_SENT: $(lsof -iTCP -sTCP:SYN_SENT | wc -l)"
echo "CLOSE_WAIT: $(lsof -iTCP -sTCP:CLOSE_WAIT | wc -l)"
