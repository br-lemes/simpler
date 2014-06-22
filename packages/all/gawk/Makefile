
PKGNAME=gawk
PKGVERSION=4.1.1
PKGFEXT=xz
PKGCATEGORIES=utilities
PKGDESC=GNU awk, a pattern scanning and processing language
PKGSITE=http://www.gnu.org/software/gawk/
PKGDOWN=http://ftp.gnu.org/gnu/gawk/
PKGMD5SUM=a2a26543ce410eb74bc4a508349ed09a

PKGBUILD=$(PKGPATH)/gawk

include ../../../Makefile.in

all: $(PKGBOOT)

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--build=$(HOST) \
		--host=$(TARGET) \
		--disable-lint \
		--disable-nls \
		--disable-rpath \
		--without-libiconv-prefix \
		--without-libintl-prefix \
		--without-libsigsev-prefix \
		--without-readline \
		--without-mpfr

$(PKGNAME).d: $(PKGBUILD)
	@mkdir -p $@/usr/bin
	@cp -a $< $@/usr/bin
