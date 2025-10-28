#!/bin/sh

pushd "`dirname "$0"`" > /dev/null
scriptpath="`pwd`"
popd > /dev/null

# Check if Homebrew libetpan is available
if [ -f "/opt/homebrew/lib/libetpan.a" ]; then
  echo "Using Homebrew pre-built libetpan (ARM64 compatible)"
  . "$scriptpath/build-libetpan-osx-homebrew.sh"
else
  echo "Homebrew libetpan not found, falling back to source build"
  . "$scriptpath/include.sh/build-dep.sh"
  
  url="https://github.com/dinhviethoa/libetpan.git"
  rev=5c9eb6b6ba64c4eb927d7a902317410181aacbba
  name="libetpan-osx"
  xcode_target="static libetpan"
  xcode_project="libetpan.xcodeproj"
  library="libetpan.a"
  embedded_deps=""
  
  build_git_osx
fi
