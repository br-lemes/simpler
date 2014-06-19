
PKGNAME=lua51
PKGVERSION=5.1.5
PKGPATH=lua-$(PKGVERSION)
PKGFEXT=gz
PKGCATEGORIES=devel
PKGDESC=The Programming Language Lua 5.1
PKGSITE=http://www.lua.org/
PKGDOWN=http://www.lua.org/ftp/
PKGMD5SUM=2e115fe26e435e33b0d5c022e4490567

PKGBUILD=$(PKGPATH)/src/liblua5.1.so $(PKGPATH)/src/lua

include ../../../Makefile.in

all: $(PKGBOOT)

$(PKGPATH)/src/liblua5.1.so:
	@$(MAKE) $(PKGPATH)
	@$(MAKE) -C $(PKGPATH)/src liblua5.1.so LUA_A=liblua5.1.so "AR=$(CC) -Wl,-E -shared -o" RANLIB="$(STRIP)" CC="$(CC)"

$(PKGPATH)/src/lua:
	@$(MAKE) $(PKGPATH)
	@$(MAKE) -C $(PKGPATH)/src all CC="$(CC)" MYCFLAGS="-DLUA_USE_POSIX -DLUA_USEDLOPEN" MYLIBS="-Wl,-E -ldl" MYLDFLAGS=-s

pack:
	@$(RM) -r $@
	@mkdir -p $@/usr/bin $@/usr/lib
	@cp -a $(PKGPATH)/src/lua $@/usr/bin/lua5.1
	@cp -a $(PKGPATH)/src/liblua5.1.so $@/usr/lib
