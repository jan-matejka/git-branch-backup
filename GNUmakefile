.DEFAULT_GOAL := build

PREFIX ?= /usr/local
LIBDIR ?= $(PREFIX)/lib
BINDIR ?= $(PREFIX)/bin

CRAMOPTS ?= --shell=zsh

build:

	# NOOP

.PHONY: install
install:

	install -m755 bin/git-branch-backup $(DESTDIR)$(BINDIR)


.PHONY: install-home
install-home:

	$(MAKE) install PREFIX=$(HOME)/.local


.PHONY: check
check:

	PATH="$$PWD/bin:$$PATH" dram -s zsh tests
