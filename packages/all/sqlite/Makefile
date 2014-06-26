
PKGNAME=sqlite
PKGVERSION=3.8.5
PKGPATH=sqlite-autoconf-3080500
PKGFEXT=gz
PKGNAMVER=$(PKGNAME)-$(PKGVERSION)
PKGCATEGORIES=libraries utilities
PKGDESC=SQLite is a C library that implements an SQL database
PKGSITE=http://www.sqlite.org/
PKGDOWN=http://www.sqlite.org/2014/
PKGMD5SUM=0544ef6d7afd8ca797935ccc2685a9ed

PKGBUILD=$(PKGPATH)/.libs/sqlite3 $(PKGPATH)/.libs/libsqlite3.so.0.8.6

include ../../../Makefile.in

all: $(PKGNAME).tgz lib$(PKGNAME).tgz

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@$(SEDMUSL) $(PKGPATH)/config.sub
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--host=$(TARGET) \
		--disable-static \
		--disable-readline

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGNAME).tgz: PKGCATEGORIES=utilities
$(PKGNAME).d: $(PKGPATH)/.libs/sqlite3
	@$(RM) -r $@
	@mkdir -p $@/usr/bin
	@cp -a $(PKGPATH)/.libs/sqlite3 $@/usr/bin

lib$(PKGNAME).tgz: PKGCATEGORIES=libraries
lib$(PKGNAME).d: $(PKGPATH)/.libs/libsqlite3.so.0.8.6
	@$(RM) -r $@
	@mkdir -p $@/usr/lib
	@cp -a $(PKGPATH)/.libs/libsqlite3.so* $@/usr/lib
