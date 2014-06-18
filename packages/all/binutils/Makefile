
PKGNAME=binutils
PKGVERSION=2.24
PKGFEXT=bz2
PKGCATEGORIES=devel
PKGDESC=The GNU Binary Tools
PKGSITE=http://www.gnu.org/software/binutils/
PKGDOWN=http://ftp.gnu.org/gnu/binutils/
PKGMD5SUM=e0f71a7b2ddab0f8612336ac81d9636b

PKGBUILD=build
PKGBCLEAN=build

include ../../../Makefile.in

all: $(PKGBOOT)

pack:
	@$(MAKE) -C build DESTDIR=$(PWD)/pack install
	@$(STRIP) pack/usr/bin/*
	@$(RM) -r pack/usr/include pack/usr/lib pack/usr/share

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
