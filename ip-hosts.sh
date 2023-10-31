#!/bin/bash

base_ip=$1
usage="usage: ip-hosts BASE_IP_ADDRESS
where BASE_IP_ADDRESS is an ip address without the 4th part
Example of a valid BASE_IP_ADDRESS: 193.168.0"
description="ip-hosts checks whether the hosts connected to BASE_ADDRESS are alive."

if [ ! "$1" ]; then
    echo "ip-hosts: Too few arguments. The command requires the BASE_ADDRESS argument"
    echo "$usage"
    exit 1
elif [ "$#" -gt 1 ]; then
    echo "Too many arguments"
    echo "$usage"
    exit 1
elif [ "$1" = "-h" ]; then
    echo -e "$description\n"
    echo "$usage"
    exit
elif [ "$(echo "$1" | grep -E -o "([0-255]\.){2}[0-255]")" ]; then
    echo "Invalid base address format"
    echo "$usage"
    exit 2
fi


for ip in $base_ip.{1..255};
do
    if [ "$(ping "$ip" -c 2)" ]; then
        echo "$ip is alive"
    fi

done