# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2017-2022 Open Networking Foundation
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

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
.PHONY: lint-doc8 lint-doc8-all lint-doc8-modified

have-rst-files := $(if $(strip $(RST_SOURCE)),true)
RST_SOURCE     ?= $(error RST_SOURCE= is required)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
ifndef NO-LINT-DOC8
  lint-doc8-mode := $(if $(have-doc8-files),modified,all)
  lint : lint-doc8-$(lint-doc8-mode)
endif# NO-LINT-DOC8

# Consistent targets across lint makefiles
lint-doc8-all      : lint-doc8
lint-doc8-modified : lint-doc8

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
lint-doc8-excl += --ignore-path '$(venv-name)'
lint-doc8-excl += --ignore-path '$(BUILDDIR)'

# YUCK! -- overhead
#   o Submodule(s) use individual/variant virtualenv install paths.
#   o Exclude special snowflakes to enable library makefile use.
#   o [TODO] Use makefiles/virtualenv.mk to avoid duplication.

lint-doc8-excl += --ignore-path '*/venv_cord'
lint-doc8-excl += --ignore-path '*/vst_venv'

lint-doc8-excl += --ignore-path './cord-tester'
lint-doc8-excl += --ignore-path './repos/cord-tester'

lint-doc8-excl += --ignore-path './bbsim/internal/bbsim/responders/sadis/dp.txt'
lint-doc8-excl += --ignore-path './repos/bbsim/internal/bbsim/responders/sadis/dp.txt'
lint-doc8-excl += --ignore-path './repos/voltha-helm-charts/voltha-infra/templates/NOTES.txt'
lint-doc8-excl += --ignore-path './voltha-helm-charts/voltha-infra/templates/NOTES.txt'

lint-doc8-args += --max-line-length 120

lint-doc8: $(venv-activate-script)
	@echo
	@echo '** -----------------------------------------------------------------------'
	@echo '** doc8 *.rst syntax checking'
	@echo '** -----------------------------------------------------------------------'
	$(activate) && doc8 --version
	@echo
	$(activate) && doc8 $(lint-doc8-excl) $(lint-doc8-args) .

## -----------------------------------------------------------------------
## Intent: Display command usage
## -----------------------------------------------------------------------
help::
	@echo '  lint-doc8          Syntax check python using the doc8 command'
  ifdef VERBOSE
	@echo '  lint-doc8-all       doc8 checking: exhaustive'
	@echo '  lint-doc8-modified  doc8 checking: only modified'
  endif

# [EOF]
