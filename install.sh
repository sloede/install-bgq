#!/bin/bash

# Get version
if [ $# -lt 1 ]; then
  echo "error: missing argument: bgclang version" >&2
  exit 2
fi
VERSION=$1
if echo $VERSION | grep -qv "^r[0-9][0-9]*-[0-9][0-9]*$"; then
  echo "error: bad version '$VERSION': must be formatted as 'r[0-9]+-[0-9]+'" >&2
  exit 2
fi
echo "bgclang version: $VERSION"

# Get location of script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Load configuration data
. $DIR/config

# Create new RPM database directory
echo "Creating new RPM database directory $RPMDBPATH..."
mkdir -p $RPMDBPATH

# Installing RPMs
echo "Installing virtual packages..."
rpm -Uhv --dbpath $RPMDBPATH --prefix $PREFIX_BASE/$VERSION \
    $RPMDIR/vpkg-bin-sh-*.ppc64.rpm
echo

echo "Installing stage 1 packages..."
rpm -Uhv --dbpath $RPMDBPATH --prefix $PREFIX_BASE/$VERSION \
$RPMDIR/bgclang-stage1-*.ppc64.rpm
echo

echo "Installing stage 2 packages..."
rpm -Uhv --dbpath $RPMDBPATH --prefix $PREFIX_BASE/$VERSION \
$RPMDIR/bgclang-stage2-*.ppc64.rpm
echo

echo "Installing gcc/4.7.2 fixup packages..."
rpm -Uhv --dbpath $RPMDBPATH --prefix $PREFIX_BASE/$VERSION \
$RPMDIR/toolchain-fixup-4.7.2-*.ppc64.rpm
echo

echo "Installing bgclang packages..."
rpm -Uhv --dbpath $RPMDBPATH --prefix $PREFIX_BASE/$VERSION \
        $RPMDIR/bgclang-binutils-r*.ppc64.rpm \
        $RPMDIR/bgclang-gdb-r*.ppc64.rpm \
        $RPMDIR/bgclang-r*.ppc64.rpm \
        $RPMDIR/bgclang-compiler-rt-r*.ppc64.rpm \
        $RPMDIR/bgclang-libcxx-r*.rpm \
        $RPMDIR/bgclang-libomp-r*.ppc64.rpm \
        $RPMDIR/bgclang-sleef-r*.ppc64.rpm
echo

echo "Done."
