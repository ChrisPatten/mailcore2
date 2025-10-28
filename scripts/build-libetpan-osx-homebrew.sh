#!/bin/sh

pushd "`dirname "$0"`" > /dev/null
scriptpath="`pwd`"
popd > /dev/null

. "$scriptpath/include.sh/build-dep.sh"

# Use Homebrew's pre-built libetpan instead of building from source
name="libetpan-osx"
version="homebrew-1.9.4"

if test x$build_for_external = x1 ; then
  builddir="$scriptpath/../Externals/tmp/dependencies"
else
  builddir="$HOME/MailCore-Builds/dependencies"
fi

resultdir="$builddir/builds"

echo "Using Homebrew pre-built libetpan for $name $version"

# Create the build directory structure
mkdir -p "$resultdir/$name"
mkdir -p "$resultdir/$name/$name-$version/$name/lib"
mkdir -p "$resultdir/$name/$name-$version/$name/include"

# Copy the Homebrew libetpan library
cp /opt/homebrew/lib/libetpan.a "$resultdir/$name/$name-$version/$name/lib/libetpan.a"

# Copy the Homebrew libetpan headers
cp -R /opt/homebrew/include/libetpan/* "$resultdir/$name/$name-$version/$name/include/"

# Create git-rev file with Homebrew version info
echo "homebrew-1.9.4"> "$resultdir/$name/$name-$version/git-rev"

if test x$build_for_external = x1 ; then
  mkdir -p "$scriptpath/../Externals"
  cp -R "$resultdir/$name/$name-$version"/* "$scriptpath/../Externals"
  rm -f "$scriptpath/../Externals/git-rev"
else
  mkdir -p "$resultdir/$name"
  zip -qry "$resultdir/$name/$name-$version.zip" "$resultdir/$name/$name-$version"
fi

echo "build of $name-$version done using Homebrew pre-built library"
