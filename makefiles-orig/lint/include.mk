# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2022-2023 Linux Foundation Broadband Contributors
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
# SPDX-FileCopyrightText: 2022-2023 Linux Foundation Broadband Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------
# https://gerrit.lfbroadband.org/plugins/gitiles/lf-bb-make
# LF BB.makefile.version = 1.1
# -----------------------------------------------------------------------

$(if $(DEBUG),$(warning ENTER))

help ::
	@echo
	@echo "[LINT]"

# -----------------------------------------------------------------------
# disable temporarily, this repo was a staging area for makefile edits.
# lf-bb-mk-tmp= is in conflict between repo:lf-bb-make and repo:voltha-docs.
# -----------------------------------------------------------------------
# include $(lf-bb-mk-dir)/lint/doc8/include.mk
# include $(LF_BB_MAKEDIR)/lint/doc8/include.mk
include $(LF_BB_MAKEDIR)/lint/groovy/include.mk
include $(LF_BB_MAKEDIR)/lint/jjb.mk
include $(LF_BB_MAKEDIR)/lint/json.mk
include $(LF_BB_MAKEDIR)/lint/license/include.mk
include $(LF_BB_MAKEDIR)/lint/makefile.mk
include $(LF_BB_MAKEDIR)/lint/python/include.mk
include $(LF_BB_MAKEDIR)/lint/shell.mk
# include $(LF_BB_MAKEDIR)/lint/tox/include.mk
include $(LF_BB_MAKEDIR)/lint/yaml.mk

include $(LF_BB_MAKEDIR)/lint/help.mk

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
