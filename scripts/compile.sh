#!/bin/bash
set -eo pipefail

APP=$(pwd)
mkdir -p $APP/build /tmp/{openblas,dlib}

VERSION=$(basename $(curl -sILo /dev/null -w '%{url_effective}' https://github.com/OpenMathLib/OpenBLAS/releases/latest))
curl -sSL https://github.com/OpenMathLib/OpenBLAS/archive/refs/tags/$VERSION.tar.gz | tar xz --strip-components=1 -C /tmp/openblas

VERSION=$(basename $(curl -sILo /dev/null -w '%{url_effective}' https://github.com/davisking/dlib/releases/latest))
curl -sSL https://github.com/davisking/dlib/archive/refs/tags/$VERSION.tar.gz | tar xz --strip-components=1 -C /tmp/dlib

{
  echo $VERSION

  cd /tmp/openblas && rm -rf build
  cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=$APP/scripts/pi.cmake \
    -DCMAKE_C_FLAGS='-w'
  cmake --build build -j$(nproc)
  cmake --install build --strip

  cd /tmp/dlib && rm -rf build
  cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=$APP/scripts/pi.cmake \
    -DCMAKE_INSTALL_PREFIX=build/install/usr/local \
    -DCMAKE_SHARED_LINKER_FLAGS='-static-libstdc++ -static-libgcc' \
    -DCMAKE_C_FLAGS='-w' \
    -DCMAKE_CXX_FLAGS='-Wno-psabi' \
    -DBUILD_SHARED_LIBS=ON \
    -DDLIB_USE_FFMPEG=OFF \
    -DDLIB_USE_CUDA=OFF \
    -DDLIB_JXL_SUPPORT=OFF \
    -DDLIB_NO_GUI_SUPPORT=ON
  cmake --build build -j$(nproc)
  cmake --install build --strip
} 2>&1 | tee $APP/build/dlib-aarch64-linux-gnu.txt

cd /tmp/dlib/build && mkdir install/DEBIAN

cat << EOF > install/DEBIAN/control
Package: dlib
Version: ${VERSION#v}-1
Architecture: arm64
Maintainer: prepkg <precompiledpkg@gmail.com>
Description: Modern C++ toolkit containing machine learning algorithms and tools
EOF

cat << EOF > install/DEBIAN/postinst
#!/bin/bash

ldconfig
EOF

chmod 755 install/DEBIAN/postinst
dpkg-deb -Zxz --build install $APP/build/dlib-aarch64-linux-gnu.deb
