#!/usr/bin/env bash
set -o errexit  # Exit the script with error if any of the commands fail

if [[ -z $PACKAGE_VERSION ]]; then
  PACKAGE_VERSION=$(git describe --tags --abbrev=0 --match="v[0-9]*.[0-9]*.[0-9]*" --exclude="*-dev[0-9]*")
  echo Calculated PACKAGE_VERSION value: "$PACKAGE_VERSION"
fi

echo Creating nuget package...

dotnet clean ./CSharpDriver.sln
dotnet pack ./CSharpDriver.sln -o ./build/nuget -c Release -p:Version="$PACKAGE_VERSION" --include-symbols -p:SymbolPackageFormat=snupkg
