
PKGNAME=madplay
PKGVERSION=0.15.2b
PKGFEXT=gz
PKGDEPENDENCIES=zlib libmad libid3tag
PKGCATEGORIES=multimedia
PKGDESC=MPEG audio player in fixed point
PKGSITE=http://www.underbit.com/products/mad/
PKGDOWN=ftp://ftp.mars.org/pub/mpeg/
PKGMD5SUM=6814b47ceaa99880c754c5195aa1aac1

PKGBUILD=$(PKGPATH)/madplay

include ../../../Makefile.in

export CFLAGS=-I$(shell readlink -f ../zlib/zlib-*/) \
	-I$(shell readlink -f ../libmad/libmad-*/) \
	-I$(shell readlink -f ../libid3tag/libid3tag-*/)

export LDFLAGS=-L$(shell readlink -f ../zlib/zlib-*/) \
	-L$(shell readlink -f ../libmad/libmad-*/) \
	-L$(shell readlink -f ../libmad/libmad-*/.libs) \
	-L$(shell readlink -f ../libid3tag/libid3tag-*/) \
	-L$(shell readlink -f ../libid3tag/libid3tag-*/.libs)

all: $(PKGBOOT)

$(PKGPATH)/madplay: $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@$(SEDMUSL) $(PKGPATH)/config.sub
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--host=$(TARGET) \
		--disable-nls \
		--disable-rpath \
		--disable-mmap \
		--disable-debugging \
		--without-alsa \
		--without-esd

pack:
	@$(RM) -r $@
	@mkdir -p $@/usr/bin
	@cp -a $(PKGPATH)/madplay $@/usr/bin
