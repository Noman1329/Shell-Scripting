#!/bin/bash

# SPECIAL_CHARS=$(echo ')(*&^%$#@!_+-=`~)/' | fold -w1 | shuf | head -1)
# PASSWORD="Pass${SPECIAL_CHARS}${RANDOM}${SPECIAL_CHARS}"
# echo $PASSWORD

#Improved Approach and more Secure)
# SPECIAL_CHARS='!@#$%^&*()_+-={}[]:;<>,.?/~'
# PASSWORD=$(tr </dev/urandom -dc "A-Za-z0-9${SPECIAL_CHARS}" | fold -w16 | head -n1)
# echo "$PASSWORD"

#More controlled and Secure approach
# upper=$(tr </dev/urandom -dc 'A-Z' | head -c1)
# lower=$(tr </dev/urandom -dc 'a-z' | head -c1)
# digit=$(tr </dev/urandom -dc '0-9' | head -c1)
# SPECIAL_CHARS=$(tr </dev/urandom -dc '!@#$%^&*()_+-=' | head -c1)
# rest=$(tr </dev/urandom -dc 'A-Za-z0-9!@#$%^&*()_+-=' | head -c8)
# PASSWORD=$(echo "$upper$lower$digit$SPECIAL_CHARS$rest" | fold -w1 | shuf | tr -d '\n')
# echo "$PASSWORD"

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
echo "$PASSWORD"
