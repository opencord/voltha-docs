# -*- coding: utf-8 -*-
#
# Configuration file for the Sphinx documentation builder.
#
# This file does only contain a selection of the most common options. For a
# full list see the documentation:
# http://www.sphinx-doc.org/en/master/config

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.

##-------------------##
##---]  IMPORTS  [---##
##-------------------##
import os
import sys
from pathlib import Path

if True:
    pwd = Path(__file__).parent.as_posix()
    sys.path.append(pwd)

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
def get_version():
    with open("VERSION") as f:
        return f.read().strip()

# -- Project information -----------------------------------------------------

project = u'VOLTHA Docs'
copyright = u'Copyright 2019-2023 Open Networking Foundation (ONF) and the ONF Contributors'
author = u'VOLTHA Contributors'

# The short X.Y version
version = get_version()
# The full version, including alpha/beta/rc tags
release = version

# -- General configuration ---------------------------------------------------

# If your documentation needs a minimal Sphinx version, state it here.
#
# needs_sphinx = '1.0'

# make all warnings errors
warning_is_error = True

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'recommonmark',
    'sphinx.ext.coverage',
    'sphinx.ext.extlinks',
    'sphinx.ext.graphviz',
    'sphinx.ext.ifconfig',
    'sphinx.ext.mathjax',
    'sphinx.ext.todo',
    'sphinxcontrib.spelling',
    "sphinx_multiversion",
    "sphinx.ext.intersphinx",
    "sphinxcontrib.openapi",
]

# API documentation
# https://github.com/rtfd/sphinx-autoapi
# https://sphinx-autoapi.readthedocs.io
#   autoapi_type = 'go'
#   autoapi_dirs = [
#       'voltha-go/cli/util',
#       'voltha-go/rw_core/config',
#       'voltha-go/rw_core/core',
#       'voltha-go/rw_core/graph',
#       'voltha-go/rw_core/utils',
#   ]

# Text files with lists of words that shouldn't fail the spellchecker:
spelling_word_list_filename=['dict.txt', ]

#sphinx-multiversion prep, run in each versioned source directory
prep_commands = [
    'ln -sf _root_/repos _target_/repos',
    'make prep',
]

# don't include tags
smv_tag_whitelist = None

# inlcude only the branches matching master and voltha-*
smv_branch_whitelist = r'^(master|voltha-.*)$'

# include all remote branches
smv_remote_whitelist = r'^.*$'

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The suffix(es) of source filenames.
# You can specify multiple suffix as a list of string:
#
# source_suffix = ['.rst', '.md']
source_suffix = ['.rst', '.md']

# The master toctree document.
master_doc = 'index'

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
language = None

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
        '**/__pycache__', # generated - faster traversal
# Revisit: one directory pattern is sufficient.
        '**/doc_venv',
        '**/venv_docs',
        '**/virtualenv',
        '**/vst_venv',
]

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = None

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'

html_logo = '_static/voltha.svg'

html_favicon = '_static/voltha-favicon-128.png'

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
#
html_theme_options = {
    'logo_only': True
}

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

# Custom sidebar templates, must be a dictionary that maps document names
# to template names.
#
# The default sidebars (for documents that don't match any pattern) are
# defined by theme itself.  Builtin themes are using these templates by
# default: ``['localtoc.html', 'relations.html', 'sourcelink.html',
# 'searchbox.html']``.
#
# html_sidebars = {}



# -- Options for HTMLHelp output ---------------------------------------------

# Output file base name for HTML help builder.
htmlhelp_basename = 'VOLTHADocs'


# -- Options for LaTeX output ------------------------------------------------

latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    #
    # 'papersize': 'letterpaper',

    # The font size ('10pt', '11pt' or '12pt').
    #
    # 'pointsize': '10pt',

    # Additional stuff for the LaTeX preamble.
    #
    # 'preamble': '',

    # Latex figure (float) alignment
    #
    # 'figure_align': 'htbp',
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title,
#  author, documentclass [howto, manual, or own class]).
latex_documents = [
    (master_doc, 'VOLTHADocs.tex', u'VOLTHA Docs',
     u'VOLTHA Team', 'manual'),
]


# -- Options for manual page output ------------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [
    (master_doc, 'VOLTHA Docs', u'VOLTHA Docs',
     [author], 1)
]


# -- Options for Texinfo output ----------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
    (master_doc, 'VOLTHA Docs', u'VOLTHA Docs',
     author, 'VOLTHADocs', 'One line description of project.',
     'Miscellaneous'),
]


# -- Options for Epub output -------------------------------------------------

# Bibliographic Dublin Core info.
epub_title = project

# The unique identifier of the text. This can be a ISBN number
# or the project homepage.
#
# epub_identifier = ''

# A unique identification for the text.
#
# epub_uid = ''

# A list of files that should not be packed into the epub file.
epub_exclude_files = ['search.html']


# -- Extension configuration -------------------------------------------------

# blockdiag/etc. config

rackdiag_antialias = True
rackdiag_html_image_format = "SVG"
rackdiag_fontpath = [
    "_static/fonts/Inconsolata-Regular.ttf",
    "_static/fonts/Inconsolata-Bold.ttf",
]

nwdiag_antialias = True
nwdiag_html_image_format = "SVG"
nwdiag_fontpath = [
    "_static/fonts/Inconsolata-Regular.ttf",
    "_static/fonts/Inconsolata-Bold.ttf",
]

# -- Options for extlinks extension ------------------------------------------
# ..seealso: https://www.sphinx-doc.org/en/master/usage/extensions/todo.html
#        'vhc' : 'https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts',

extlinks=\
    {
        'vol-jira' : ('https://jira.opencord.org/projects/VOL/issues/%s', 'jira::%s'),
        # macros for gerrit or github URL construction
        'repo'     : ('https://github.com/opencord/%s', 'repo::%s'),
        'vol-ger'  : ('https://gerrit.opencord.org/plugins/gitiles/%s', 'gerrit::%s'),
        'vol-git'  : ('https://github.com/opencord/%s', 'git::%s'),
    }

# -- Options for inlining a constant value -----------------------------------
# NOTE: rst_prolog will affect every file in the repository.
# Use per-file substitution to limit scope:
#   https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html
# rst_prolog = """
# .. |voltha-latest| replace:: voltha-2.11
# """

# -- Options for todo extension ----------------------------------------------
# If true, `todo` and `todoList` produce output, else they produce nothing.
todo_include_todos = True

# -- Options for linkcheck ---------------------------------------------------
# The link checker strips off .md from links and then complains
linkcheck_ignore=\
    [
        r'https://github.com/opencord/voltctl/blob/master/LICENSE',
        r'https://github.com/ciena/kind-voltha#voltha-up-configuration-options',
        r'https://www.sphinx-doc.org',
        r'https://github.com/opencord/bbsim/blob/master/docs/source/DMI_Server_README',
        r'https://github.com/opencord/voltha-helm-charts/blob/master/README',
        r'https://github.com/atomix/atomix/releases/tag/atomix-3.1.9',
        r'https://github.com/atomix/atomix/releases/tag/atomix-3.1.8',
        #
        r'../release_notes/voltha_2.2.html',
        r'../release_notes/voltha_2.3.html',
        r'../release_notes/voltha_2.4.html',
        r'../release_notes/voltha_2.5.html',
        r'../release_notes/voltha_2.6.html',
        r'../release_notes/voltha_2.7.html',
        r'../release_notes/voltha_2.8.html',
        r'../release_notes/voltha_2.9.html',
        r'../release_notes/voltha_2.10.html',
        r'../release_notes/voltha_2.11.html',
        #
        r'../voltha-helm-charts/README.html',
    ]

# -- Configure recommonmark to use AutoStructify -----------------------------
# Docs: https://recommonmark.readthedocs.io/en/latest/auto_structify.html

import recommonmark
from recommonmark.transform import AutoStructify

github_doc_root = 'https://github.com/opencord/voltha-docs'

def setup(app):

    app.add_css_file('css/rtd_theme_mods.css')

    app.add_config_value('recommonmark_config', {
            'url_resolver': lambda url: github_doc_root + url,
            'auto_toc_tree_section': 'Contents',
        }, True)

    app.add_transform(AutoStructify)