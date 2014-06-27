
PKGNAME=ccache
PKGVERSION=3.1.9
PKGFEXT=xz
PKGDEPENDENCIES=zlib
PKGCATEGORIES=devel
PKGDESC=A fast C/C++ compiler cache
PKGSITE=http://ccache.samba.org/
PKGDOWN=http://samba.org/ftp/ccache/
PKGMD5SUM=522a6016bda56892653612bbdefff3e0

PKGBUILD=$(PKGPATH)/ccache

include ../../../Makefile.in

export CFLAGS=-I$(PWD)/../zlib/.../
export LDFLAGS=-L$(PWD)/../zlib/.../

all: $(PKGNAME).tgz

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--build=$(HOST) \
		--host=$(TARGET)

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGNAME).d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/bin
	@cp -a $< $@/usr/bin
	@mkdir -p $@/usr/local/bin
	@ln -s /usr/bin/ccache $@/usr/local/bin/gcc
	@ln -s /usr/bin/ccache $@/usr/local/bin/g++
	@ln -s /usr/bin/ccache $@/usr/local/bin/cc
	@ln -s /usr/bin/ccache $@/usr/local/bin/c++
