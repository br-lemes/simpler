#!/bin/sh
#
# Config file for musl-cross <https://github.com/GregorR/musl-cross>
# You'll need a cross-compiler to build simpler and musl-cross
# can do it for you. There's no need for musl-cross if you're using
# simpler to build itself.
#
# To build a cross-compiler follow these steps:
#
# git clone https://github.com/raspberrypi/linux.git
# git clone https://github.com/GregorR/musl-cross.git
# cd musl-cross
# cp ../config.sh .
# ln -s ../linux linux-rpi
# ./build

touch "$MUSL_CC_BASE/tarballs/linux-rpi.tar.xz"
touch linux-rpi/extracted

LINUX_HEADERS_VERSION=rpi
MUSL_VERSION=1.0.1
GCC_BUILTIN_PREREQS=yes

ARCH=arm
TRIPLE=arm-linux-musleabihf
GCC_BOOTSTRAP_CONFFLAGS="--with-arch=armv6zk --with-float=hard --with-fpu=vfp"
GCC_CONFFLAGS="--with-arch=armv6zk --with-float=hard --with-fpu=vfp"

CC_BASE_PREFIX=/opt/cross

MAKEFLAGS=-j8

# Enable this to build the bootstrap gcc (thrown away) without optimization, to reduce build time
GCC_STAGE1_NOOPT=1
