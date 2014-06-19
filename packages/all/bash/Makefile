
PKGNAME=bash
PKGVERSION=4.3
PKGFEXT=gz
PKGCATEGORIES=utilities
PKGDESC=Bourne Again Shell
PKGSITE=http://ftp.gnu.org/gnu/bash/
PKGDOWN=ftp://ftp.astron.com/pub/file/
PKGMD5SUM=e3526f59023f3f7d1ffa4d541335edab

PKGBUILD=$(PKGPATH)/bash

include ../../../Makefile.in

all: $(PKGBOOT)

$(PKGPATH)/bash: $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--host=$(TARGET) \
		--with-included-gettext

pack:
	@$(RM) -r $@
	@mkdir -p $@/usr/bin
	@cp -a $(PKGPATH)/bash $@/usr/bin
