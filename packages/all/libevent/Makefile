
PKGNAME=libevent
PKGVERSION=2.0.21
PKGPATH=$(PKGNAME)-$(PKGVERSION)-stable
PKGFEXT=gz
PKGCATEGORIES=libraries
PKGDESC=An event notification library
PKGSITE=http://libevent.org/
PKGDOWN=https://github.com/downloads/libevent/libevent/
PKGMD5SUM=b2405cc9ebf264aa47ff615d9de527a2

LIBEVENT=$(PKGPATH)/.libs/libevent-2.0.so.5.1.9
LIBEVENT_CORE=$(PKGPATH)/.libs/libevent_core-2.0.so.5.1.9
LIBEVENT_EXTRA=$(PKGPATH)/.libs/libevent_extra-2.0.so.5.1.9
LIBEVENT_PTHREADS=$(PKGPATH)/.libs/libevent_pthreads-2.0.so.5.1.9

PKGBUILD=$(LIBEVENT) $(LIBEVENT_CORE) $(LIBEVENT_EXTRA) $(LIBEVENT_PTHREADS)

include ../../../Makefile.in

all: $(PKGNAME).tgz \
	$(PKGNAME)_core.tgz \
	$(PKGNAME)_extra.tgz \
	$(PKGNAME)_pthreads.tgz

$(PKGBUILD): $(PKGPATH)/Makefile
	@$(MAKE) -C $(PKGPATH)
	@$(STRIP) $@

$(PKGPATH)/Makefile:
	@$(MAKE) $(PKGPATH)
	@$(SEDMUSL) $(PKGPATH)/config.sub
	@cd $(PKGPATH) && ./configure \
		--prefix=/usr \
		--host=$(TARGET) \
		--disable-openssl \
		--disable-debug-mode \
		--disable-libevent-regress \
		--disable-static

$(PKGNAME).d:
	@$(RM) -r $@
	@mkdir -p $@/usr/lib
	@cp -a $(PKGPATH)/.libs/$(PKGNAME)-2.0.so* \
		$(PKGPATH)/.libs/$(PKGNAME).so $@/usr/lib

$(PKGNAME)_extra.d: PKGDEPENDENCIES=$(PKGNAME)_core
$(PKGNAME)_pthreads.d: PKGDEPENDENCIES=$(PKGNAME)_core
$(PKGNAME)_core.d $(PKGNAME)_extra.d $(PKGNAME)_pthreads.d: $(PKGBUILD)
	@$(RM) -r $@
	@mkdir -p $@/usr/lib
	@cp -a $(PKGPATH)/.libs/$(basename $@)-2.0.so* $@/usr/lib
