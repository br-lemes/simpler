# Generic makefile for simpler

PARENT=$(shell basename $$(dirname $$PWD))
CURDIR=$(shell basename $$PWD)

all show version clean binclean downclean md5sum: $(wildcard */)
# prints a nice header if inside a category
ifeq ($(PARENT),packages)
	@N=$$(expr 45 - length $(PARENT):$(CURDIR)); \
		printf "%$$(expr $$N / 2)s" | tr " " "*"; \
		printf " $(PARENT):$(CURDIR) "; \
		printf "%$$(expr $$N / 2)s\n" | tr " " "*"
endif
# descends into the categories/packages subdirectory
	@[ "$@" != "all" ] && FLAGS=-s; \
		for i in $(wildcard */); do \
			if [ "$$i" = "packages/" \
				-o "$(PARENT)" = "packages" \
				-o "$(CURDIR)" = "packages" ]; then \
					$(MAKE) $$FLAGS -C $$i $@; \
			fi; \
		done

ifeq ($(CURDIR),simpler)
FIRMWARE=https://raw.githubusercontent.com/raspberrypi/firmware/master/boot
firmware:
	@wget -c $(FIRMWARE)/LICENCE.broadcom
	@wget -c $(FIRMWARE)/bootcode.bin
	@wget -c $(FIRMWARE)/fixup_cd.dat
	@wget -c $(FIRMWARE)/start_cd.elf
	@mkdir -p boot
	@mv LICENCE.broadcom bootcode.bin fixup*.dat start*.elf boot

endif

.PHONY: all show version clean binclean downclean md5sum
