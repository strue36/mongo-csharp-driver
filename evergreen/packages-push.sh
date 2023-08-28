#!/usr/bin/env bash
set -o errexit  # Exit the script with error if any of the commands fail

if [ -z "$PACKAGES_SOURCE" ]; then
  echo "PACKAGES_SOURCE variable should be set"
  exit 1
fi

if [ -z "$PACKAGES_SOURCE_KEY" ]; then
  echo "PACKAGES_SOURCE_KEY variable should be set"
  exit 1
fi

if [ -z "$PACKAGE_VERSION" ]; then
  PACKAGE_VERSION=$(sh ./evergreen/packages-version.sh)
  echo Calculated PACKAGE_VERSION value: "$PACKAGE_VERSION"
fi

dotnet nuget push --source "$PACKAGES_SOURCE" --api-key "$PACKAGES_SOURCE_KEY" ./build/nuget/MongoDB.Bson."$PACKAGE_VERSION".nupkg
dotnet nuget push --source "$PACKAGES_SOURCE" --api-key "$PACKAGES_SOURCE_KEY" ./build/nuget/MongoDB.Driver.Core."$PACKAGE_VERSION".nupkg
dotnet nuget push --source "$PACKAGES_SOURCE" --api-key "$PACKAGES_SOURCE_KEY" ./build/nuget/MongoDB.Driver."$PACKAGE_VERSION".nupkg
dotnet nuget push --source "$PACKAGES_SOURCE" --api-key "$PACKAGES_SOURCE_KEY" ./build/nuget/MongoDB.Driver.GridFS."$PACKAGE_VERSION".nupkg
dotnet nuget push --source "$PACKAGES_SOURCE" --api-key "$PACKAGES_SOURCE_KEY" ./build/nuget/mongocsharpdriver."$PACKAGE_VERSION".nupkg


