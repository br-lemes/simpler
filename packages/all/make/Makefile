
PKGNAME=make
PKGVERSION=3.81
PKGFEXT=bz2
PKGCATEGORIES=devel
PKGDESC=GNU make utility to maintain groups of programs
PKGSITE=http://www.gnu.org/software/make/
PKGDOWN=http://ftp.gnu.org/gnu/make/
PKGMD5SUM=354853e0b2da90c527e35aabb8d6f1e6

PKGBUILD=$(PKGPATH)/make

include ../../../Makefile.in

all: $(PKGNAME).tgz

$(PKGNAME).d: $(PKGBUILD)
	@mkdir -p $@/usr/bin
	@cp -a $< $@/usr/bin

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@$(SEDMUSL) $(PKGPATH)/config/config.sub
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--build=$(HOST) \
		--host=$(TARGET) \
		--disable-nls \
		--disable-rpath \
		--without-libiconv-prefix \
		--without-libintl-prefix
