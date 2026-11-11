#!/usr/bin/env bash
# -----------------------------------------------------------------------
# Copyright 2026 Linux Foundation Broadband Contributors
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
# SPDX-FileCopyrightText: 2026 Linux Foundation Broadband Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------
# Intent: Stage everything Sphinx needs from external repositories before
#         a docs build. This is the pre-build step for Read the Docs and
#         the body of `make prep` for local builds.
#
#   1. For every entry in git_refs: clone the repo under repos/, check
#      out the requested ref, and copy the requested subdirectory to
#      ./<repo>/ (where index.rst toctrees expect it).
#   2. Generate Robot Framework HTML docs (libdoc/testdoc) for
#      voltha-system-tests and cord-tester into _static/, where
#      testing/index.rst links to them.
#
# Environment:
#   REPO_HOST      git host prefix          (default: https://github.com/opencord)
#   REPOS_DIR      clone cache directory    (default: repos)
#   SKIP_CHECKOUT  repo name whose checkout should be left untouched
#                  (pre-populate repos/<name> to validate a patchset)
#   PYTHON         interpreter with robotframework installed (default: python3)
# -----------------------------------------------------------------------

set -euo pipefail

TOP="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$TOP"

REPO_HOST="${REPO_HOST:-https://github.com/opencord}"
REPOS_DIR="${REPOS_DIR:-repos}"
SKIP_CHECKOUT="${SKIP_CHECKOUT:-}"
PYTHON="${PYTHON:-python3}"

log() { printf '\n==> %s\n' "$*"; }

# -----------------------------------------------------------------------
# 1. Clone / checkout / copy external repos listed in git_refs
# -----------------------------------------------------------------------
mkdir -p "$REPOS_DIR"

while read -r repo subdir ref _; do
    # skip blanks, comments and the column header line
    case "$repo" in ''|'#'*|'_'*) continue ;; esac

    dest="$REPOS_DIR/$repo"

    if [ ! -d "$dest/.git" ]; then
        log "clone $repo @ $ref"
        if [[ "$ref" =~ ^[0-9a-f]{7,40}$ ]]; then
            # a commit sha cannot be fetched with --branch; need history
            git clone --quiet "$REPO_HOST/$repo" "$dest"
        else
            git clone --quiet --depth 1 --branch "$ref" "$REPO_HOST/$repo" "$dest"
        fi
    fi

    if [ "$SKIP_CHECKOUT" != "$repo" ]; then
        git -C "$dest" checkout --quiet "$ref"
    else
        log "SKIP_CHECKOUT=$repo: using repos/$repo as-is"
    fi

    log "copy $repo$subdir -> $repo/"
    rm -rf "$repo"
    cp -r "$dest$subdir" "$repo"
    rm -rf "$repo/.git"
done < git_refs

# -----------------------------------------------------------------------
# 2. Robot Framework documentation -> _static/
#
#   robot_docs <repo> <out> <mode> <glob>...
#     mode=lib  : robot.libdoc  (libraries, resources, python keyword libs)
#     mode=test : robot.testdoc (test suites)
#   Output path mirrors the source path with an .html suffix.
# -----------------------------------------------------------------------
robot_docs() {
    local repo="$1" out="$2" mode="$3"
    shift 3
    local src rel html
    for src in "$@"; do
        [ -e "$src" ] || continue
        rel="${src#"$repo"/}"
        html="$out/${rel%.*}.html"
        mkdir -p "$(dirname "$html")"
        case "$mode" in
            lib)  "$PYTHON" -m robot.libdoc --format HTML "$src" "$html" ;;
            test) "$PYTHON" -m robot.testdoc "$src" "$html" ;;
        esac
    done
}

log "robot docs: voltha-system-tests"
out="_static/voltha-system-tests"
rm -rf "$out"
robot_docs voltha-system-tests "$out" lib  voltha-system-tests/libraries/*.robot
robot_docs voltha-system-tests "$out" test voltha-system-tests/tests/*/*.robot

log "robot docs: cord-tester"
out="_static/cord-tester"
rm -rf "$out"
pylibs=()
for f in cord-tester/cord-robot/CORDRobot/*.py; do
    [ "$(basename "$f")" = "__init__.py" ] || pylibs+=("$f")
done
robot_docs cord-tester "$out" lib  "${pylibs[@]}"
robot_docs cord-tester "$out" lib  cord-tester/cord-robot/CORDRobot/rf-resources/*.resource
robot_docs cord-tester "$out" test cord-tester/src/test/cord-api/Tests/*/*.robot

log "done"

# [EOF]
