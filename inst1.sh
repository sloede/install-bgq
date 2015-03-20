#!/bin/bash

# Load configuration data
. config

# Install
set -x
rpm -Uhv --dbpath $RPMDBPATH --prefix $PREFIX_BASE/$VERSION \
$RPMDIR/bgclang-stage1-*.ppc64.rpm
rpm -Uhv --dbpath $RPMDBPATH --prefix $PREFIX_BASE/$VERSION \
$RPMDIR/bgclang-stage2-*.ppc64.rpm
