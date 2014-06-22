
PKGNAME=binutils
PKGVERSION=2.24
PKGFEXT=bz2
PKGCATEGORIES=devel
PKGDESC=The GNU Binary Tools
PKGSITE=http://www.gnu.org/software/binutils/
PKGDOWN=http://ftp.gnu.org/gnu/binutils/
PKGMD5SUM=e0f71a7b2ddab0f8612336ac81d9636b

PKGBCLEAN=build

include ../../../Makefile.in

all: $(PKGNAME).tgz

$(PKGNAME).d: build
	@$(MAKE) -C build DESTDIR=$(PWD)/$@ install
	@$(STRIP) $@/usr/bin/*
	@$(RM) -r $@/usr/include $@/usr/lib $@/usr/share

build: build/Makefile
	@$(MAKE) -C build
	@touch $@

build/Makefile:
	@$(MAKE) $(PKGPATH)
	@mkdir -p build
	@sed -i -e 's,MAKEINFO="$MISSING makeinfo",MAKEINFO=true,g' \
		$(PKGPATH)/configure
	@cd build && ../$(PKGPATH)/configure \
		--prefix=/usr \
		--build=$(HOST) \
		--host=$(TARGET) \
		--target=$(TARGET) \
		--disable-nls \
		--disable-multilib \
		--disable-werror
