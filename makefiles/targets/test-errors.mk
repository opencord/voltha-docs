# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2022-2023 Open Networking Foundation (ONF) and the ONF Contributors
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
#
# SPDX-FileCopyrightText: 2022 Open Networking Foundation (ONF) and the ONF Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------

$(if $(DEBUG),$(warning ENTER))

## -----------------------------------------------------------------------
## Intent: Summary 'make test' to hilight errors
## -----------------------------------------------------------------------
test-errors-lint := test-errors.lint.log
test-errors-link := test-errors.linkcheck.log
test-errors:
	@echo "** Running $(MAKE) sterile"
	$(HIDE)( $(MAKE) sterile 3>&1 2>&1 ) >/dev/null

	@echo
	@echo "** Running $(MAKE) lint"
	-$(HIDE) ( $(MAKE) lint 3>&1 2>&1 ) > $(test-errors-lint)

	@echo '** Screen log for errors: $(test-errors-lint)'
	$(HIDE)! grep \
	  -e 'make: ***' \
	  $(test-errors-lint)

	@echo
	@echo "** Running $(MAKE) linkcheck"
	-$(HIDE) ( $(MAKE) linkcheck 3>&1 2>&1 ) > $(test-errors-link)

	@echo '** Screen log for errors: $(test-errors-link)'
	$(HIDE)! grep \
	  -e 'make: ***' \
	  -e 'broken'    \
	 $(test-errors-link)

## -----------------------------------------------------------------------
## Intent: Remove generated logfiles
## -----------------------------------------------------------------------
clean ::
	$(RM) $(test-errors-lint) $(test-errors-link)

## -----------------------------------------------------------------------
## Intent: Display target help
## -----------------------------------------------------------------------
help ::
	@echo '  test-errors    Run make test and display an error summary'

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
