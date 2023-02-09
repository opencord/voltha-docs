# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2017-2023 Open Networking Foundation (ONF) and the ONF Contributors
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

PYTHON_FILES ?= $(error PYTHON_FILES= is required)

.PHONY: lint-python

lint : lint-python

# check deps for format and python3 cleanliness
lint-python : $(venv-activate-script)
	@echo -n "** $@: ENTER"

	$(HIDE)$(activate)\
	source ./$</bin/activate\
  && set -u\
  && pylint --py3k $(PYTHON_FILES)\
  && flake8 --max-line-length=99 --count $(PYTHON_FILES)
	@echo -n "** $@: LEAVE"

## -----------------------------------------------------------------------
## Intent: Display targets supported by this makefile
## -----------------------------------------------------------------------
todo ::
	@echo " o Update target to support dependency based checking."
	@echo " o Only lint modified files"

## -----------------------------------------------------------------------
## Intent: Display targets supported by this makefile
## -----------------------------------------------------------------------
help::
	@echo "  lint-python          Syntax check using pylint and flake8"

# [EOF]
