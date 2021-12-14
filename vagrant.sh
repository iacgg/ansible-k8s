#!/usr/bin/env bash

start=10
end=12

echo -n '{'
echo -n '    "k8s": {'
echo -n '        "hosts": '
echo -n '['
for number in $(seq $start $end); do echo -n "\"192.168.50.$number\"" ; if [ $number -lt $end ]; then echo -n "," ; fi ;done
echo -n ']'
echo -n '    }'
echo -n '}'
