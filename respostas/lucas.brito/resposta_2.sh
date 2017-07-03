#!/bin/bash

N=$1
S=$2
P_USER=$3

for i in `seq $N`; do
    ps aux | grep $P_USER

    sleep $N
done;