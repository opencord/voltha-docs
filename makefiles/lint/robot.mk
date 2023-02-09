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
.PHONY: lint-robot lint-robot-all lint-robot-modified

have-robot-files := $(if $(ROBOT_FILES),true)
ROBOT_FILES      ?= $(error ROBOT_FILES= required)

LINT_ARGS ?= --verbose --configure LineTooLong:130 -e LineTooLong \
             --configure TooManyTestSteps:65 -e TooManyTestSteps \
             --configure TooManyTestCases:50 -e TooManyTestCases \
             --configure TooFewTestSteps:1 \
             --configure TooFewKeywordSteps:1 \
             --configure FileTooLong:2000 -e FileTooLong \
             -e TrailingWhitespace

## -----------------------------------------------------------------------
## Intent: Use the robot command to perform syntax checking.
##   % make lint
##   % make lint-robot-all
##   % make lint-robot-modified
## -----------------------------------------------------------------------
ifndef NO-LINT-ROBOT
  lint-robot-mode := $(if $(have-robot-files),modified,all)
  lint : lint-robot-$(lint-robot-mode)
endif# NO-LINT-ROBOT

## -----------------------------------------------------------------------
## Intent: exhaustive robot syntax checking
## -----------------------------------------------------------------------
lint-robot-all:
	$(HIDE)$(MAKE) --no-print-directory rflint-install

	$(activate)\
 && find . \( -iname '*.robot' \) -print0 \
	| $(xargs-n1) rflint $(LINT_ARGS)

## -----------------------------------------------------------------------
## Intent: check deps for format and python3 cleanliness
## Note:
##   robot --py3k option no longer supported
## -----------------------------------------------------------------------
lint-robot-modified: $(venv-activate-script)
	$(HIDE)$(MAKE) --no-print-directory rflint-install

	$(activate) && rflint $(LINT_ARGS) $(ROBOT_FILES)

## -----------------------------------------------------------------------
## Intent: Install the rflint command for syntax checking.
##   Note: requirements.txt pip install not used here ATM due to implicit
##         per-repository dependency config to enable checking.
## -----------------------------------------------------------------------
rflint-install: $(venv-activate-script)
	@echo
	@echo "** -----------------------------------------------------------------------"
	@echo "** robot syntax checking"
	@echo "** -----------------------------------------------------------------------"
	$(activate)\
 && pip install --upgrade robotframework-lint
	$(activate) && rflint --version
	@echo

## -----------------------------------------------------------------------
## Intent: Display command usage
## -----------------------------------------------------------------------
help::
	@echo '  lint-robot          Syntax check python using the robot command'
  ifdef VERBOSE
	@echo '  lint-robot-all       robot checking: exhaustive'
	@echo '  lint-robot-modified  robot checking: only modified'
  endif

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
