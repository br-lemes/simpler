
PKGNAME=busybox
PKGVERSION=1.22.1
PKGFEXT=bz2
PKGDESC=Tiny versions of many common UNIX utilities 
PKGSITE=http://www.busybox.net/
PKGDOWN=http://busybox.net/downloads/
PKGMD5SUM=337d1a15ab1cb1d4ed423168b1eb7d7e

include ../../../Makefile.in

all: $(PKGPATH)/busybox

$(PKGPATH)/.config: config-busybox
	@$(MAKE) $(PKGPATH)
	@cp $< $@

$(PKGPATH)/busybox: $(PKGPATH)/.config
	@ARCH="$(ARCH)" CROSS_COMPILE="$(TARGET)-" $(MAKE) -C $(PKGPATH) busybox

menuconfig: $(PKGPATH)/.config
	@ARCH="$(ARCH)" CROSS_COMPILE="$(TARGET)-" $(MAKE) -C $(PKGPATH) menuconfig

.PHONY: menuconfig
