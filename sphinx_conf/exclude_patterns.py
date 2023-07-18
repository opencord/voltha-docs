# -*- coding: utf-8 -*-
#
# Configuration file for the Sphinx documentation builder.
#
# -----------------------------------------------------------------------

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = [
    '*/LICENSE.md',
    '*/RELEASE_NOTES.md',
    '*/vendor',
    '.DS_Store',
    'Thumbs.db',
    '_build',
    'voltha-go/BUILD.md',
    'cord-tester/venv_cord',
    'cord-tester/docs',
    'cord-tester/src',
    'cord-tester/README.md',
    'cord-tester/cord-robot/README.rst',
    'openolt/agent/*',
    'repos',
    'requirements.txt',
    'bbsim/README.md',
    'CODE_OF_CONDUCT.md',
    '*/CODE_OF_CONDUCT.md',

    # -----------------------------------------------------------------------
    # WARNING: Roach squashing exercise ahead.
    # External repos are sub-modules, sphinx will complain when new files added.
    # -----------------------------------------------------------------------
    # Why are repos pulled in:
    #   - external linkage/direct viewing of the truth ?
    #   - generated content, documentation links       ?
    # -----------------------------------------------------------------------
    # Roach squash: filter files individually as they are added or found (make lint)
    # Simple answer: bulk exclude by subdir to catch all variants.
    # Unknown: will the subdir exclusion break doc generation or navigation ?
    # -----------------------------------------------------------------------
    # 'device-management-interface/README.md',

    # -----------------------------------------------------------------------
    # Jump through hoops for this one:
    #   o openolt/ is an external repo
    #   o lint reported a problem with URL aliases ./BUILDING and .SECURITY
    #   o Cannot exclude by existing or literal path so resort to wildcard
    # -----------------------------------------------------------------------

    'openolt/README.md',
    #   [SECURITY.md](./SECURITY.md)
    #   [BUILDING guide](BUILDING.md)

    'openolt/olt-sw-upgrade/README.md',
    'voltha-helm-charts/makefiles/',
    # 'voltha-helm-charts/makefiles/README.md',
    'voltha-helm-charts/makefiles/README.md',
    #
    'voltha-openonu-adapter-go/templates/README.md',
    # 'device-management-interface/docs/RpcGuidelines.md',
    'voltha-system-tests/patches/*',
    'voltha-system-tests/scripts/flog/',
    #
    'voltha-system-tests/etc/README.md',
    'voltha-system-tests/scripts/README.md',
    #
    'voltctl/MULTIPLE_STACKS.md',
    'voltha-system-tests/tests/data/onos-files/README.md',
    'voltha-openonu-adapter-go/docs/ONU_Upgrade_Notes.md',

    # WARNING: toctree contains reference to excluded document
    # 'openolt/README.md',
    # 'voltha-openonu-adapter-go/README.md',
    'repos/openolt/BUILDING.md',
    'repos/openolt/SECURITY.md',

    # Ignore all:
    'makefiles',
    '__pycache__',
    '**/__pycache__', # generated - faster traversal
    '.venv',
    '**/.venv',       # external virtual env

    # Revisit: one directory pattern is sufficient.
    # makefiles/virtualenv.mk normalizes all of this
    '**/doc_venv',
    '**/venv_docs',
    '**/virtualenv',
    '**/vst_venv',
    '**/venv_cord',
]

# [EOF]
