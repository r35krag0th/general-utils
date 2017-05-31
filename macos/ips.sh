#!/bin/bash

# Get a list of interfaces
interface_list=$(ifconfig | grep -E '^[a-z]+[0-9]+:' | cut -d':' -f1 | sort)

# Find out which interface is the default route for the internet
preferred_interface=$(route get r35.net | grep interface | cut -d':' -f2 | tr -d ' ')

for interface_name in ${interface_list[@]}; do
    interface_mac=$(ifconfig ${interface_name} | grep '^\s\+ether [0-9a-fA-F:]\+' | cut -d' ' -f2)
    interface_ips=$(ifconfig ${interface_name} | grep '^\s\+inet [0-9.]\+' | cut -d' ' -f2)

    additional_details=""
    if [ "${preferred_interface}" == "${interface_name}" ]; then
        additional_details="${additional_details} \033[1;35mDEFAULT\033[0m"
    fi

    if [ ! -z "${interface_ips}" ]; then
        echo -e "\033[1;33m${interface_name}\033[0;37m: \033[32m${interface_ips} \033[34m(\033[36m${interface_mac}\033[34m)${additional_details} \033[0m"
    fi
done;

echo ""
echo -e "\033[1;33mPublic IP:\033[0;32m $(wget -qO- http://icanhazip.com)\033[0m"
