# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2022 Open Networking Foundation
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

include $(MAKEDIR)/patches/help.mk

patch-gather-args += --exclude=Makefile
patch-gather-args += --exclude-dir=vault
patch-gather-args += --exclude-dir=makefiles
patch-gather-args += --exclude-dir=staging
patch-gather-args += --exclude-dir=patches

# patch-gather-args += -e 'from collections import'
patch-gather-args += '-e' 'from collections import Mapping'
patch-gather-args += '-e' 'from collections import MutableMapping'

VENV_NAME   ?= $(error $(MAKE) VENV_NAME= is required)
PATCH_PATH  ?= $(error $(MAKE) PATCH_PATH= is required)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
patch-gather:
	grep -r $(patch-gather-args)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
patch-diff:
	$(HIDE)diff -qr staging $(VENV_NAME) \
	    | awk '{print "# diff -Naur "$$2" "$$4}' \
	    | tee $@.log

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
patch-create:
	mkdir -p patches/$(PATCH_PATH)
	diff -Naur staging/$(PATCH_PATH) $(VENV_NAME)/$(PATCH_PATH) | tee patches/$(PATCH_PATH)/patch
	exit 1

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
patch-init:
	find "$(VENV_NAME)" -name '__pycache__' -type d -print0 \
	    | xargs -I'{}' --null --no-run-if-empty $(RM) -r {}
	mkdir -p staging
	rsync -rv --checksum "$(VENV_NAME)/." "staging/."
	@echo "Modify files beneath staging/ to create a patch source"

# [SEE ALSO]
# ---------------------------------------------------------------------------
# https://bobbyhadz.com/blog/python-importerror-cannot-import-name-mapping-from-collections
# ---------------------------------------------------------------------------
# [EOF]
