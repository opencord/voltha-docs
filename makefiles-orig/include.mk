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
# https://gerrit.lfbroadband.org/plugins/gitiles/lf-bb-make
# LF BB.makefiles.include.version = 1.1
# -----------------------------------------------------------------------

ifndef mk-include--lf-bb-make # single-include guard macro

$(if $(DEBUG),$(warning ENTER))

## -----------------------------------------------------------------------
## Define vars based on relative import (normalize symlinks)
## Usage: include makefiles-orig/LF BB/include.mk
## -----------------------------------------------------------------------
lf-bb-mk-abs    ?= $(abspath $(lastword $(MAKEFILE_LIST)))
lf-bb-mk-top    := $(subst /include.mk,$(null),$(lf-bb-mk-abs))
LF_BB_MAKEDIR   := $(lf-bb-mk-top)

TOP ?= $(patsubst %/makefiles-orig/include.mk,%,$(lf-bb-mk-abs))

include $(LF_BB_MAKEDIR)/consts.mk
include $(LF_BB_MAKEDIR)/help/include.mk       # render target help
include $(LF_BB_MAKEDIR)/utils/include.mk      # dependency-less helper macros
include $(LF_BB_MAKEDIR)/etc/include.mk        # banner macros
include $(LF_BB_MAKEDIR)/commands/include.mk   # Tools and local installers

include $(LF_BB_MAKEDIR)/virtualenv.mk#        # lint-{jjb,python} depends on venv
include $(LF_BB_MAKEDIR)/patches/include.mk#   # Patch when python 3.10+ in use
include $(LF_BB_MAKEDIR)/lint/include.mk

include $(LF_BB_MAKEDIR)/gerrit/include.mk
include $(LF_BB_MAKEDIR)/git/include.mk
include $(LF_BB_MAKEDIR)/jjb/include.mk

$(if $(USE-VOLTHA-RELEASE-MK),\
  $(eval include $(LF_BB_MAKEDIR)/release/include.mk))

include $(LF_BB_MAKEDIR)/todo.mk
include $(LF_BB_MAKEDIR)/help/variables.mk

##---------------------##
##---]  ON_DEMAND  [---##
##---------------------##
$(if $(USE-LF-BB-GERRIT-MK),$(eval include $(LF_BB_MAKEDIR)/gerrit/include.mk))
$(if $(USE-LF-BB-DOCKER-MK),$(eval include $(LF_BB_MAKEDIR)/docker/include.mk))

##-------------------##
##---]  TARGETS  [---##
##-------------------##
include $(LF_BB_MAKEDIR)/targets/include.mk # clean, sterile

$(if $(DEBUG),$(warning LEAVE))

mk-include--lf-bb-make := true

endif # mk-include--lf-bb-make

# [EOF]
