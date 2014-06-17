
PKGNAME=modules
PKGVERSION=$(shell $(MAKE) -sC ../../../linux kernelversion)
PKGCATEGORIES=system
PKGDESC=The Linux Kernel
PKGSITE=https://github.com/raspberrypi/linux

include ../../../Makefile.in

PKGBUILD=$(shell readlink -f pack)

all: $(PKGBOOT)

../../../linux/.config: config-kernel
	@cp $< $@

pack: ../../../linux/.config
	@$(MAKE) -C ../../../linux ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- \
		INSTALL_MOD_PATH=$(PWD)/pack modules modules_install
	@find pack -type l -delete
