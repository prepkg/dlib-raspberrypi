#!/bin/bash
set -eo pipefail

APP=$(pwd)
TARGET_ROOT=/opt/target

dpkg -x $APP/build/dlib-aarch64-linux-gnu.deb $TARGET_ROOT

/opt/aarch64-linux-gnu/bin/aarch64-linux-gnu-g++ $APP/scripts/test/main.cpp -o /tmp/test \
  -I$TARGET_ROOT/usr/local/include \
  -L$TARGET_ROOT/usr/local/lib \
  -static-libstdc++ \
  -static-libgcc \
  -ldlib

qemu-aarch64 -L /opt/aarch64-linux-gnu/aarch64-linux-gnu/sysroot -E LD_LIBRARY_PATH=$TARGET_ROOT/usr/local/lib /tmp/test

for f in /opt/target/usr/local/lib/*.so.* /tmp/test; do
  echo "File: $f"
  /opt/aarch64-linux-gnu/bin/aarch64-linux-gnu-readelf -d "$f" | grep NEEDED
done
