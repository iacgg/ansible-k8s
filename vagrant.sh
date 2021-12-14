#!/usr/bin/env bash

worker_start=10
worker_end=12
master_start=101
master_end=101

echo -n '{'
echo -n '    "worker": {'
echo -n '        "hosts": '
echo -n '['
for number in $(seq $worker_start $worker_end); do echo -n "\"192.168.50.$number\"" ; if [ $number -lt $worker_end ]; then echo -n "," ; fi ;done
echo -n ']'
echo -n '    },'
echo -n '    "master": {'
echo -n '        "hosts": '
echo -n '['
for number in $(seq $master_start $master_end); do echo -n "\"192.168.50.$number\"" ; if [ $number -lt $master_end ]; then echo -n "," ; fi ;done
echo -n ']'
echo -n '    }'
echo -n '}'
