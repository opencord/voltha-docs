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
