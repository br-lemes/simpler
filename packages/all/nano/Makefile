
PKGNAME=nano
PKGVERSION=2.2.6
PKGFEXT=gz
PKGDEPENDENCIES=ncurses
PKGCATEGORIES=editors
PKGDESC=Small, friendly text editor inspired by Pico
PKGSITE=http://www.nano-editor.org/
PKGDOWN=http://www.nano-editor.org/dist/v2.2/
PKGMD5SUM=03233ae480689a008eb98feb1b599807

PKGBUILD=$(PKGPATH)/src/nano

include ../../../Makefile.in

export CFLAGS=-I$(PWD)/../ncurses/.../include/
export LDFLAGS=-L$(PWD)/../ncurses/.../lib/

all: $(PKGNAME).tgz

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@$(SEDMUSL) $(PKGPATH)/config.sub
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--build=$(SRP_HOST) \
		--host=$(SRP_TARGET) \
		--disable-nls \
		--disable-rpath \
		--disable-extra \
		--enable-utf8

$(PKGNAME).d: $(PKGBUILD)
	@mkdir -p $@/usr/bin
	@cp -a $< $@/usr/bin
