#!/bin/bash

# Get location of script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Set nightly version
VERSION=$($DIR/version.sh)

# Load configuration data
. $DIR/config

# Get currently installed nightly version
INSTALLED=$([ -d $NIGHTLY_BUILD_DIR ] && \
            cd $NIGHTLY_BUILD_DIR && basename $(pwd -P))

# Quit if current version is already installed
echo "Current nightly build: $VERSION"
echo "Currently installed:   $INSTALLED"
if [ "$VERSION" = "$INSTALLED" ]; then
  echo "Versions match, nothing to do."
  exit 0
fi

# Download new version
echo "Downloading $VERSION..."
$DIR/download.sh $VERSION
if [ $? -ne 0 ]; then
  echo "cron.sh: error while downloading $VERSION" >&2
  exit 1
fi

# Install new version
echo "Installing $VERSION..."
$DIR/install.sh $VERSION
if [ $? -ne 0 ]; then
  echo "cron.sh: error while installing $VERSION" >&2
  exit 1
fi

# Fix path to gcc 4.7.2 files
echo "Fixing gcc/4.7.2 path..."
$DIR/modify_path_472.sh $VERSION

# Reset link to new nightly build
rm -f $NIGHTLY_BUILD_DIR
ln -s $PREFIX_BASE/$VERSION $NIGHTLY_BUILD_DIR
echo "Reset link: $NIGHTLY_BUILD_DIR now points to $PREFIX_BASE/$VERSION"

# Remove previous nightly build
if [ -n "$INSTALLED" ] && [ -d "$PREFIX_BASE/$INSTALLED" ] && \
    [ $REMOVE_OLD_NIGHTLY_BUILD -eq 1 ]; then
  echo "Removing old nightly build $PREFIX_BASE/$INSTALLED..."
  $DIR/remove.sh $INSTALLED
fi

echo "Done."
