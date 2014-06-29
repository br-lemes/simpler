
ARCH=arm
TARGET=arm-linux-musleabihf
KERNEL=../linux/arch/$(ARCH)/boot/zImage

all: ../boot/kernel.img

$(KERNEL): ../linux/.config
	@$(MAKE) kernel.info
	@$(MAKE) -C ../linux ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- bzImage

kernel.info:
	@printf "\
DESCRIPTION='The Linux Kernel'\n\
VERSION='$(shell $(MAKE) -sC ../linux kernelversion)'\n\
BUILD='$$(date "+%F %T")'\n" > $@

../boot/kernel.img: $(KERNEL)
	@ln -f $< $@

../linux/.config: config-kernel
	@cp $< $@

clean:
	@echo $(RM) $(KERNEL) kernel.info
	@$(RM) $(KERNEL) kernel.info

binclean:
	@echo $(RM) kernel.info
	@$(RM) kernel.info
	@$(MAKE) -C ../linux mrproper

downclean: binclean

nconfig menuconfig xconfig gconfig: ../linux/.config
	@$(MAKE) -C ../linux ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- $@

.PHONY: all clean binclean nconfig menuconfig xconfig gconfig kernel.info
