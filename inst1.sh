#!/bin/bash

# Load configuration data
. config

# Install
set -x
rpm -Uhv --dbpath $RPMDBPATH --prefix $PREFIX_BASE/$VERSION \
$RPMDIR/bgclang-stage1-3.4-1.ppc64.rpm \
$RPMDIR/bgclang-stage1-libcxx-3.4-2.ppc64.rpm
