# Makefile for Sphinx documentation

# use bash for pushd/popd, and to fail quickly
SHELL = bash -e -o pipefail

# You can set these variables from the command line.
SPHINXOPTS   ?=
SPHINXBUILD  ?= sphinx-build
SOURCEDIR    ?= .
BUILDDIR     ?= _build

# Other repos with documentation to include.
# edit the `git_refs` file with the commit/tag/branch that you want to use
OTHER_REPO_DOCS ?= bbsim cord-tester ofagent-go openolt voltctl voltha-openolt-adapter voltha-openonu-adapter voltha-openonu-adapter-go voltha-protos voltha-system-tests kind-voltha

# Static docs, built by other means (usually robot framework)
STATIC_DOCS    := _static/voltha-system-tests _static/cord-tester

# name of python virtualenv that is used to run commands
VENV_NAME      := venv_docs

.PHONY: help test lint reload Makefile prep

# Put it first so that "make" without argument is like "make help".
help: $(VENV_NAME)
	source $</bin/activate ; set -u ;\
	$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Create the virtualenv with all the tools installed
$(VENV_NAME):
	virtualenv -p python3 $(VENV_NAME) ;\
	source $@/bin/activate ;\
	pip install -r requirements.txt

# automatically reload changes in browser as they're made
reload: $(VENV_NAME)
	source $</bin/activate ; set -u ;\
	sphinx-reload $(SOURCEDIR)

# lint and link verification. linkcheck is part of sphinx
test: lint linkcheck

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
	rm -rf $(BUILDDIR) $(OTHER_REPO_DOCS) $(STATIC_DOCS)

clean-all: clean
	rm -rf $(VENV_NAME) repos

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
%: $(VENV_NAME) Makefile | $(OTHER_REPO_DOCS) $(STATIC_DOCS)
	source $</bin/activate ; set -u ;\
	$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
