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
.PHONY: lint-doc8

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
ifndef NO-LINT-DOC8
  lint : lint-doc8
endif# NO-LINT-DOC8

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
lint-doc8-excl += --ignore-path '$(venv-name)'
lint-doc8-excl += --ignore-path '$(BUILDDIR)'

# YUCK! -- overhead
#   o Submodule(s) use individual/variant virtualenv install paths.
#   o Exclude special snowflakes to enable library makefile use.
#   o [TODO] Use makefiles/virtualenv.mk to avoid duplication.
lint-doc8-excl += --ignore-path 'venv_cord'
lint-doc8-excl += --ignore-path 'vst_venv'

lint-doc8: $(venv-activate-script)
	@echo
	@echo '** -----------------------------------------------------------------------'
	@echo '** doc8 *.rst syntax checking'
	@echo '** -----------------------------------------------------------------------'
	$(activate) && doc8 --version
	@echo
	$(activate)\
  && set -u\
  && doc8 $(lint-doc8-excl) --max-line-length 120 .

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help::
	@echo "  lint-doc8          Syntax check rst files using doc8"

# [EOF]
