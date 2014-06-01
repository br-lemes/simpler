
include ../../../Makefile.in

INITRD=$(shell find ../initrd/src -type f)
KERNEL=../../../linux/arch/$(ARCH)/boot/zImage
PKGCLEAN=$(KERNEL)

all: $(KERNEL)

../../../linux/.config:
	@cp config-kernel $@

$(KERNEL): $(INITRD) ../../../linux/.config
	@$(MAKE) -C ../initrd
	@$(MAKE) -C ../../../linux ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- bzImage
	@ln -f $(KERNEL) ../../../boot/kernel.img

nconfig menuconfig xconfig gconfig: ../../../linux/.config
	@$(MAKE) -C ../../../linux ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- $@

.PHONY: nconfig menuconfig xconfig gconfig
