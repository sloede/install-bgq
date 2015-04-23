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

# Download RPMS
echo "Downloading RPMs to $RPMDIR..."
for f in vpkg-bin-sh-1-1.ppc64.rpm \
         bgclang-stage1-3.4-1.ppc64.rpm \
         bgclang-stage1-libcxx-3.4-1.ppc64.rpm \
         bgclang-stage1-libcxx-3.4-2.ppc64.rpm \
         bgclang-stage2-3.5.1-1.ppc64.rpm \
         bgclang-stage2-libcxx-3.5.1-1.ppc64.rpm \
         toolchain-fixup-4.7.2-1.ppc64.rpm \
         toolchain-fixup-4.7.2-2.ppc64.rpm \
         bgclang-binutils-${VERSION}-1-1.ppc64.rpm \
         bgclang-compiler-rt-${VERSION}-1-1.ppc64.rpm \
         bgclang-gdb-${VERSION}-1-1.ppc64.rpm \
         bgclang-libcxx-${VERSION}-1-1.ppc64.rpm \
         bgclang-libomp-${VERSION}-1-1.ppc64.rpm \
         bgclang-${VERSION}-1-1.ppc64.rpm \
         bgclang-sleef-${VERSION}-1-1.ppc64.rpm; do
  url=$RPMURL/$f
  echo "  $url"
  wget -q -P $RPMDIR $url
done
echo "Done."
