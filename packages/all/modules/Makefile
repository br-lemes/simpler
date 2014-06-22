
PKGNAME=modules
PKGVERSION=$(shell $(MAKE) -sC ../../../linux kernelversion)
PKGCATEGORIES=system
PKGDESC=The Linux Kernel
PKGSITE=https://github.com/raspberrypi/linux

include ../../../Makefile.in

all: $(PKGNAME).tgz

../../../linux/.config: ../../../kernel/config-kernel
	@cp $< $@

$(PKGNAME).d: ../../../linux/.config
	@$(MAKE) -C ../../../linux ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- \
		INSTALL_MOD_PATH=$(PWD)/$@ modules modules_install
	@find $@ -type l -delete
