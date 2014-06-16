# Generic makefile for simpler

PARENT=$(shell basename $$(dirname $$PWD))
CURDIR=$(shell basename $$PWD)

all show version clean binclean downclean md5sum categories:
# prints a nice header if inside a category
	@if [ "$(PARENT)" = "packages" \
		-a "$(CURDIR)" != "all" \
		-a "$@" != "categories" ]; then \
			N=$$(expr 45 - length $(PARENT):$(CURDIR)); \
			printf "%$$(expr $$N / 2)s" | tr " " "*"; \
			printf " $(PARENT):$(CURDIR) "; \
			printf "%$$(expr $$N / 2)s\n" | tr " " "*"; \
	fi
# descends into the categories/packages subdirectory
	@[ "$@" != "all" -a -z "$(DEBUG)" ] && FLAGS=-s; \
		for i in */; do \
			if [ "$$i" = "packages/" \
				-o "$$i" = "kernel/" \
				-o "$(PARENT)" = "packages" \
				-o "$(CURDIR)" = "packages" ]; then \
					if [ "$$i" != "all/" -o "$@" = "categories" ]; then \
						$(MAKE) $$FLAGS -C $$i $@; \
					fi; \
			fi; \
		done
# if "clean" is the target also cleans the categories
	@if [ "$@" = "clean" -a "$(CURDIR)" = "packages" ]; then \
		for i in */; do \
			if [ "$$i" != "all/" ]; then rm -rf "$$i"; fi; \
		done; \
	fi

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

.PHONY: all show version clean binclean downclean md5sum categories
