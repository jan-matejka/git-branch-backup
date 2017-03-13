.DEFAULT_GOAL := build

PREFIX ?= /usr/local
LIBDIR ?= $(PREFIX)/lib
BINDIR ?= $(PREFIX)/bin

build:

	# NOOP

.PHONY: install
install:

	install -m755 bin/git-branch-backup $(DESTDIR)$(BINDIR)

.PHONY: check
check:

	PATH="$(PWD)/bin:$(PATH)" cram cram
