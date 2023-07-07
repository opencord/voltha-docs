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
]

# [EOF]
