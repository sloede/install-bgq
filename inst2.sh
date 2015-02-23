#!/bin/bash

# Load configuration data
. config

# Install
set -x
rpm -Uhv --dbpath $RPMDBPATH --prefix $PREFIX_BASE/$VERSION \
        $RPMDIR/bgclang-binutils-*.ppc64.rpm \
        $RPMDIR/bgclang-gdb-*.ppc64.rpm \
        $RPMDIR/bgclang-r*.ppc64.rpm \
        $RPMDIR/bgclang-compiler-rt-r*.ppc64.rpm \
        $RPMDIR/bgclang-libcxx-r*.rpm \
        $RPMDIR/bgclang-libomp-r*.ppc64.rpm \
        $RPMDIR/bgclang-sleef-r*.ppc64.rpm
