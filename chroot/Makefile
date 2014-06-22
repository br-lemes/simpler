
INITRD=../packages/all/initrd
INITRAMFS=../linux/usr/initramfs_data.cpio.gz

all:
	@$(MAKE) -C $(INITRD)
	@if [ ! -e $(INITRAMFS) ]; then $(MAKE) -C ../kernel; fi
	@mkdir -p build
	@$(MAKE) -s build

qemu-arm-static:
	$(error ERROR: you need a $@ binary)

build: qemu-arm-static
ifeq ($(shell id -u), 0)
	@mount -t tmpfs tmpfs $@
	@cd $@ && gunzip -c ../$(INITRAMFS) | cpio -i --quiet
	@mkdir -p $@/boot $@/opt/simpler
	@mount --bind ../boot $@/boot
	@mount --bind .. $@/opt/simpler
	@cp -a --no-preserve=ownership $(INITRD)/src/* $@
	@install -D qemu-arm-static $@/usr/bin/qemu-arm-static
	@-chroot $@ /etc/rc.d/rc.sysinit
	@-umount $@/boot
	@-umount $@/opt/simpler
	@umount $@
else
	@sudo $(MAKE) $@
endif

clean:
	$(RM) -r build

.PHONY: all build clean
