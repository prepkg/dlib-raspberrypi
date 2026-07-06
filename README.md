# dlib-raspberrypi

[![GitHub Release](https://img.shields.io/github/v/release/prepkg/dlib-raspberrypi)](https://github.com/prepkg/dlib-raspberrypi/releases/latest)
[![License](https://img.shields.io/github/license/prepkg/dlib-raspberrypi)](https://github.com/prepkg/dlib-raspberrypi/blob/master/LICENSE)
[![Downloads](https://img.shields.io/github/downloads/prepkg/dlib-raspberrypi/total)](https://github.com/prepkg/dlib-raspberrypi/releases)
[![Linux](https://github.com/prepkg/dlib-raspberrypi/actions/workflows/linux.yaml/badge.svg)](https://github.com/prepkg/dlib-raspberrypi/actions/workflows/linux.yaml)

> 🚀️ Always up-to-date [Dlib](https://github.com/davisking/dlib) binaries for Raspberry Pi - just download and use it.

> ⭐ If you find this repository useful, please consider giving it a star.

Dlib binaries are compiled with the [GCC Toolchain](https://github.com/prepkg/gcc-toolchain) targeting older glibc
versions, ensuring compatibility across a wide range of Raspberry Pi boards running Raspberry Pi OS 64-bit. GitHub CI
workflows are used to automate the build process: pipelines run daily, but new builds are triggered only when a new
Dlib release is available.

## Why?

* **No official Dlib packages.** There are no prebuilt official Dlib packages for Raspberry Pi OS, forcing users
  to compile it from source themselves.
* **Slow compilation on Raspberry Pi.** Building Dlib directly on a Raspberry Pi can take hours and often runs into the
  limited RAM available on the device.
* **Always up to date.** GitHub CI workflows rebuild and publish Dlib automatically whenever a new version is released
  upstream.
* **No extra dependencies.** The required libraries are statically linked, so the Dlib binaries only depend on the base
  system libraries already present on Raspberry Pi OS.

## Build Information

* Dynamically linked with an older glibc version. For details, see the [GCC Toolchain](https://github.com/prepkg/gcc-toolchain).
* Statically linked with libstdc++, libgcc, and OpenBLAS.

## Precompiled Binaries

If you prefer not to build the Dlib yourself, a precompiled Dlib can be downloaded from the [releases page](https://github.com/prepkg/dlib-raspberrypi/releases).

```shell
curl -sSLo dlib.deb https://github.com/prepkg/dlib-raspberrypi/releases/latest/download/dlib-aarch64-linux-gnu.deb \
  && sudo apt install -y ./dlib.deb \
  && rm -rf dlib.deb
```

## Compilation

### Requirements

* Git
* Docker

### Instructions

* Clone the repository:

```shell
git clone https://github.com/prepkg/dlib-raspberrypi.git && cd dlib-raspberrypi
```

* Build the Docker image:

```shell
./setup.sh build-image
```

* Build the library:

```shell
./setup.sh build-lib
```

After compilation, the `deb` package will be available in the `build` directory.

* (Optional) Run the test to verify that the library links correctly and the resulting binary runs under QEMU:

```shell
./setup.sh test-lib
```
