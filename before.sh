#!/bin/bash

# Load configuration data
. config

# Create new RPM database directory
set -x
mkdir -p $RPMDBPATH
