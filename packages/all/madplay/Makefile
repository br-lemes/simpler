
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

export CFLAGS=-I$(PWD)/../zlib/.../ \
	-I$(PWD)/../libmad/.../ \
	-I$(PWD)/../libid3tag/.../

export LDFLAGS=-L$(PWD)/../zlib/.../ \
	-L$(PWD)/../libmad/.../ \
	-L$(PWD)/../libmad/.../.libs/ \
	-L$(PWD)/../libid3tag/.../ \
	-L$(PWD)/../libid3tag/.../.libs/

all: $(PKGNAME).tgz

$(PKGBUILD): $(PKGPATH)/Makefile
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

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/bin
	@cp -a $< $@/usr/bin
