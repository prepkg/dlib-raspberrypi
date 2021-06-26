# dlib-raspberrypi

![dlib-raspberrypi](https://i.ibb.co/JCYH1V5/dlib-raspberrypi.png)

Precompiled **Dlib 19.22** binaries for **Raspberry Pi 3 & 4**.

## Supported features

* NEON optimization
* Linked with OpenBLAS library
* Python 2 and Python 3 bindings

## Prerequisites

### Supported Boards

* Raspberry Pi 3 Model A+
* Raspberry Pi 3 Model B+
* Raspberry Pi 4 Model B

Tested on Raspberry Pi 4 Model B (8 GB).

### Supported OS

* Raspberry Pi OS Buster (32-bit)

## Install

* `wget https://github.com/prepkg/dlib-raspberrypi/releases/latest/download/dlib.deb`
* `sudo apt install -y ./dlib.deb`

## Uninstall

* `sudo apt purge --autoremove -y dlib`

## Debian Package

Debian package contains the following shared libraries:

| Library                     | Description                                                            |
| :-------------------------  | :--------------------------------------------------------------------- |
| libdlib.so                  | Modern C++ toolkit containing machine learning algorithms and tools    |

## Reference

1. [Dlib repository](https://github.com/davisking/dlib)
