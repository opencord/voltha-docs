# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2023 Open Networking Foundation (ONF) and the ONF Contributors
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
# SPDX-FileCopyrightText: 2023 Open Networking Foundation (ONF) and the ONF Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------
# https://gerrit.opencord.org/plugins/gitiles/onf-make
# ONF.makefile.version = 1.0
# -----------------------------------------------------------------------
# Setup:
#   1) Makefile
#      include config.mk
#      include makefiles/include.mk
#   2) cd makefiles
#   23 copy makefiles_include_mk.ex into $repo/makefiles/include.mk
#   4) make create-onf-lib
# -----------------------------------------------------------------------

$(if $(DEBUG),$(warning ENTER))

## -----------------------------------------------------------------------
## Define vars based on relative import (normalize symlinks)
## Usage: include makefiles/onf/include.mk
## -----------------------------------------------------------------------
onf-mk-abs    ?= $(abspath $(lastword $(MAKEFILE_LIST)))
onf-mk-top    := $(subst makefiles/include.mk,$(null),$(onf-mk-abs))

LEGACY := 1
ifdef LEGACY
  # Cleanup patch forthcoming
  onf-mk-lib    := $(onf-mk-top)/makefiles-orig
else
  onf-mk-lib    := $(onf-mk-top)/makefiles/onf-lib/makefiles
endif

onf-mk-loc    := $(onf-mk-top)/makefiles/local
TOP           ?= $(onf-mk-top)

## ------------------------------------------------------
## Two distinct vars needed to access library or project
## ------------------------------------------------------
ONF_MAKEDIR ?= $(onf-mk-lib)
MAKEDIR     ?= $(onf-mk-loc)

## -----------------------------------------------------------------------
## Load makefiles in order:
##   1) Library constants and logic loaded first
##   2) Parameterize and augment targets from local (repo specific)
## -----------------------------------------------------------------------
include $(lf-sbx-root)/lf/config.mk # include $(onf-mk-top)/makefiles/config.mk
include $(onf-mk-lib)/include.mk
include $(onf-mk-loc)/include.mk

## -----------------------------------------
## Submodue init target for new repositories
## -----------------------------------------
create-onf-lib : $(onf-mk-lib)
$(onf-mk-lib):
	mkdir -p $(dir $@)# makefiles
	cd $(dir $@) \
	    && git submodule https://github.com/opencord/onf-make.git onf-lib

update-submodules:
	git submodule foreach git pull

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
