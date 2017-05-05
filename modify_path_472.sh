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

# Modify bgclang script and save original with .O extension as backup
echo "Changing floor in $PREFIX_BASE/$VERSION-1-$RELEASE/bin/bgclang..."
sed -i.O "s@new_floor=/bgsys/drivers/toolchain/\${dvr}_base_4.7.2@new_floor=$GCC472_PATH@g" \
    $PREFIX_BASE/$VERSION-1-$RELEASE/bin/bgclang
echo "Done."
