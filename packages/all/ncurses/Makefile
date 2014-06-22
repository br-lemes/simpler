
PKGNAME=ncurses
PKGVERSION=5.9
PKGFEXT=gz
PKGCATEGORIES=libraries
PKGDESC=The Ncurses (new curses) library for terminal handling
PKGSITE=http://www.gnu.org/software/ncurses/
PKGDOWN=http://ftp.gnu.org/pub/gnu/ncurses/
PKGMD5SUM=8cb9c412e5f2d96bc6f459aa8c6282a1

LIBFORM=$(PKGPATH)/lib/libformw.so.$(PKGVERSION)
LIBMENU=$(PKGPATH)/lib/libmenuw.so.$(PKGVERSION)
LIBNCURSES=$(PKGPATH)/lib/libncursesw.so.$(PKGVERSION)
LIBPANEL=$(PKGPATH)/lib/libpanelw.so.$(PKGVERSION)

PKGBUILD=$(LIBFORM) $(LIBMENU) $(LIBNCURSES) $(LIBPANEL)

include ../../../Makefile.in

all: $(PKGBOOT)

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $(PKGBUILD)

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@$(SEDMUSL) $(PKGPATH)/config.sub
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--build=$(SRP_HOST) \
		--host=$(SRP_TARGET) \
		--without-cxx \
		--without-cxx-binding \
		--with-shared \
		--without-normal \
		--without-debug \
		--disable-pc-files \
		--enable-widec

$(PKGNAME).d: $(PKGBUILD)
	@mkdir -p $@/usr/lib
	@cp -a $(PKGPATH)/lib/* $@/usr/lib
	@$(MAKE) -C $(PKGPATH)/misc install.data DESTDIR=$(PWD)/$@
	@touch $@
