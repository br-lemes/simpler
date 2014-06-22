
PKGNAME=libmad
PKGVERSION=0.15.1b
PKGFEXT=gz
PKGCATEGORIES=libraries
PKGDESC=MPEG audio decoder library
PKGSITE=http://www.underbit.com/products/mad/
PKGDOWN=ftp://ftp.mars.org/pub/mpeg/
PKGMD5SUM=1be543bc30c56fb6bea1d7bf6a64e66c

PKGBUILD=$(PKGPATH)/.libs/$(PKGNAME).so.0.2.1

include ../../../Makefile.in

all: $(PKGNAME).tgz

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@$(SEDMUSL) $(PKGPATH)/config.sub
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--host=$(TARGET) \
		--disable-static \
		--disable-debugging \
		--enable-speed \
		--enable-fpm=arm

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/lib
	@cp -a $(PKGPATH)/.libs/$(PKGNAME).so* $@/usr/lib
