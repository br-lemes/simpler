
PKGNAME=samba
PKGVERSION=3.6.23
PKGFEXT=gz
PKGCATEGORIES=network
PKGDESC=SMB/CIFS file sharing
PKGSITE=http://www.samba.org/
PKGDOWN=http://www.samba.org/samba/ftp/stable/
PKGMD5SUM=2f7aee1dc5d31aefcb364600915b31dc

export CFLAGS=-I$(shell readlink -f ../zlib/zlib-*/)
export LDFLAGS=-L$(shell readlink -f ../zlib/zlib-*/)
export samba_cv_CC_NEGATIVE_ENUM_VALUES=yes
export libreplace_cv_HAVE_GETADDRINFO=no
export ac_cv_file__proc_sys_kernel_core_pattern=yes

SMBPASSWD=$(PKGPATH)/source3/bin/smbpasswd
DEST_SMBPASSWD=src/usr/bin/smbpasswd
MAKEFILE=$(PKGPATH)/source3/Makefile
SMBD=$(PKGPATH)/source3/bin/smbd
DEST_SMBD=src/usr/sbin/smbd
NMBD=$(PKGPATH)/source3/bin/nmbd
DEST_NMBD=src/usr/sbin/nmbd
LIBS=$(PKGPATH)/source3/bin/libtalloc.so* \
	$(PKGPATH)/source3/bin/libtdb.so* \
	$(PKGPATH)/source3/bin/libtevent.so*
DEST_LIBS=src/usr/lib/libtalloc.so* src/usr/lib/libtdb.so* src/usr/lib/libtevent.so*
DEST_LIBTALLOC=src/usr/lib/libtalloc.so
DEST_LIBTDB=src/usr/lib/libtdb.so
DEST_LIBTEVENT=src/usr/lib/libtevent.so

PKGCLEAN=$(DEST_SMBD) $(DEST_NMBD) $(DEST_SMBPASSWD) $(DEST_LIBS)
PKGBUILD=$(DEST_SMBD) $(DEST_NMBD) $(DEST_SMBPASSWD) $(DEST_LIBTALLOC) $(DEST_LIBTDB) $(DEST_LIBTEVENT) \
	$(shell find src -type f -not -path 'src/var/lib/lrpkg/*')

include ../../../Makefile.in

all: $(PKGBOOT)

$(DEST_SMBD): $(SMBD) src/usr/sbin
	@cp -a $< $@

$(DEST_NMBD): $(NMBD) src/usr/sbin
	@cp -a $< $@

$(DEST_SMBPASSWD): $(SMBPASSWD) src/usr/bin
	@cp -a $< $@

$(DEST_LIBTALLOC): $(PKGPATH)/source3/bin/libtalloc.so src/usr/lib
	@cp -a $<* src/usr/lib

$(DEST_LIBTDB): $(PKGPATH)/source3/bin/libtdb.so src/usr/lib
	@cp -a $<* src/usr/lib

$(DEST_LIBTEVENT): $(PKGPATH)/source3/bin/libtevent.so src/usr/lib
	@cp -a $<* src/usr/lib

src/usr/bin:
	@mkdir -p $@

src/usr/sbin:
	@mkdir -p $@

src/usr/lib:
	@mkdir -p $@

$(SMBD):
	@$(MAKE) $(MAKEFILE)
	@$(MAKE) -C $(PKGPATH)/source3 bin/smbd
	@$(STRIP) $@

$(NMBD):
	@$(MAKE) $(MAKEFILE)
	@$(MAKE) -C $(PKGPATH)/source3 bin/nmbd
	@$(STRIP) $@

$(SMBPASSWD):
	@$(MAKE) $(MAKEFILE)
	@$(MAKE) -C $(PKGPATH)/source3 bin/smbpasswd
	@$(STRIP) $@

$(MAKEFILE):
	@$(MAKE) $(PKGPATH)
	@$(SEDMUSL) $(PKGPATH)/source3/config.sub
	@cd $(PKGPATH)/source3 && ./configure \
		--prefix=/usr \
		--build=$(HOST) \
		--host=$(TARGET) \
		--target=$(TARGET) \
		--with-fhs \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--with-piddir=/var/run \
		--disable-swat \
		--disable-smbtorture4 \
		--disable-cups \
		--disable-iprint \
		--disable-pie \
		--disable-relro \
		--disable-as-needed \
		--disable-external-libtalloc \
		--disable-external-libtevent \
		--disable-external-libtdb \
		--disable-fam \
		\
		--without-dmapi \
		--without-ldap \
		--without-ads \
		--without-dnsupdate \
		--without-pam \
		--without-pam_smbpass \
		--without-sys-quotas \
		--without-cluster-support \
		--without-acl-support \
		--without-sendfile-support \
		--without-winbind \
		\
		--with-included-popt \
		--with-included-iniparser

pack:
	@if [ ! -L pack ]; then ln -sf src pack; fi
