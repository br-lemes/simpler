
PKGNAME=dropbear
PKGVERSION=2014.63
PKGFEXT=bz2
PKGDEPENDENCIES=zlib
PKGCATEGORIES=network
PKGDESC=Dropbear is a relatively small SSH server and client 
PKGSITE=https://matt.ucc.asn.au/dropbear/dropbear.html
PKGDOWN=https://matt.ucc.asn.au/dropbear/
PKGMD5SUM=7066bb9a2da708f3ed06314fdc9c47fd

PKGBUILD=src/usr/bin/dropbearmulti
PKGCLEAN=$(PKGBUILD)

include ../../../Makefile.in

all: $(PKGBOOT)

src/usr/bin/dropbearmulti: $(PKGPATH)/dropbearmulti
	@cp -a $< $@

$(PKGPATH)/Makefile: $(PKGDEPENDENCIES)
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--build=$(HOST) \
		--host=$(TARGET) \
		--with-zlib=$(shell readlink -f ../zlib/zlib-*/)
	
$(PKGPATH)/dropbearmulti: $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH) SCPPROGRESS=1 MULTI=1 PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
	@$(STRIP) $@

pack:
	@if [ ! -L pack ]; then ln -sf src pack; fi
