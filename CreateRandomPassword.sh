#!/bin/bash

SPEC_CH=$(echo ')(*&^%$#@!_+-=`~)/' | fold -w1 | shuf | head -1)
PASS="Pass${SPEC_CH}${RANDOM}${SPEC_CH}"
echo $PASS
