
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

include ../../../Makefile.in

export CFLAGS=-I$(PWD)/../zlib/.../
export LDFLAGS=-L$(PWD)/../zlib/.../

all: $(PKGBOOT)

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--build=$(HOST) \
		--host=$(TARGET) \
		--without-included-zlib

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/bin
	@cp -a $< $@/usr/bin
