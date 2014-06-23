
PKGNAME=unison
PKGVERSION=2.40.102
PKGFEXT=gz
PKGCATEGORIES=utilities
PKGDESC=A file-synchronization tool for Unix and Windows
PKGSITE=http://www.cis.upenn.edu/~bcpierce/unison/
PKGDOWN=http://www.seas.upenn.edu/~bcpierce/unison/download/releases/$(PKGNAME)-$(PKGVERSION)/
PKGMD5SUM=42caf869f40440ed0e75eef07a605b2e

PKGBUILD=$(PKGPATH)/unison

include ../../../Makefile.in

all: $(PKGNAME).tgz

$(PKGBUILD):
	@$(MAKE) $(PKGPATH)
	@$(MAKE) -C $(PKGPATH) UISTYLE=text ETAGS=true
	@$(STRIP) $@

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/bin
	@cp -a $< $@/usr/bin
