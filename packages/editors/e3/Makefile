
PKGNAME=e3
PKGVERSION=2.7.1
PKGFEXT=gz
PKGCATEGORIES=editors
PKGDESC=A mini text editor
PKGSITE=https://sites.google.com/site/e3editor/
PKGDOWN=https://sites.google.com/site/e3editor/Home/
PKGMD5SUM=ed7146706579bf0e40c6de258fc44f25

PKGBUILD=src/usr/bin/e3
PKGCLEAN=$(PKGBUILD)

include ../../../Makefile.in

CD=cd $(PKGPATH)/armlinux
E3=$(PKGPATH)/armlinux/e3
E3_O=$(PKGPATH)/armlinux/e3.o
E3_S=$(PKGPATH)/armlinux/e3.s
EMULAYER_O=$(PKGPATH)/armlinux/emulayer.o
EMULAYER_S=$(PKGPATH)/armlinux/emulayer.s

all: $(PKGBOOT)

src/usr/bin/e3: $(E3)
	@cp -a $< $@

$(E3): $(E3_O) $(EMULAYER_O)
	@$(CD) && $(LD) e3.o emulayer.o -o e3
	@$(STRIP) $@

$(E3_S):
	@$(MAKE) $(PKGPATH)

$(E3_O): $(E3_S)
	@$(CD) && $(AS) --defsym LINUX=1 --defsym ARMCPU=1 e3.s -o e3.o

$(EMULAYER_O): $(EMULAYER_S)
	@$(MAKE) $(PKGPATH)
	@$(CD) && $(AS) --defsym LINUX=1 --defsym ARMCPU=1 emulayer.s -o emulayer.o

pack:
	@if [ ! -L pack ]; then ln -sf src pack; fi

#~ $(E3)
#~ @mkdir -p pack/usr/bin
#~ @cp -a $< pack/usr/bin
