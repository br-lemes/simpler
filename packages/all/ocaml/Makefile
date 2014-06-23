
PKGNAME=ocaml
PKGVERSION=4.01.0
PKGFEXT=xz
PKGCATEGORIES=devel
PKGDESC=The Caml Language
PKGSITE=http://caml.inria.fr/ocaml/
PKGDOWN=http://caml.inria.fr/pub/distrib/ocaml-4.01/
PKGMD5SUM=32015b473de16ca19b82c728358eaa78

PKGBUILD=$(PKGPATH)/ocaml

include ../../../Makefile.in

all: $(PKGNAME).tgz

$(PKGBUILD): $(PKGPATH)/config/Makefile
	@$(MAKE) -C $(PKGPATH) world.opt

$(PKGPATH)/config/Makefile:
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure \
		-prefix /usr \
		-host armv6-unknown-linux-gnueabihf \
		-as $(TARGET)-as \
		-cc $(TARGET)-gcc \
		-aspp "$(TARGET)-gcc -c"

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@$(MAKE) -C $(PKGPATH) install PREFIX="$(PWD)/$@/usr"
	@$(MAKE) -C $(PKGPATH) installopt PREFIX="$(PWD)/$@/usr"
	@touch $@
