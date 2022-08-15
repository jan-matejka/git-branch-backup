.DEFAULT_GOAL := all

prefix ?= /usr/local
bindir ?= $(prefix)/bin

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)

.PHONY: all
all: build check

.PHONY: build
build:

	# NOOP

.PHONY: install
install:

	$(INSTALL_PROGRAM) bin/git-branch-backup $(DESTDIR)$(bindir)


.PHONY: install-home
install-home:

	$(MAKE) install prefix=$(HOME)/.local


.PHONY: test
test: check


.PHONY: check
check:

	PATH="$$PWD/bin:$$PATH" dram -t .dram -s zsh tests

.PHONY: clean
clean:

	# NOOP
