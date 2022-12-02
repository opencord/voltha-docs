#!/bin/bash
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

set -euo pipefail

dst="vst_venv"
src="staging"
pat="patches"

declare -a fyls=()
pushd "$pat" >/dev/null
fyls+=( $(find . -name 'patch' -print) )
popd         >/dev/null

if [ $# -eq 0 ]; then set -- apply; fi

while [ $# -gt 0 ]; do
    opt="$1"; shift
    case "$opt" in

	-*venv) dst="$1"; shift ;;

	help)
	    cat <<EOH
apply  - generate patches from vault source.
backup - Archive patch directory
gather - collect potential python files to edit.
EOH
	    ;;

	apply)
	    pushd "$dst" >/dev/null || { echo "pushd $dst failed"; exit 1; }
	    for fyl in "${fyls[@]}";
	    do
		path="${fyl%/*}"

		# Conditional install, jenkins may not support interpreter yet.
		if [ ! -e "$path" ]; then
		    echo "[SKIP] $path"
		    continue
		fi
		
		echo "[APPLY] $path"
		patch -R -p1 < "../$pat/${path}/patch"
	    done
	    popd >/dev/null || { echo "popd $dst failed"; exit 1; }
	    ;;

	backup)
	    mkdir ~/backups
	    pushd "$src" || { echo "pushd $dst failed"; exit 1; }
	    tar czvf ~/backups/vault."$(date '+%Y%m%d%H%M%S')" "${fyls[@]}"
	    popd || { echo "popd $dst failed"; exit 1; }
	    ;;

	gather)
	    for fyl in "${fyls[@]}";
	    do
		patchDir="$pat/$fyl"
		mkdir -p "$patchDir"
		diff -Naur "$src/$fyl" "$dst/$fyl" | tee "$pat/$fyl/patch"
	    done
	    find "$pat" -print
	    ;;
	
	*)
	    echo "ERROR: Unknown action [$opt]"
	    exit 1
	    ;;
    esac

    echo
done

# [EOF]
