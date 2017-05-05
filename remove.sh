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

# Remove bgclang directories
echo "Removing RPM directory $RPMDIR..."
rm -rf $RPMDIR
echo "Removing RPM database directory $RPMDBPATH..."
rm -rf $RPMDBPATH
echo "Removing install directory $PREFIX_BASE/$VERSION-1-$RELEASE..."
rm -rf $PREFIX_BASE/$VERSION-1-$RELEASE

echo "Done."
