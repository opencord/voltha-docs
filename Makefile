# Makefile for Sphinx documentation

# use bash for pushd/popd, and to fail quickly
SHELL = bash -e -o pipefail

# You can set these variables from the command line.
SPHINXOPTS   ?=
SPHINXBUILD  ?= sphinx-build
SOURCEDIR    ?= .
BUILDDIR     ?= _build

# Put it first so that "make" without argument is like "make help".
help: doc_venv
	source ./doc_venv/bin/activate ;\
	$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help test lint reload Makefile

# Create the virtualenv with all the tools installed
doc_venv:
	virtualenv doc_venv ;\
	source ./doc_venv/bin/activate ;\
	pip install livereload ;\
	pip install -r requirements.txt

# automatically reload changes in browser as they're made
reload: doc_venv
	source ./doc_venv/bin/activate ;\
	set -u ;\
	sphinx-reload $(SOURCEDIR)

# lint and link verification. linkcheck is part of sphinx
test: lint linkcheck

lint: rst-lint

rst-lint: doc_venv | $(OTHER_REPO_DOCS)
	source ./doc_venv/bin/activate ;\
	set -u ;\
	rstcheck -r $$(find . -name \*.rst ! -path "*doc_venv*" ! -path "./repos/*" ! -path "*vendor*")

# markdown linting
#  currently not enabled, should be added to lint target
LINT_STYLE ?= mdl_strict.rb
md-lint: | $(OTHER_REPO_DOCS)
	@echo "markdownlint(mdl) version: `mdl --version`"
	@echo "style config:"
	@echo "---"
	@cat $(LINT_STYLE)
	@echo "---"
	mdl -s $(LINT_STYLE) `find -L $(SOURCEDIR) ! -path "./_doc_venv/*" ! -path "./_build/*" ! -path "./repos/*" ! -path "*vendor*" -name "*.md"`

# clean up
clean:
	rm -rf $(BUILDDIR) $(OTHER_REPO_DOCS)

clean-all: clean
	rm -rf doc_venv repos

# Other repos with documentation to include.
# edit the `git_refs` file with the commit/tag/branch that you want to use
OTHER_REPO_DOCS ?= bbsim voltha-go voltha-openolt-adapter voltha-openonu-adapter voltha-protos

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

# clone (only if doesn't exist), then checkout ref in repos/*
$(CHECKOUT_REPOS): | repos
	GIT_REF=`grep '^$(@F) ' git_refs | awk '{print $$3}'` ;\
	if [ ! -d '$@' ] ;\
	  then git clone $(REPO_HOST)/$(@F) $@ ;\
	fi ;\
	if [ "$(SKIP_CHECKOUT)" = "$(@F)" ] ;\
	  then echo "Skipping checkout of repo $(SKIP_CHECKOUT) as it's being tested" ;\
	else pushd $@ ;\
	  git checkout $$GIT_REF ;\
	  popd ;\
	fi

# link subdirectories (if applicable) into main docs dir
$(OTHER_REPO_DOCS): | $(CHECKOUT_REPOS)
	GIT_SUBDIR=`grep '^$@ ' git_refs | awk '{print $$2}'` ;\
	ln -s repos/$(@)$$GIT_SUBDIR $@

# generate a list of git checksums suitable for updating git_refs
freeze: repos
	@for repo in $(OTHER_REPO_DOCS) ; do \
	  GIT_SUBDIR=`grep "^$$repo " git_refs | awk '{print $$2}'` ;\
	  cd "repos/$$repo" > /dev/null ;\
	    HEAD_SHA=`git rev-parse HEAD` ;\
	    printf "%-24s %-8s %-40s\n" $$repo $$GIT_SUBDIR $$HEAD_SHA ;\
	  cd ../.. ;\
	done

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile doc_venv | $(OTHER_REPO_DOCS)
	source ./doc_venv/bin/activate ;\
	$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

