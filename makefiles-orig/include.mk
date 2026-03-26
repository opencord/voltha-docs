# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2017-2023 Linux Foundation Broadband Contributors
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
# SPDX-FileCopyrightText: 2017-2023 Linux Foundation Broadband Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------
# https://gerrit.lfbroadband.org/plugins/gitiles/onf-make
# ONF.makefiles.include.version = 1.1
# -----------------------------------------------------------------------

ifndef mk-include--onf-make # single-include guard macro

$(if $(DEBUG),$(warning ENTER))

## -----------------------------------------------------------------------
## Define vars based on relative import (normalize symlinks)
## Usage: include makefiles-orig/onf/include.mk
## -----------------------------------------------------------------------
onf-mk-abs    ?= $(abspath $(lastword $(MAKEFILE_LIST)))
onf-mk-top    := $(subst /include.mk,$(null),$(onf-mk-abs))
ONF-MAKEDIR   := $(onf-mk-top)

TOP ?= $(patsubst %/makefiles-orig/include.mk,%,$(onf-mk-abs))

include $(ONF-MAKEDIR)/consts.mk
include $(ONF-MAKEDIR)/help/include.mk       # render target help
include $(ONF-MAKEDIR)/utils/include.mk      # dependency-less helper macros
include $(ONF-MAKEDIR)/etc/include.mk        # banner macros
include $(ONF-MAKEDIR)/commands/include.mk   # Tools and local installers

include $(ONF-MAKEDIR)/virtualenv.mk#        # lint-{jjb,python} depends on venv
include $(ONF-MAKEDIR)/patches/include.mk#   # Patch when python 3.10+ in use
include $(ONF-MAKEDIR)/lint/include.mk

include $(ONF-MAKEDIR)/gerrit/include.mk
include $(ONF-MAKEDIR)/git/include.mk
include $(ONF-MAKEDIR)/jjb/include.mk

$(if $(USE-VOLTHA-RELEASE-MK),\
  $(eval include $(ONF-MAKEDIR)/release/include.mk))

include $(ONF-MAKEDIR)/todo.mk
include $(ONF-MAKEDIR)/help/variables.mk

##---------------------##
##---]  ON_DEMAND  [---##
##---------------------##
$(if $(USE-LF-BB-GERRIT-MK),$(eval include $(ONF-MAKEDIR)/gerrit/include.mk))
$(if $(USE-LF-BB-DOCKER-MK),$(eval include $(ONF-MAKEDIR)/docker/include.mk))

##-------------------##
##---]  TARGETS  [---##
##-------------------##
include $(ONF-MAKEDIR)/targets/include.mk # clean, sterile

$(if $(DEBUG),$(warning LEAVE))

mk-include--onf-make := true

endif # mk-include--onf-make

# [EOF]
