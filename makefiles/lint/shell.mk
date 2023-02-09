# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2017-2023 Open Networking Foundation (ONF) and the ONF Contributors
#
# Licensed under the Apache License, Version 2.0 (the "License")
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

$(if $(DEBUG),$(warning ENTER))

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
.PHONY: lint-shell lint-shell-all lint-shell-modified

have-shell-sources := $(if $(strip $(SHELL_SOURCES)),true)
SHELL_SOURCES      ?= $(error SHELL_SOURCES= required)

## -----------------------------------------------------------------------
## Intent: Use the shell command to perform syntax checking.
##   % make lint
##   % make lint-shell-all
## -----------------------------------------------------------------------
ifndef NO-LINT-SHELL
  lint-shell-mode := $(if $(have-shell-sources),modified,all)
  lint : lint-shell-$(lint-shell-mode)
endif# NO-LINT-SHELL

## -----------------------------------------------------------------------
## Intent: exhaustive shell syntax checking
## -----------------------------------------------------------------------
shellcheck-find-args := $(null)
shellcheck-find-args += -name '$(venv-name)'
shellcheck-find-args += -o -name 'staging'
lint-shell-all:
	$(MAKE) --no-print-directory lint-shellcheck-install

	find . \( $(shellcheck-find-args) \) -prune -name '*.sh' -print0 \
	    | $(xargs-n1-clean) shellcheck

## -----------------------------------------------------------------------
## Intent: check deps for format and python3 cleanliness
## Note:
##   shell --py3k option no longer supported
## -----------------------------------------------------------------------
lint-shell-modified:
	$(MAKE) --no-print-directory lint-shell-install

	shellcheck $(SHELL_SOURCES)

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
.PHONY: lint-shellcheck-install
lint-shellcheck-install:
	@echo
	@echo "** -----------------------------------------------------------------------"
	@echo '** command shell syntax checking'
	@echo "** -----------------------------------------------------------------------"

        # {apt-get,rpm,yum} install shellcheck
	shellcheck --version
	@echo

## -----------------------------------------------------------------------
## Intent: Display command usage
## -----------------------------------------------------------------------
help::
	@echo '  lint-shell          Syntax check sources using shellcheck'
  ifdef VERBOSE
	@echo '  $(MAKE) lint-shell SHELL_SOURCES=...'
	@echo '  lint-shell-modified  shell checking: only modified'
	@echo '  lint-shell-all       shell checking: exhaustive'
  endif

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
