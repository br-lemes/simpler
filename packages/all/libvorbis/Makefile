
PKGNAME=libvorbis
PKGVERSION=1.3.4
PKGFEXT=xz
PKGDEPENDENCIES=libogg
PKGCATEGORIES=libraries
PKGDESC=The Vorbis General Audio Compression
PKGSITE=https://www.xiph.org/vorbis/
PKGDOWN=http://downloads.xiph.org/releases/vorbis/
PKGMD5SUM=55f2288055e44754275a17c9a2497391

LIBVORBIS=$(PKGPATH)/lib/.libs/$(PKGNAME).so.0.4.7
LIBVORBISFILE=$(PKGPATH)/lib/.libs/$(PKGNAME)file.so.3.3.6
LIBVORBISENC=$(PKGPATH)/lib/.libs/$(PKGNAME)enc.so.2.0.10

PKGBUILD=$(LIBVORBIS) $(LIBVORBISFILE) $(LIBVORBISENC)

include ../../../Makefile.in

export OGG_CFLAGS=-I$(PWD)/../libogg/.../include/
export OGG_LIBS=-L$(PWD)/../libogg/.../src/.libs/ -logg

all: $(PKGNAME).tgz $(PKGNAME)file.tgz $(PKGNAME)enc.tgz

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
		--disable-docs \
		--disable-examples

$(PKGNAME).d $(PKGNAME)file.d $(PKGNAME)enc.d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/lib
	@cp -a $(PKGPATH)/lib/.libs/$(basename $@).so* $@/usr/lib
