# dlib-raspberrypi

![dlib-raspberrypi](https://i.ibb.co/9vNbKS6/dlib-raspberrypi.png)

Precompiled **Dlib 19.24** binaries for **Raspberry Pi 3 & 4**.
Read the following [blog post](https://lindevs.com/install-precompiled-dlib-on-raspberry-pi) for additional information.

## Supported features

* NEON optimization
* Linked with OpenBLAS library
* Python 3 bindings

## Prerequisites

### Supported Boards

* Raspberry Pi 3 Model A+
* Raspberry Pi 3 Model B+
* Raspberry Pi 4 Model B

Tested on Raspberry Pi 4 Model B (8 GB).

### Supported OS

* Raspberry Pi OS Bullseye (32-bit and 64-bit)

## Install

* 32-bit:

```shell
wget https://github.com/prepkg/dlib-raspberrypi/releases/latest/download/dlib.deb
```

```shell
sudo apt install -y ./dlib.deb
```

* 64-bit:

```shell
wget https://github.com/prepkg/dlib-raspberrypi/releases/latest/download/dlib_64.deb
```

```shell
sudo apt install -y ./dlib_64.deb
```

## Uninstall

```shell
sudo apt purge --autoremove -y dlib
```

## Debian Package

Debian package contains the following shared libraries:

| Library                     | Description                                                            |
|:----------------------------|:-----------------------------------------------------------------------|
| libdlib.so                  | Modern C++ toolkit containing machine learning algorithms and tools    |

## Reference

1. [Dlib repository](https://github.com/davisking/dlib)
