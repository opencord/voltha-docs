# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2022-2025 Open Networking Foundation Contributors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# -----------------------------------------------------------------------
# SPDX-FileCopyrightText: 2022-2025 Open Networking Foundation Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------
# Intent: Makefile for Sphinx documentation
# -----------------------------------------------------------------------

ifndef .DEFAULT_GOAL
  export .DEFAULT_GOAL := help # no->(?=), help target evaluated late
endif
MAKECMDGOALS    ?= help

##--------------------##
##---]  INCLUDES  [---##
##--------------------##
include makefiles/include.mk

# You can set these variables from the command line.
SPHINXOPTS   ?=
SPHINXBUILD  ?= sphinx-build
SOURCEDIR    ?= .
BUILDDIR     ?= _build

# If running on Jenkins, we need to pick up the GERRIT_BRANCH env var.
# Otherwise, we can simply use the current branch.
ifdef GERRIT_BRANCH
  BRANCH := $(GERRIT_BRANCH)
else
  BRANCH := $(shell git branch --show-current)
endif

# Other repos with documentation to include.
# edit the `git_refs` file with the commit/tag/branch that you want to use
OTHER_REPO_DOCS ?= bbsim ofagent-go openolt voltctl voltha-openolt-adapter voltha-openonu-adapter-go voltha-protos device-management-interface voltha-helm-charts voltha-system-tests cord-tester

ifdef NO_OTHER_REPO_DOCS
  # Inhibit pulling in external repos.
  # python 3.10+ patching not supported by all repos yet.
  OTHER_REPO_DOCS := $(null)
endif

# Static docs, built by other means (usually robot framework)
STATIC_DOCS    := _static/voltha-system-tests _static/cord-tester

# Why is existing source Makefile PHONY (?)
.PHONY: help test lint reload Makefile prep

## -----------------------------------------------------------------------
## Intent: Display makefile target help
## -----------------------------------------------------------------------
help :: help-targets-main
help-verbose :: help-targets-sphinx

## -----------------------------------------------------------------------
## Intent: Real time viewing, dynamically generate and reload document
##         changes for web browser viewing.
## Usage:
##   make reload
## -----------------------------------------------------------------------
reload: $(venv-activate-script)
	$(activate) && sphinx-reload $(SOURCEDIR)

## -----------------------------------------------------------------------
## Intent: lint and link verification. linkcheck is part of sphinx
## See Also: make test-errors
## -----------------------------------------------------------------------
test: lint linkcheck

# [TODO] relocate into repo:onf-make/
lint      : $(venv-activate-script)
linkcheck : $(venv-activate-script)

## -----------------------------------------------------------------------
## Intent: Exercise all generation targets
## Bridge: library workaround to support legacy targets
## -----------------------------------------------------------------------
test-all-targets += html
test-all-targets += coverage
# test-all-targets += changes
# test-all-targets += info
test-all-targets += man
test-all-targe4ts += text
# test-all-targets += latex

test-all : test
	$(MAKE) $(test-all-targets)

# doctest
# coverage
# linkcheck

# -----------------------------------------------------------------------
#  currently not enabled, should be added to lint target
# [TODO] Create repo:onf-make/makefiles/lint/mdl
# -----------------------------------------------------------------------
LINT_STYLE ?= mdl_strict.rb
md-lint: | $(OTHER_REPO_DOCS)
	@echo "markdownlint(mdl) version: `mdl --version`"
	@echo "style config:"
	@echo "---"
	@cat $(LINT_STYLE)
	@echo "---"
	mdl -s $(LINT_STYLE) `find -L $(SOURCEDIR) ! -path "./_$(venv-activate-script)/*" ! -path "./_build/*" ! -path "./repos/*" ! -path "*vendor*" -name "*.md"`

# clean up
clean ::
	$(RM) -r $(BUILDDIR) $(OTHER_REPO_DOCS) $(STATIC_DOCS)

clean-all sterile :: clean
	$(RM) -r $(venv-activate-script) repos

# checkout the repos inside repos/ dir
repos:
	mkdir repos

# build directory paths in repos/* to perform 'git clone <repo>' into
CHECKOUT_REPOS   = $(foreach repo,$(OTHER_REPO_DOCS),repos/$(repo))

# Host holding the git server
REPO_HOST       ?= https://gerrit.opencord.org

# For QA patchset validation - set SKIP_CHECKOUT to the repo name and
# pre-populate it under repos/ with the specific commit to being validated
SKIP_CHECKOUT   ?=

# clone (only if doesn't exist)
$(CHECKOUT_REPOS): | repos
	if [ ! -d '$@' ] ;\
	  then git clone $(REPO_HOST)/$(@F) $@ ;\
	fi

## -----------------------------------------------------------------------
## Intent: checkout correct ref if not under test, then copy
##         subdirectories into main docs dir
## -----------------------------------------------------------------------
$(OTHER_REPO_DOCS): | $(CHECKOUT_REPOS)
	if [ "$(SKIP_CHECKOUT)" != "$@" ] ;\
	  then GIT_REF=`grep '^$@ ' git_refs | awk '{print $$3}'` ;\
	  cd "repos/$@" && git checkout $$GIT_REF ;\
	fi
	GIT_SUBDIR=`grep '^$@ ' git_refs | awk '{print $$2}'` ;\
	cp -r repos/$(@)$$GIT_SUBDIR $@ ;\

# Build Robot documentation in voltha-system-tests and copy it into _static.
_static/voltha-system-tests: | $(OTHER_REPO_DOCS)
	make -C voltha-system-tests gendocs
	mkdir -p $@
	cp -r voltha-system-tests/gendocs/* $@

# Build Robot documentation in cord-tester and copy it into _static.
_static/cord-tester: | $(OTHER_REPO_DOCS)
	make -C cord-tester gendocs
	mkdir -p $@
	cp -r cord-tester/gendocs/* $@

## -----------------------------------------------------------------------
## Intent: Build docs for the current branch
## -----------------------------------------------------------------------
docs: $(venv-activate-script) Makefile | prep $(OTHER_REPO_DOCS)
	$(activate) && sphinx-build "$(SOURCEDIR)" "$(BUILDDIR)/$(BRANCH)" $(SPHINXOPTS)
ifeq ($(BRANCH),master)
	cp "$(SOURCEDIR)/_templates/meta_refresh.html" "$(BUILDDIR)/index.html"
endif

## -----------------------------------------------------------------------
## Intent: generate a list of git checksums suitable for updating git_refs
## -----------------------------------------------------------------------
freeze: repos
	@for repo in $(OTHER_REPO_DOCS) ; do \
	  GIT_SUBDIR=`grep "^$$repo " git_refs | awk '{print $$2}'` ;\
	  cd "repos/$$repo" > /dev/null ;\
	    HEAD_SHA=`git rev-parse HEAD` ;\
	    printf "%-24s %-8s %-40s\n" $$repo $$GIT_SUBDIR $$HEAD_SHA ;\
	  cd ../.. ;\
	done

## -----------------------------------------------------------------------
## Intent: build multiple versions
## -----------------------------------------------------------------------
multiversion: $(venv-activate-script) Makefile | prep $(OTHER_REPO_DOCS)
	$(activate)\
 && sphinx-multiversion "$(SOURCEDIR)" "$(BUILDDIR)/multiversion" $(SPHINXOPTS)
	cp "$(SOURCEDIR)/_templates/meta_refresh.html" "$(BUILDDIR)/multiversion/index.html"

## -----------------------------------------------------------------------
## Intent: used in sphinx-multiversion to properly link
## -----------------------------------------------------------------------
prep: | $(OTHER_REPO_DOCS) $(STATIC_DOCS)

## -----------------------------------------------------------------------
## Intent: Display makefile target help
## -----------------------------------------------------------------------
help-targets-sphinx : $(venv-activate-script)
	@ echo
	@echo '[HELP: Sphinx]'
	$(HIDE)$(activate) \
 && $(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

## -----------------------------------------------------------------------
## Intent: Display WARNINGS buried in sphinx output
## -----------------------------------------------------------------------
warnings-log := warnings.log
warnings: sterile
	$(MAKE) html 2>&1 \
	    | sed -e 's@\([Ww][Aa][Rr][Nn][Ii][Nn][Gg]\)@\n\1@g' \
	    > "$(warnings-log)"
	grep 'WARNING' $(warnings-log)

## -----------------------------------------------------------------------
## Intent: Summarize linkcheck failures
## -----------------------------------------------------------------------
.PHONY: broken-log
broken-log := broken.log
broken-log : sterile
	$(MAKE) linkcheck 2>&1 | tee "$(broken-log)"
	! grep broken "$(broken-log)"
	grep -i error _build/linkcheck/output.txt

## -----------------------------------------------------------------------
## Intent: Summarize linkcheck failures
## -----------------------------------------------------------------------
.PHONY: lint-doc8-debug
lint-doc8-debug : sterile
	$(HIDE) @echo "Searching for cryptic failures"
	-grep -i 'X <' release_notes/voltha_2.12.rst | grep -v '`__'

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
clean::
	$(RM) $(broken-log)
	$(RM) $(warnings-log)

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
help :: help-targets-main
help-targets-main :

	@echo
	@echo '[HELP]'
	@printf '  %-30.30s %s\n' 'help' \
	  'Summary makefile target help'
	@printf '  %-30.30s %s\n' 'help-verbose' \
	  'Extended makefile target help'

	@echo
	@echo '[INIT]'
	@printf '  %-30.30s %s\n' 'init' \
	    'Alias for git-submodules'
	@printf '  %-30.30s %s\n' 'git-submodules' \
	    'Checkout external dependent repositories'

	@echo
	@echo '[TEST: Failures]'
	@printf '  %-30.30s %s\n' 'broken' \
	    'Display broken URLs detected in linkcheck output'
	@printf '  %-30.30s %s\n' 'warnings' \
	    'Display WARNING strings buried in sphinx output'

## -----------------------------------------------------------------------
## Intent: Display make help footer
## -----------------------------------------------------------------------
include makefiles-orig/help/trailer.mk

# [EOF]
