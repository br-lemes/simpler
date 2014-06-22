
PKGNAME=libid3tag
PKGVERSION=0.15.1b
PKGFEXT=gz
PKGDEPENDENCIES=zlib
PKGCATEGORIES=libraries
PKGDESC=ID3 tag reading library from the MAD project
PKGSITE=http://www.underbit.com/products/mad/
PKGDOWN=ftp://ftp.mars.org/pub/mpeg/
PKGMD5SUM=e5808ad997ba32c498803822078748c3

PKGBUILD=$(PKGPATH)/.libs/$(PKGNAME).so.0.3.0

include ../../../Makefile.in

export CFLAGS=-I$(PWD)/../zlib/.../
export LDFLAGS=-L$(PWD)/../zlib/.../

all: $(PKGBOOT)

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@$(SEDMUSL) $(PKGPATH)/config.sub
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--host=$(TARGET) \
		--disable-static \
		--disable-debugging

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/lib
	@cp -a $(PKGPATH)/.libs/$(PKGNAME).so* $@/usr/lib
