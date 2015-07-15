#
# personal webpage included makefile to generate subdirs
#
# Copyright © 1998-2002, 2004-2006  Guillem Jover <guillem@hadrons.org>
#

SCRIPTSDIR := $(WMLBASE)/scripts

SRC_WML = $(wildcard *.wml)
HTML = $(SRC_WML:.wml=.html)

SUBDIRS_CLEAN := $(addsuffix -clean, $(SUBDIRS))

.PHONY: build clean $(SUBDIRS) $(SUBDIRS_CLEAN)

%.html: %.wml $(WMLBASE)/.wmlrc
	wml $(WMLFLAGS) -o $@ $(CURDIR)/$<

build: $(HTML) $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

clean: $(SUBDIRS_CLEAN)
	$(RM) $(HTML)

$(SUBDIRS_CLEAN):
	$(MAKE) -C $(patsubst %-clean,%,$@) clean

# vim:set syn=make:
