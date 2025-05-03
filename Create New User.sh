#!/bin/bash
#Check and create user if not available
# if [ $# -gt 0 ]; then
#     for USER in $@; do #to add multiple user at a time
#         # USER=$1
#         EXISTED_USER=$(cat /etc/passwd | grep -E $USER | awk -F ":" '{print $1}')
#         if [ "${USER}" = "${EXISTED_USER}" ]; then
#             echo "User name with ["$USER"] already exist, provide another username!"
#         else
#             sudo useradd -m $USER --shell /bin/bash
#             echo "User ["$USER"] has been created!"
#         fi
#     done
# else
#     echo "Please provide a valid username to continue!"
# fi

#_________#

#Check and create user, if not available
if [ $# -gt 0 ]; then
    for USER in $@; do #to add multiple user at a time
        # USER=$1
        EXISTED_USER=$(cat /etc/passwd | grep -E $USER | awk -F ":" '{print $1}')
        if [ "${USER}" = "${EXISTED_USER}" ]; then
            echo "User name with ["$USER"] already exist, provide another username!"
        else
            sudo useradd -m $USER --shell /bin/bash

            #Create password with minimum and maximum length
            MINval=8
            MAXval=12
            CHARS='A-Za-z0-9'
            SPECIAL_CHARS='!@#$%^&*()_+-={}[]:;<>,.?/~'
            LENGTH=$((RANDOM % (MAXval - MINval + 1) + MINval))
            UpperCase=$(tr -dc 'A-Z' </dev/urandom | head -c1)
            LowerCase=$(tr -dc 'a-z' </dev/urandom | head -c1)
            Digit=$(tr -dc '0-9' </dev/urandom | head -c1)
            SPECIAL_CHARS=$(tr -dc "$SPECIAL_CHARS" </dev/urandom | head -c1)
            Random=$(tr -dc "$CHARS$SPECIAL_CHARS" </dev/urandom | head -c $((LENGTH - 4)))

            PASSWORD=$(echo "$UpperCase$LowerCase$Digit$SPECIAL_CHARS$Random" | fold -w1 | shuf | tr -d '\n')
            echo "User ["$USER"] has been created!"
            echo "The temporary password for ["$USER"] is "$PASSWORD""
        fi
    done
else
    echo "Please provide a valid username to continue!"
fi
