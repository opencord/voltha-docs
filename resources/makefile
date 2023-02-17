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
##---]  TARGETS  [---##
##-------------------##
all:
# all: docker-gen gerrit-gen github-gen

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
docker-url := https://hub.docker.com/r/voltha/{}
docker-gen:
	cut -c8- voltha.docker \
	    | xargs -I'{}' echo '   * - `{} <$(docker-url)>`_' \
	    | xargs -n1 -I'{}' echo '   * - `{} <https://hub.docker.com/r/voltha/{}>`_' \
	    | tee $@.log

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
gerrit-url := https://gerrit.opencord.org/plugins/gitiles/{}
gerrit-gen:
	cut -c8- voltha.docker \
	    | xargs -I'{}' echo -e '   * - `{} <$(gerrit-url)>`_\n     -' \
	    | tee $@.log	

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
github-url := /dev/null
github-gen:

clean:
	$(RM) *.log

# [EOF]
