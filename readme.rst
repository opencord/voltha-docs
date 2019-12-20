Documentation Guide
===================

Building the Docs
------------------

The documentation build process is stored in the Makefile. Building docs
requires Python to be installed, and most steps will create a virtualenv
(``doc_venv``) which install the documentation generation toolset.

Run ``make html`` to generate html documentation in ``_build/html``.

Run ``make reload`` to get a live reload in your browser (refreshes on document
save).

To check the formatting of documentation, run ``make lint``. This will be done
in Jenkins to validate the documentation, so please do this before you create a
patchset.

To check spelling, run ``make spelling``. If there are additional words that
are correctly spelled but not in the dictionary (acronyms, trademarks, etc.)
please add them to the ``dict.txt`` file.

Writing Docs
------------

Docs written using sphinx: http://www.sphinx-doc.org

Documentation is done in reStructuredText (``.rst``)  or Markdown (``.md``),
but only .rst files can use certain features like embedded diagrams.

reStructuredText Primer:
http://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html

Creating new Versions of Docs
-----------------------------

To change the version shown on the built site, change the ``versions`` variable in ``conf.py``.

There is a ``make versioned`` target which will build all versions published on
the remote to ``_build``.  Note that we're using a fork of the upstream version
of the ``sphinxcontrib-versioning`` module, as the original isn't actively
maintained, and we needed it to be able to handle the symlink checkouts of
other repos that are incorporated.

Creating Diagrams
-----------------

Inline Graphviz is supported:
https://www.sphinx-doc.org/en/master/usage/extensions/graphviz.html

The blockdiag suite of tools can be used for other specific graph types:

- Block diagrams: http://blockdiag.com/en/blockdiag/sphinxcontrib.html
- Network diagrams (& racks): http://blockdiag.com/en/nwdiag/sphinxcontrib.html

Attributes that can be applied to nodes:
http://blockdiag.com/en/blockdiag/attributes/node.attributes.html

Examples:

- blockdiag: http://blockdiag.com/en/blockdiag/examples.html
- nwdiag: http://blockdiag.com/en/nwdiag/nwdiag-examples.html
- rackdiag: http://blockdiag.com/en/nwdiag/rackdiag-examples.html
