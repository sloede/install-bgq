#!/bin/bash

# Get version
if [ $# -lt 1 ]; then
  echo "error: missing argument: bgclang version" >&2
  exit 2
fi
VERSION=$1
echo "bgclang version: $VERSION"

# Get patch release
RELEASE=1
if [ $# -gt 1 ]; then
  RELEASE=$2
fi
echo "bgclang patch release: $RELEASE"

# Get location of script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Load configuration data
. $DIR/config

# Download RPMS
echo "Downloading RPMs to $RPMDIR ..."
for f in vpkg-bin-sh-1-1.ppc64.rpm \
         bgclang-stage1-3.4-1.ppc64.rpm \
         bgclang-stage1-libcxx-3.4-1.ppc64.rpm \
         bgclang-stage1-libcxx-3.4-2.ppc64.rpm \
         bgclang-stage2-3.5.1-1.ppc64.rpm \
         bgclang-stage2-libcxx-3.5.1-1.ppc64.rpm \
         bgclang-stage3-libcxx-r266865-1.ppc64.rpm \
         bgclang-stage3-r266865-1.ppc64.rpm \
         toolchain-fixup-4.7.2-4.ppc64.rpm \
         bgclang-binutils-${VERSION}-1-${RELEASE}.ppc64.rpm \
         bgclang-compiler-rt-${VERSION}-1-${RELEASE}.ppc64.rpm \
         bgclang-gdb-${VERSION}-1-${RELEASE}.ppc64.rpm \
         bgclang-libcxx-${VERSION}-1-${RELEASE}.ppc64.rpm \
         bgclang-libomp-${VERSION}-1-${RELEASE}.ppc64.rpm \
         bgclang-mpich3-${VERSION}-1-${RELEASE}.ppc64.rpm \
         bgclang-${VERSION}-1-${RELEASE}.ppc64.rpm \
         bgclang-sleef-${VERSION}-1-${RELEASE}.ppc64.rpm; do
  url=$RPMURL/$f
  echo "  $url"
  wget -q -P $RPMDIR $url
done
echo "Done."
