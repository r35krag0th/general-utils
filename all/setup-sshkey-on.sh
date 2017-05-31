#!/bin/bash

TargetHost=$1
KeyFile=$2
if [ -z "${TargetHost}" ]; then
    echo "$0: (user@)host pubkey_file";
    exit 1;
fi

if [ -z "${KeyFile}" ]; then
    echo "$0: (user@)host pubkey_file";

    echo "";
    echo "Available pairs are ...";
    find ~/.keys -name '*.pub' -print;
    exit 2;
fi

if [ ! -f "${KeyFile}" ]; then
    echo "Couldn't find keyfile (${KeyFile})...";
    exit 3;
fi

KeyCode=$(cat ${KeyFile})

ssh -o Pubkeyauthentication=no -q $TargetHost "mkdir ~/.ssh 2>/dev/null; chmod 700 ~/.ssh; echo "$KeyCode" >> ~/.ssh/authorized_keys; chmod 644 ~/.ssh/authorized_keys"
