
ARCH=arm
TARGET=arm-linux-musleabihf
KERNEL=../linux/arch/$(ARCH)/boot/zImage

all: ../boot/kernel.img

$(KERNEL): ../linux/.config
	@$(MAKE) -C ../linux ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- bzImage

../boot/kernel.img: $(KERNEL)
	@ln -f $< $@

../linux/.config: config-kernel
	@cp $< $@

clean:
	@echo $(RM) $(KERNEL)
	@$(RM) $(KERNEL)

binclean:
	@$(MAKE) -C ../linux mrproper

nconfig menuconfig xconfig gconfig: ../linux/.config
	@$(MAKE) -C ../linux ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- $@

.PHONY: all clean binclean nconfig menuconfig xconfig gconfig
