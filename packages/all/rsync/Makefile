
PKGNAME=rsync
PKGVERSION=3.1.0
PKGFEXT=gz
PKGDEPENDENCIES=zlib
PKGCATEGORIES=network
PKGDESC=Fast incremental file transfer
PKGSITE=http://rsync.samba.org/
PKGDOWN=http://rsync.samba.org/ftp/rsync/src/
PKGMD5SUM=3be148772a33224771a8d4d2a028b132

PKGBUILD=$(PKGPATH)/rsync
PKGCLEAR=$(PKGBUILD)

export CFLAGS=-I$(shell readlink -f ../zlib/zlib-*/)
export LDFLAGS=-L$(shell readlink -f ../zlib/zlib-*/)

include ../../../Makefile.in

all: $(PKGBOOT)

$(PKGPATH)/Makefile:
	@$(MAKE) -C ../zlib
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--build=$(HOST) \
		--host=$(TARGET) \
		--without-included-zlib

$(PKGPATH)/rsync: $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

pack: $(PKGPATH)/rsync
	@mkdir -p pack/usr/bin
	@cp -a $< pack/usr/bin
