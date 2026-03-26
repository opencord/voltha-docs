# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2023-2024 Linux Foundation Broadband Contributors
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
# SPDX-FileCopyrightText: 2023-2024 Linux Foundation Broadband Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------

$(if $(DEBUG),$(warning ENTER))

## -----------------------------------------------------------------------
## Infer path to cloned sandbox root
## [TODO] Deprecate TOP=
## -----------------------------------------------------------------------
lf-sbx-root   := $(abspath $(lastword $(MAKEFILE_LIST)))
lf-sbx-root   := $(subst /lf/include.mk,$(null),$(lf-sbx-root))

## -----------------------------------------------------------------------
## Define vars based on relative import (normalize symlinks)
## Usage: include makefiles/LF BB/include.mk
## -----------------------------------------------------------------------
lf-bb-mk-abs    := $(abspath $(lastword $(MAKEFILE_LIST)))
lf-bb-mk-top    := $(subst /include.mk,$(null),$(lf-bb-mk-abs))
lf-bb-mk-lib    := $(lf-bb-mk-top)/onf-make/makefiles
lf-bb-mk-loc    := $(lf-bb-mk-top)/local

TOP           ?= $(patsubst %/makefiles/include.mk,%,$(lf-bb-mk-abs))

## -----------------------------------------------------------------------
## This variable is a bridge to help transition away from legacy makefiles.
## -----------------------------------------------------------------------
legacy-mk     := $(lf-sbx-root)/makefiles

## ------------------------------------------------------
## Two distinct vars needed to access library or project
## ------------------------------------------------------
LF_BB_MAKEDIR ?= $(lf-bb-mk-lib)
MAKEDIR     ?= $(lf-bb-mk-loc)

# -----------------------------------------------------------------------
# Load per-repository conditionals
# Load late else alter MAKEFILE_LIST
# NOTE: config.mk can be removed if dynamic feature detection by
#       file extension is added.
# -----------------------------------------------------------------------
include $(wildcard $(lf-sbx-root)/config.mk $(lf-sbx-root)/lf/config.mk)

## -----------------------------------------------------------------------
## Load makefiles in order:
##   1) Library constants and logic loaded first
##   2) Parameterize and augment targets from local (repo specific)
## -----------------------------------------------------------------------
include $(lf-bb-mk-lib)/include.mk
include $(lf-bb-mk-loc)/include.mk

## Define late so caller (?- env --ignore-environment -?)
GIT ?= /usr/bin/env git

## -----------------------------------------------------------------------
## Intent: This target will update dependent git-submodule to the latest
##         version available from the remote repository.  Subsequently
##         a checkin will be needed to make the submodule update permanent.
## -----------------------------------------------------------------------
.PHONY: update-git-submodules
update-git-submodules:
	$(GIT) submodule foreach git pull

## -----------------------------------------------------------------------
## Intent: On-demand cloning of git submodule(s).
## -----------------------------------------------------------------------
## Trigger: include $(lf-bb-mk-lib)/include.mk
##   - When the make command attempts to include a makefile from the
##     repo:onf-make submodule, this target/dependency will initialize
##     and checkout all submodules the current repository depends on.
## -----------------------------------------------------------------------
.PHONY: git-submodules
git-submodules : $(lf-bb-mk-lib)/include.mk

$(lf-bb-mk-lib)/include.mk:

	$(call banner-enter,(Checkout git submodules))

	$(GIT) submodule update --init --recursive

	$(call banner-leave,(Checkout git submodules))

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help-git :
	@printf '  %-33.33s %s\n' 'git-submodules' \
	  'Init and recursive checkout of git submodule(s)'
	@printf '  %-33.33s %s\n' 'update-git-submodules' \
	  'Update git submodule(s) to the latest version'

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
