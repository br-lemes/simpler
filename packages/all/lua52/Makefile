
PKGNAME=lua52
PKGVERSION=5.2.3
PKGPATH=lua-$(PKGVERSION)
PKGFEXT=gz
PKGCATEGORIES=devel
PKGDESC=The Programming Language Lua 5.2
PKGSITE=http://www.lua.org/
PKGDOWN=http://www.lua.org/ftp/
PKGMD5SUM=dc7f94ec6ff15c985d2d6ad0f1b35654

PKGBUILD=$(PKGPATH)/src/liblua52.so $(PKGPATH)/src/lua

include ../../../Makefile.in

all: $(PKGNAME).tgz

$(PKGBUILD):
	@$(MAKE) $(PKGPATH)
	@$(MAKE) -C $(PKGPATH)/src liblua52.so LUA_A=liblua52.so "AR=$(CC) -Wl,-E -shared -o" RANLIB="$(STRIP)" CC="$(CC)"
	@$(MAKE) -C $(PKGPATH)/src all CC="$(CC)" MYCFLAGS="-DLUA_USE_POSIX -DLUA_USEDLOPEN" MYLIBS="-Wl,-E -ldl" MYLDFLAGS=-s

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/bin $@/usr/lib
	@cp -a $(PKGPATH)/src/lua $@/usr/bin/lua52
	@cp -a $(PKGPATH)/src/liblua52.so $@/usr/lib
