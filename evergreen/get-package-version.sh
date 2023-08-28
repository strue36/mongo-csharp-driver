#!/usr/bin/env bash
set -o errexit  # Exit the script with error if any of the commands fail

if [ -z "$PACKAGE_VERSION_MATCH" ]; then
  # Use production release tag if nothing was passed
  PACKAGE_VERSION_MATCH="v[0-9]*.[0-9]*.[0-9]*"
  PACKAGE_VERSION_EXCLUDE="*-dev[0-9]*"
fi

PACKAGE_VERSION=$(git describe --tags --abbrev=0 --match="${PACKAGE_VERSION_MATCH}" --exclude="${PACKAGE_VERSION_EXCLUDE}")
PACKAGE_VERSION=$(echo $PACKAGE_VERSION | cut -c 2-)
echo "$PACKAGE_VERSION"
