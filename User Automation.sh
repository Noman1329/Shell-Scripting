#!/bin/bash

if [ $# -gt 0 ]; then
    USER=$1
    EXISTED_USER=$(cat /etc/passwd | grep -E $USER | awk -F ":" '{print $1}')
    if [ "${USER}" = "${EXISTED_USER}" ]; then
        echo "User name with ["$USER"] already exist, provide another username!"
    else
        sudo useradd -m $USER --shell /bin/bash
        echo "User ["$USER"] has been created!"
    fi
else
    echo "Please provide a valid username to continue!"
fi
