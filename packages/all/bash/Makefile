
PKGNAME=bash
PKGVERSION=4.3
PKGFEXT=gz
PKGCATEGORIES=utilities
PKGDESC=Bourne Again Shell
PKGSITE=http://ftp.gnu.org/gnu/bash/
PKGDOWN=ftp://ftp.astron.com/pub/file/
PKGMD5SUM=81348932d5da294953e15d4814c74dd1

PKGBUILD=$(PKGPATH)/bash

include ../../../Makefile.in

all: $(PKGBOOT)

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--host=$(TARGET) \
		--with-included-gettext

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/bin
	@cp -a $(PKGPATH)/bash $@/usr/bin
