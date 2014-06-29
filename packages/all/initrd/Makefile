
PKGNAME=initrd
PKGVERSION=$(shell date +%F)
PKGCATEGORIES=system
PKGDESC=A simple and minimalist Linux distribution
PKGSITE=http://www.br-lemes.net/

include ../../../Makefile.in

LIBC=/opt/cross/$(TARGET)/$(TARGET)/lib/libc.so
LIBGCC=/opt/cross/$(TARGET)/$(TARGET)/lib/libgcc_s.so.1
LIBSTDCXX=/opt/cross/$(TARGET)/$(TARGET)/lib/libstdc++.so

PKGCLEAN=initrd.gz src/bin/busybox src/lib/libc.so src/lib/libgcc_s.so.1 \
	src/lib/libstdc++.so*

all: ../../../boot/initrd.gz

../../../boot/initrd.gz: initrd.gz
	@ln -f $< $@

initrd.gz: $(subst *,,$(PKGCLEAN))
	@mkdir -p src/var/lib/lrpkg
	@printf "\
DESCRIPTION='$(PKGDESC)'\n\
CATEGORIES='$(PKGCATEGORIES)'\n\
VERSION='$(PKGVERSION)'\n\
BUILD='$$(date "+%F %T")'\n" > src/var/lib/lrpkg/initrd.info
	@touch src/var/lib/lrpkg/initrd.list
	@find src/ -type f -o -type l | sed "s,src/,," > src/var/lib/lrpkg/initrd.list
	@cd src && cat var/lib/lrpkg/initrd.list | \
		cpio --quiet -H newc -o --owner=0:0 | \
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
