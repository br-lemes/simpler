
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

export LUA_CFLAGS=-I$(PWD)/../lua52/.../src/
export LUA_LIBS=-L$(PWD)/../lua52/.../src/ -llua
export LD_LIBRARY_PATH=$(PWD)/../lua52/.../src/

all: $(PKGNAME).tgz

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) -C ../lua52
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure --with-lua --host=$(TARGET)

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/bin
	@cp -a $< $@/usr/bin
