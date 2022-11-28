# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2022 Open Networking Foundation
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
# Makefile for Sphinx documentation

.DEFAULT_GOAL := help

TOP         ?= .
MAKEDIR     ?= $(TOP)/makefiles

$(if $(VERBOSE),$(eval export VERBOSE=$(VERBOSE))) # visible to include(s)

##--------------------##
##---]  INCLUDES  [---##
##--------------------##
include $(MAKEDIR)/consts.mk
include $(MAKEDIR)/help/include.mk
include $(MAKEDIR)/patches/include.mk
include $(MAKEDIR)/help/variables.mk

# You can set these variables from the command line.
SPHINXOPTS   ?=
SPHINXBUILD  ?= sphinx-build
SOURCEDIR    ?= .
BUILDDIR     ?= _build

# Other repos with documentation to include.
# edit the `git_refs` file with the commit/tag/branch that you want to use
OTHER_REPO_DOCS ?= bbsim cord-tester ofagent-go openolt voltctl voltha-openolt-adapter voltha-openonu-adapter-go voltha-protos voltha-system-tests device-management-interface voltha-helm-charts

ifdef NO_OTHER_REPO_DOCS
  # Inhibit pulling in external repos.
  # python 3.10+ patching not supported by all repos yet.
  OTHER_REPO_DOCS := $(null)
endif

# Static docs, built by other means (usually robot framework)
STATIC_DOCS    := _static/voltha-system-tests _static/cord-tester

# name of python virtualenv that is used to run commands
VENV_NAME      := venv_docs

.PHONY: help test lint reload Makefile prep

# Put it first so that "make" without argument is like "make help".
help :: $(VENV_NAME)
	@ echo
	@ source $</bin/activate ; set -u ;\
	$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# -----------------------------------------------------------------------
# Create the virtualenv with all the tools installed
# -----------------------------------------------------------------------
$(VENV_NAME):
	@echo
	@echo "============================="
	@echo "Installing python virtual env"
	@echo "============================="
	virtualenv -p python3 $@ ;\
	source ./$@/bin/activate ;\
	python -m pip install -r requirements.txt
ifndef NO_PATCH
	@echo
	@echo "========================================"
	@echo "Applying python 3.10.x migration patches"
	@echo "========================================"
	./patches/python_310_migration.sh '--venv' "$@" 'apply' 
endif

# automatically reload changes in browser as they're made
reload: $(VENV_NAME)
	source $</bin/activate ; set -u ;\
	sphinx-reload $(SOURCEDIR)

# lint and link verification. linkcheck is part of sphinx
test: lint linkcheck
# doctest
# coverage
# linkcheck
lint: doc8

doc8: $(VENV_NAME) | $(OTHER_REPO_DOCS)
	source $</bin/activate ; set -u ;\
	doc8 --max-line-length 119 \
	     $$(find . -name \*.rst ! -path "*venv*" ! -path "*vendor*" ! -path "*repos*" )

# markdown linting
#  currently not enabled, should be added to lint target
LINT_STYLE ?= mdl_strict.rb
md-lint: | $(OTHER_REPO_DOCS)
	@echo "markdownlint(mdl) version: `mdl --version`"
	@echo "style config:"
	@echo "---"
	@cat $(LINT_STYLE)
	@echo "---"
	mdl -s $(LINT_STYLE) `find -L $(SOURCEDIR) ! -path "./_$(VENV_NAME)/*" ! -path "./_build/*" ! -path "./repos/*" ! -path "*vendor*" -name "*.md"`

# clean up
clean:
	$(RM) -r $(BUILDDIR) $(OTHER_REPO_DOCS) $(STATIC_DOCS)

clean-all sterile: clean
	$(RM) -r $(VENV_NAME) repos

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

# checkout correct ref if not under test, then copy subdirectories into main
# docs dir
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

# generate a list of git checksums suitable for updating git_refs
freeze: repos
	@for repo in $(OTHER_REPO_DOCS) ; do \
	  GIT_SUBDIR=`grep "^$$repo " git_refs | awk '{print $$2}'` ;\
	  cd "repos/$$repo" > /dev/null ;\
	    HEAD_SHA=`git rev-parse HEAD` ;\
	    printf "%-24s %-8s %-40s\n" $$repo $$GIT_SUBDIR $$HEAD_SHA ;\
	  cd ../.. ;\
	done

# build multiple versions
multiversion: $(VENV_NAME) Makefile | prep $(OTHER_REPO_DOCS)
	source $</bin/activate ; set -u ;\
	sphinx-multiversion "$(SOURCEDIR)" "$(BUILDDIR)/multiversion" $(SPHINXOPTS)
	cp "$(SOURCEDIR)/_templates/meta_refresh.html" "$(BUILDDIR)/multiversion/index.html"

# prep target - used in sphinx-multiversion to properly link
prep: | $(OTHER_REPO_DOCS) $(STATIC_DOCS)

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
# %: $(VENV_NAME) Makefile | $(OTHER_REPO_DOCS) $(STATIC_DOCS)

include $(MAKEDIR)/voltha/docs-catchall-targets.mk 
$(voltha-docs-catchall): $(VENV_NAME) Makefile | $(OTHER_REPO_DOCS) $(STATIC_DOCS)
	@echo " ** CATCHALL: $@"
	source $</bin/activate ; set -u ;\
	$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

include $(MAKEDIR)/help/trailer.mk

# [EOF]
