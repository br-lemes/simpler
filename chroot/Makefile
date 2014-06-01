
INITRD=../packages/boot/initrd

all:
	@$(MAKE) -C $(INITRD)
	@mkdir -p build
	@$(MAKE) -s build

qemu-arm-static:
	$(error ERROR: you need a $@ binary)

build: qemu-arm-static
ifeq ($(shell id -u), 0)
	@mount -t tmpfs tmpfs $@
	@mkdir -p $@/boot
	@mount --bind ../boot $@/boot
	@cp -a --no-preserve=ownership $(INITRD)/src/* $@
	@install -D qemu-arm-static $@/usr/bin/qemu-arm-static
	@-chroot $@ /etc/rc.d/rc.sysinit
	@-umount $@/boot
	@umount $@
else
	@sudo $(MAKE) $@
endif

clean:
	$(RM) -r build

.PHONY: all build clean
