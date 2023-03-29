# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2017-2023 Open Networking Foundation
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

$(if $(DEBUG),$(warning ENTER))

# -----------------------------------------------------------------------
# Intent: Display help banner early before library lint help targets.
# -----------------------------------------------------------------------
help::
	@echo
	@echo "[LINT]"

## Disable python linting in bulk ?
ifdef NO-LINT-PYTHON
  NO-LINT-FLAKE8 := true
  NO-LINT-PYLINT := true
endif

# Define early else {flake8,pylint}.mk will complain:
#    PYTHON_FILES ?= $(error)
have-python-files := $(if $(strip $(PYTHON_FILES)),true)

##--------------------##
##---]  INCLUDES  [---##
##--------------------##
include $(MAKEDIR)/lint/doc8/include.mk
include $(MAKEDIR)/lint/json.mk
include $(MAKEDIR)/lint/python/include.mk
include $(MAKEDIR)/lint/robot.mk
include $(MAKEDIR)/lint/shell.mk
include $(MAKEDIR)/lint/yaml.mk

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
