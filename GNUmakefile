.DEFAULT_GOAL := build

prefix ?= /usr/local
bindir ?= $(prefix)/bin

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)

build:

	# NOOP

.PHONY: install
install:

	$(INSTALL_PROGRAM) bin/git-branch-backup $(DESTDIR)$(bindir)


.PHONY: install-home
install-home:

	$(MAKE) install prefix=$(HOME)/.local


.PHONY: check
check:

	PATH="$$PWD/bin:$$PATH" dram -t .dram -s zsh tests
