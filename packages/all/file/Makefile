
PKGNAME=file
PKGVERSION=5.19
PKGFEXT=gz
PKGCATEGORIES=utilities
PKGDESC=A file type guesser
PKGSITE=http://www.darwinsys.com/file/
PKGDOWN=ftp://ftp.astron.com/pub/file/
PKGMD5SUM=e3526f59023f3f7d1ffa4d541335edab

PKGBUILD=$(PKGPATH)/src/.libs/file

include ../../../Makefile.in

all: $(PKGBOOT)

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@ $(PKGPATH)/src/.libs/libmagic.so.1.0.0

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@$(SEDMUSL) $(PKGPATH)/config.sub
	@cd $(PKGPATH) && ./configure --prefix=/usr --host=$(TARGET)

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/bin $@/usr/lib $@/usr/share/misc
	@cp -a $< $@/usr/bin
	@cp -a $(PKGPATH)/src/.libs/libmagic.so* $@/usr/lib
	@cp -a $(PKGPATH)/magic/magic.mgc $@/usr/share/misc
