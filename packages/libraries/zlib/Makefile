
PKGNAME=zlib
PKGVERSION=1.2.8
PKGFEXT=gz
PKGDESC=Compression Library
PKGSITE=http://zlib.net/
PKGDOWN=http://zlib.net/
PKGMD5SUM=44d667c142d7cda120332623eab69f40

PKGBUILD=$(PKGPATH)/libz.so

include ../../../Makefile.in

all: $(PKGBOOT) $(PKGNAME)-dev.tgz

$(PKGPATH)/libz.so:
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure --prefix=/usr 
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

pack:
	@$(RM) -r $@
	@mkdir -p $@/usr/lib
	@cp -a $(PKGPATH)/libz.so* $@/usr/lib

pack-dev:
	@$(RM) -r $@
	@mkdir -p $@/usr/include $@/usr/lib
	@cp -a $(PKGPATH)/zconf.h $(PKGPATH)/zlib.h $@/usr/include
	@cp -a $(PKGPATH)/libz.a $@/usr/lib
