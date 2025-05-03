#!/bin/bash

# SPEC_CH=$(echo ')(*&^%$#@!_+-=`~)/' | fold -w1 | shuf | head -1)
# PASS="Pass${SPEC_CH}${RANDOM}${SPEC_CH}"
# echo $PASS

#Improved Approach and more Secure)
# SPECIAL_CHARS='!@#$%^&*()_+-={}[]:;<>,.?/~'
# PASSWORD=$(tr </dev/urandom -dc "A-Za-z0-9${SPECIAL_CHARS}" | fold -w16 | head -n1)
# echo "$PASSWORD"

#More controlled and Secure approach
upper=$(tr </dev/urandom -dc 'A-Z' | head -c1)
lower=$(tr </dev/urandom -dc 'a-z' | head -c1)
digit=$(tr </dev/urandom -dc '0-9' | head -c1)
special=$(tr </dev/urandom -dc '!@#$%^&*()_+-=' | head -c1)
rest=$(tr </dev/urandom -dc 'A-Za-z0-9!@#$%^&*()_+-=' | head -c8)
PASSWORD=$(echo "$upper$lower$digit$special$rest" | fold -w1 | shuf | tr -d '\n')
echo "$PASSWORD"