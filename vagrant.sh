#!/usr/bin/env bash

worker_start=10
worker_end=12
haproxy_start=201
haproxy_end=201
init_master_start=101
init_master_end=101
more_master_start=102
more_master_end=102

echo -n '{'
echo -n '    "worker": {'
echo -n '        "hosts": '
echo -n '['
for number in $(seq $worker_start $worker_end); do echo -n "\"192.168.50.$number\"" ; if [ $number -lt $worker_end ]; then echo -n "," ; fi ;done
echo -n ']'
echo -n '    },'
echo -n '    "haproxy": {'
echo -n '        "hosts": '
echo -n '['
for number in $(seq $haproxy_start $haproxy_end); do echo -n "\"192.168.50.$number\"" ; if [ $number -lt $haproxy_end ]; then echo -n "," ; fi ;done
echo -n ']'
echo -n '    },'
echo -n '    "init_master": {'
echo -n '        "hosts": '
echo -n '['
for number in $(seq $init_master_start $init_master_end); do echo -n "\"192.168.50.$number\"" ; if [ $number -lt $init_master_end ]; then echo -n "," ; fi ;done
echo -n ']'
echo -n '    },'
echo -n '    "more_master": {'
echo -n '        "hosts": '
echo -n '['
for number in $(seq $more_master_start $more_master_end); do echo -n "\"192.168.50.$number\"" ; if [ $number -lt $more_master_end ]; then echo -n "," ; fi ;done
echo -n ']'
echo -n '    }'
echo -n '}'
