
include ../../../Makefile.in

LIBC=/opt/cross/$(TARGET)/$(TARGET)/lib/libc.so
LIBGCC=/opt/cross/$(TARGET)/$(TARGET)/lib/libgcc_s.so.1
LIBSTDCXX=/opt/cross/$(TARGET)/$(TARGET)/lib/libstdc++.so

PKGCLEAN=src/bin/busybox src/lib/libc.so src/lib/libgcc_s.so.1 \
	src/lib/libstdc++.so*

all: ../../../boot/initrd.gz

../../../boot/initrd.gz: initrd.gz
	@ln -f $< $@

initrd.gz: $(subst *,,$(PKGCLEAN))
	@cd src && find . | cpio --quiet -H newc -o --owner=0:0 | \
		gzip -9 -n > ../initrd.gz

src/bin/busybox: ../busybox/busybox-*/busybox
	@cp -a $< $@
	@chmod u+s $@

src/lib/libc.so: $(LIBC)
	@cp -a $< $@
	@$(STRIP) $@

src/lib/libgcc_s.so.1: $(LIBGCC)
	@cp -a $< $@
	@$(STRIP) $@

src/lib/libstdc++.so: $(LIBSTDCXX)
	@cp -a $< $@
	@cp -a $<*[0-9] src/lib
	@$(STRIP) $@

../busybox/busybox-*/busybox:
	@$(MAKE) -C ../busybox
