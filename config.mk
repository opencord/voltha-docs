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
# -----------------------------------------------------------------------

##---------------------------------------##
##---]  Disable lint targets by name [---##
##---------------------------------------##
# NO-LINT-DOC8       := true
NO-LINT-FLAKE8       := true#      # NOTE[1]
# NO-LINT-JJB        := true
NO-LINT-JSON       := true
#   python -m json.tool ./_build/linkcheck/output.json
#   Extra data: line 2 column 1 (char 181)
# NO-LINT-MAKE       := true
NO-LINT-PYLINT       := true#      # NOTE[1]
# NO-LINT-PYTHON     := true
NO-LINT-ROBOT      := true#        # NOTE[2]
# NO-LINT-SHELL      := true
# NO-LINT-TOX        := true#      # WIP
# NO-LINT-YAML       := true

# NOTE[1] - Cleanup needed to enable as a default make lint target
# NOTE[2] - Doc repo, no need to lint robot sources here.

##-----------------------------##
##---]  Custom exclusions  [---##
##-----------------------------##
lint-doc8-excl += --ignore-path "vendor"

config-mk-version    := 1.0

# [EOF]
