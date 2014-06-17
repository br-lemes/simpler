
PKGNAME=nano
PKGVERSION=2.2.6
PKGFEXT=gz
PKGDEPENDENCIES=ncurses
PKGCATEGORIES=libraries
PKGDESC=Fast incremental file transfer
PKGSITE=http://www.nano-editor.org/
PKGDOWN=http://www.nano-editor.org/dist/v2.2/
PKGMD5SUM=03233ae480689a008eb98feb1b599807

PKGBUILD=$(PKGPATH)/src/nano

include ../../../Makefile.in

export CFLAGS=-I$(shell readlink -f ../ncurses/ncurses-*/include)
export LDFLAGS=-L$(shell readlink -f ../ncurses/ncurses-*/lib)

all: $(PKGBOOT)

$(PKGPATH)/src/nano: $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) -C ../ncurses
	@$(MAKE) $(PKGPATH)
	@sed -i 's/linux-newlib/linux-musl/' $(PKGPATH)/config.sub
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--build=$(SRP_HOST) \
		--host=$(SRP_TARGET) \
		--disable-nls \
		--disable-rpath \
		--disable-extra \
		--enable-utf8

pack:
	@mkdir -p pack/usr/bin
	@cp -a $(PKGPATH)/src/nano pack/usr/bin
