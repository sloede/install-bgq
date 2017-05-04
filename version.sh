#!/bin/bash

# Get location of script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Load configuration data
. $DIR/config

wget -qO - $NIGHTLYBUILDSURL \
    | grep -m1 "r[0-9][0-9]*-[0-9][0-9]*" \
    | sed "s/.*\(r[0-9][0-9]*-[0-9][0-9]*\).*/\1/"
