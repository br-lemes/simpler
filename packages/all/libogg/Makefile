
PKGNAME=libogg
PKGVERSION=1.3.1
PKGFEXT=xz
PKGCATEGORIES=libraries
PKGDESC=Libogg is a library for manipulating ogg bitstreams
PKGSITE=https://www.xiph.org/ogg/
PKGDOWN=http://downloads.xiph.org/releases/ogg/
PKGMD5SUM=ca25d8da0ddfc8c6cbbf78d847a209fe

PKGBUILD=$(PKGPATH)/src/.libs/$(PKGNAME).so.0.8.1

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
		--disable-static

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/lib
	@cp -a $(PKGPATH)/src/.libs/$(PKGNAME).so* $@/usr/lib
