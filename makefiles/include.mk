# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2023 Linux Foundation Broadband Contributors
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
# SPDX-FileCopyrightText: 2023 Linux Foundation Broadband Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------
# https://gerrit.lfbroadband.org/plugins/gitiles/onf-make
# LF BB.makefile.version = 1.0
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
## Usage: include makefiles/LF BB/include.mk
## -----------------------------------------------------------------------
lf-bb-mk-abs    ?= $(abspath $(lastword $(MAKEFILE_LIST)))
lf-bb-mk-top    := $(subst makefiles/include.mk,$(null),$(lf-bb-mk-abs))

LEGACY := 1
ifdef LEGACY
  # Cleanup patch forthcoming
  lf-bb-mk-lib    := $(lf-bb-mk-top)/makefiles-orig
else
  lf-bb-mk-lib    := $(lf-bb-mk-top)/makefiles/onf-lib/makefiles
endif

lf-bb-mk-loc    := $(lf-bb-mk-top)/makefiles/local
TOP           ?= $(lf-bb-mk-top)

## ------------------------------------------------------
## Two distinct vars needed to access library or project
## ------------------------------------------------------
LF_BB_MAKEDIR ?= $(lf-bb-mk-lib)
MAKEDIR     ?= $(lf-bb-mk-loc)

## -----------------------------------------------------------------------
## Load makefiles in order:
##   1) Library constants and logic loaded first
##   2) Parameterize and augment targets from local (repo specific)
## -----------------------------------------------------------------------
include $(lf-bb-mk-top)/makefiles/config.mk
include $(lf-bb-mk-lib)/include.mk
include $(lf-bb-mk-loc)/include.mk

## -----------------------------------------
## Submodue init target for new repositories
## -----------------------------------------
create-onf-lib : $(lf-bb-mk-lib)
$(lf-bb-mk-lib):
	mkdir -p $(dir $@)# makefiles
	cd $(dir $@) \
	    && git submodule https://github.com/opencord/onf-make.git onf-lib

update-submodules:
	git submodule foreach git pull

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
