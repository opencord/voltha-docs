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
OTHER_REPO_DOCS ?= bbsim voltha-go voltha-openolt-adapter voltha-openonu-adapter voltha-protos

# Put it first so that "make" without argument is like "make help".
help: doc_venv
	source $</bin/activate ; set -u ;\
	$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help test lint reload Makefile prep

# Create the virtualenv with all the tools installed
doc_venv:
	virtualenv doc_venv ;\
	source $@/bin/activate ;\
	pip install livereload ;\
	pip install -r requirements.txt

# automatically reload changes in browser as they're made
reload: doc_venv
	source $</bin/activate ; set -u ;\
	sphinx-reload $(SOURCEDIR)

# lint and link verification. linkcheck is part of sphinx
test: lint linkcheck

lint: doc8

doc8: doc_venv | $(OTHER_REPO_DOCS)
	source $</bin/activate ; set -u ;\
	doc8 --max-line-length 119 \
	     $$(find . -name \*.rst ! -path "*doc_venv*" ! -path "*vendor*")

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

# link subdirectories (if applicable) into main docs dir, then checkout ref if
# not under test
$(OTHER_REPO_DOCS): | $(CHECKOUT_REPOS)
	GIT_SUBDIR=`grep '^$@ ' git_refs | awk '{print $$2}'` ;\
	ln -s repos/$(@)$$GIT_SUBDIR $@ ;\
	if [ "$(SKIP_CHECKOUT)" != "$@" ] ;\
	  then GIT_REF=`grep '^$@ ' git_refs | awk '{print $$3}'` ;\
	  pushd $@ ;\
	    git checkout $$GIT_REF ;\
	  popd ;\
	fi

# generate a list of git checksums suitable for updating git_refs
freeze: repos
	@for repo in $(OTHER_REPO_DOCS) ; do \
	  GIT_SUBDIR=`grep "^$$repo " git_refs | awk '{print $$2}'` ;\
	  pushd "repos/$$repo" > /dev/null ;\
	    HEAD_SHA=`git rev-parse HEAD` ;\
	    printf "%-24s %-8s %-40s\n" $$repo $$GIT_SUBDIR $$HEAD_SHA ;\
	  popd ;\
	done

# use sphinxcontrib-versioning to make a versioned copy of the
# NOTE: document root is now in _build, not _build/html
versioned: doc_venv Makefile | $(OTHER_REPO_DOCS)
	source $</bin/activate ; set -u ;\
	sphinx-versioning build -r master "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)

# prep target - used in sphinxcontrib-versioning to create versioned repos when
# building multiple versions
prep: | $(OTHER_REPO_DOCS)

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: doc_venv Makefile | $(OTHER_REPO_DOCS)
	source $</bin/activate ; set -u ;\
	$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

