Modify docs.voltha.org
======================

Docs for VOLTHA can be found on the website or via web search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
- https://docs.voltha.org
- https://docs.voltha.org/master/index.html

   - Note: Google search may return an older doc version for topics.
   - Navigate to /master/index.html and use the builtin searchbox to always view current documentation for VOLTHA.

Browse repository content
"""""""""""""""""""""""""
- :vol-ger:`voltha-docs`
- :vol-git:`voltha-docs`

Documentation Guide
===================

Building the Docs
"""""""""""""""""

Building requires python, creates a virtualenv (``doc_venv``) which has all the
necessary tools.

Run ``make html`` to generate html documentation in ``_build/html``.

Run ``make reload`` to get a live reload in your browser (refreshes on document
save).

Run ``make latexpdf`` to generate html documentation in ``_build/latex``.
Requires that you have a recent LaTeX installation and ``latexmk`` installed

Writing Docs
""""""""""""

Docs written using sphinx: https://www.sphinx-doc.org/en/master/

Documentation is done in reStructuredText or Markdown, but only ``.rst`` files
can contain embedded diagrams.

Guides for RST:

- https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html
- https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html

RST has multiple heading formats possible, the ones we're using are in the
order for the HTML h1-h5: ``=``, ``-`` ``"``, ``'``, ``^``.


Checkout, modify and test
"""""""""""""""""""""""""

.. sourcecode:: shell

   $ git clone ssh://gerrit.opencord.org:29418/voltha-docs

   $ cd voltha-docs
   $ vi *.rst
   $ make html           # doc generation
   $ make lint           # syntax checking
   $ make test           # syntax check *.rst files
   $ make docs           # generate website pages

   $ "$BROWSER" _build/html/index.html  # BROWSER='firefox'


Interactive editing: real time updates
""""""""""""""""""""""""""""""""""""""

Another useful convenience makefile target to try is the reload target.
"make reload" will invoke the sphinx-reload program, spawn a web page for
viewing html documentation pages followed by periodic regeneration of page
content.

.. sourcecode:: shell

   $ git clone ssh://gerrit.opencord.org:29418/voltha-docs

   $ cd voltha-docs
   $ make reload
   $ vi *.rst


make lint (syntax checking)
"""""""""""""""""""""""""""
- `make help (pending) <https://gerrit.opencord.org/c/voltha-system-tests/+/33306>`

.. sourcecode:: shell

   $ make help
   $ USAGE: make target [, target(s)]
   $
   $ [LINT]
   $  lint-json            Syntax check json sources
   $  lint-python          Syntax check using pylint and flake8
   $  lint-robot           Syntax check robot sources using rflint
   $  lint-yaml            Syntax check yaml source using yamllint
   $
   $ make lint


make html
"""""""""
- Install python packages: sphinx, pylint, flake8
- Invoke sphinx to generate documentation.


See Also
""""""""
- `RST Markup Documentation <https://rstdoc.readthedocs.io/en/latest>`
- `Sphinx Documentation <https://www.sphinx-doc.org/en/master>`
- `RST Markup Specification <https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html>`
