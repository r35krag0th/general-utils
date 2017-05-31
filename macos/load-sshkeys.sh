#!/bin/bash

# vim: ft=sh

# Check to see if the apple agent is setup
apple_agent_running=1
if [ -z "$SSH_AUTH_SOCK" ]; then
    apple_agent_running=0
fi

if [ $apple_agent_running -eq 1 ]; then
    echo -e "\033[036m[\033[37mssh-agent\033[36m] \033[32mAdding \033[37mkeys stored in \033[1mApple Keychain\033[0m\033[37m...\033[0m"
    ssh-add -A 2>/dev/null 1>/dev/null

    added_keys=$(ssh-add -l | awk '{print $3}' | sed 's/.*\/\(.*.key\)/\1/')
    for i in ${added_keys[@]}; do
        echo -e "  \033[32mLOADED \033[37m${i}\033[0m"
    done
else
    echo -e "\033[31mApple Keychain ssh-agent not setup.\033[0m"
fi

echo ""
