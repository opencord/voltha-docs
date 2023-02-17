# -*- makefile -*-
## -----------------------------------------------------------------------
## Intent: Generate an RST formatted table with URLs given a list of
##         voltha resource names.
## -----------------------------------------------------------------------
## .. list-table:: VOLTHA Docker Images
##   :widths: 20, 5, 40
##   :header-rows: 1
##
##   * - Image
##     - Date
##     - Description    
#    * - `voltha/voltha-envoy <https://hub.docker.com/r/voltha/voltha-envoy>`_
## -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
HIDE ?= @

## ------------------------------------------------------------------------
## Intent: Generate a stream of tokens:
##   o slurp file
##   o remove comments and blank lines
## ------------------------------------------------------------------------
format-list = cat "$1" \
  | cut -d'\#' -f1     \
  | grep '[[:alnum:]]'

##-------------------##
##---]  TARGETS  [---##
##-------------------##
all:

## -----------------------------------------------------------------------
## Intent: Invoke all named generate table targets
## -----------------------------------------------------------------------
gen-all += docker-gen
gen-all += gerrit-gen
gen-all += github-gen
gen-all : $(gen-all)

## -----------------------------------------------------------------------
## Intent: Generate an rst table for VOLTHA docker images.
## -----------------------------------------------------------------------
docker-src := sources/voltha.docker
docker-url := https://hub.docker.com/r/voltha/{}
docker-gen:
	$(HIDE)$(call format-list,$(docker-src))               \
	    | xargs -I'{}' echo -e '   * - `{} <$(docker-url)>\n     -`_' \
	    | tee $@.log

## -----------------------------------------------------------------------
## Intent: Generate an rst table for VOLTHA gerrit repositories
## -----------------------------------------------------------------------
gerrit-src := sources/voltha.gerrit
gerrit-url := https://gerrit.opencord.org/plugins/gitiles/{}
gerrit-gen:
	$(HIDE)$(call format-list,$(gerrit-src))                          \
	    | xargs -I'{}' echo -e '   * - `{} <$(gerrit-url)>`_\n     -' \
	    | tee $@.log

## -----------------------------------------------------------------------
## Intent: Generate an rst table for VOLTHA github repositories
## -----------------------------------------------------------------------
github-src := sources/voltha.github
github-url := /dev/null
github-gen:

## -----------------------------------------------------------------------
## Intent: Remove generated targets
## -----------------------------------------------------------------------
clean:
	$(RM) *.log

## -----------------------------------------------------------------------
## Intent: Display help text
## -----------------------------------------------------------------------
help ::
	@echo "Usage: $(MAKE) [options] [target] ..."
	@echo "Targets:"
	@echo "  clean                  Remove generated targets"

	@echo
	@echo "[RST GEN] - Generate an rst table containing"
	@echo "  gen-all                Generate all VOLTHA rst tables"
	@echo "  gen-docker             VOLTHA Docker images"
	@echo "  gen-gerrit             VOLTHA Gerrit Repositories"
	@echo "  gen-github             VOLTHA Github Repositories"

# [EOF]
