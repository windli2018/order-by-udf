#!/bin/bash
mkdir build
pushd build
cmake ..
cmake --build "$PWD" --config Release
popd
if [ -e /usr/local/Cellar/mysql/8.0.16/lib/plugin/ ]; then
  cp -avf build/lib*.so /usr/local/Cellar/mysql/8.0.16/lib/plugin/
elif [ -e /usr/lib/mysql/plugin/ ]; then
  cp -avf build/lib*.so /usr/lib/mysql/plugin/
fi
mkdir -p dist/$(uname -s)-$(uname -m)
cp -avf build/lib*.so dist/$(uname -s)-$(uname -m)
