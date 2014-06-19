
PKGNAME=haserl
PKGVERSION=0.9.33
PKGFEXT=gz
PKGCATEGORIES=devel
PKGDESC=A cgi scripting program for embedded environments
PKGSITE=http://haserl.sourceforge.net/
PKGDOWN=http://sourceforge.net/projects/haserl/files/haserl-devel/
PKGMD5SUM=a9decddb508944d56f71dd2f821e2ec5

PKGBUILD=$(PKGPATH)/src/haserl

include ../../../Makefile.in

export LUA_CFLAGS=-I$(shell readlink -f ../lua52/lua-*/src)
export LUA_LIBS=-L$(shell readlink -f ../lua52/lua-*/src) -llua
export LD_LIBRARY_PATH=$(shell readlink -f ../lua52/lua-*/src)

all: $(PKGBOOT)

$(PKGPATH)/src/haserl: $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure --with-lua --host=$(TARGET)

pack:
	@$(RM) -r $@
	@mkdir -p $@/usr/bin
	@cp -a $(PKGPATH)/src/haserl $@/usr/bin
