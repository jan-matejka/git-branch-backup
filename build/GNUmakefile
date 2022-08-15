.DEFAULT_GOAL := all

prefix ?= /usr/local
bindir ?= $(prefix)/bin

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)

bdir = _build

.PHONY: all
all: build check

.PHONY: build
build: $(bdir)/git-branch-backup.1

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

	$(RM) -r $(bdir)

$(bdir):
	mkdir -p $@

$(bdir)/%.1: doc/%.1.rst | $(bdir)
	rst2man $< $@
