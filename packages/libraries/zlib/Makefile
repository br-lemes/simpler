
PKGNAME=zlib
PKGVERSION=1.2.8
PKGFEXT=gz
PKGDESC=Compression Library
PKGSITE=http://zlib.net/
PKGDOWN=http://zlib.net/
PKGMD5SUM=44d667c142d7cda120332623eab69f40

PKGBUILD=$(PKGPATH)/libz.so

include ../../../Makefile.in

all: $(PKGBOOT)

$(PKGPATH)/libz.so:
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure --prefix=/usr 
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

pack: $(PKGPATH)/libz.so
	@mkdir -p pack/usr/lib
	@cp -a $<* pack/usr/lib
