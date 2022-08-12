.DEFAULT_GOAL := build

prefix ?= /usr/local
bindir ?= $(prefix)/bin

CRAMOPTS ?= --shell=zsh

build:

	# NOOP

.PHONY: install
install:

	install -m755 bin/git-branch-backup $(DESTDIR)$(bindir)


.PHONY: install-home
install-home:

	$(MAKE) install prefix=$(HOME)/.local


.PHONY: check
check:

	PATH="$$PWD/bin:$$PATH" dram -t .dram -s zsh tests
