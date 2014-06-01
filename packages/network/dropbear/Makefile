
PKGNAME=dropbear
PKGVERSION=2013.62
PKGFEXT=bz2
PKGDESC=Dropbear is a relatively small SSH server and client 
PKGSITE=https://matt.ucc.asn.au/dropbear/dropbear.html
PKGDOWN=https://matt.ucc.asn.au/dropbear/
PKGMD5SUM=ca2c7932a1399cf361f795aaa3843998

PKGBUILD=src/usr/bin/dropbearmulti
PKGCLEAN=$(PKGBUILD)

include ../../../Makefile.in

all: $(PKGBOOT)

src/usr/bin/dropbearmulti: $(PKGPATH)/dropbearmulti
	@cp -a $< $@

$(PKGPATH)/Makefile:
	@$(MAKE) -C ../../libraries/zlib
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--build=$(HOST) \
		--host=$(TARGET) \
		--with-zlib=$(shell readlink -f ../../libraries/zlib/zlib-*/)
	
$(PKGPATH)/dropbearmulti: $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH) SCPPROGRESS=1 MULTI=1 PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
	@$(STRIP) $@

pack:
	@if [ ! -L pack ]; then ln -sf src pack; fi
