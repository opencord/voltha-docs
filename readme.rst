Documentation Guide
===================

Writing Documentation
---------------------

Docs are generated using `Sphinx <https://www.sphinx-doc.org/en/master/>`_.

Documentation can be written in `reStructuredText
<https://www.sphinx-doc.org/en/master/usage/restructuredtext/>`_ (``.rst``)  or
`Markdown <https://daringfireball.net/projects/markdown/>`_ (``.md``), but
reStructuredText is preferred as that filetype supports features like embedded
diagrams and tables.

In reStructuredText documents, to create the section hierarchy (mapped in HTML
to ``<h1>`` through ``<h5>``) use these characters to underline headings in the
order given: ``=``, ``-`` ``"``, ``'``, ``^``.

Building the Docs
------------------

The published site is built by `Read the Docs <https://readthedocs.org>`_
from ``.readthedocs.yaml``. Before Sphinx runs, RTD executes
``scripts/fetch-external-docs.sh`` which:

- clones every repository listed in ``git_refs`` and copies it into the
  docs source tree (``./bbsim/``, ``./voltctl/``, ...), where
  ``index.rst`` toctrees reference it, and
- renders Robot Framework ``libdoc``/``testdoc`` HTML for
  ``voltha-system-tests`` and ``cord-tester`` into ``_static/``.

To build locally run ``make docs``. This creates a virtualenv (``.venv``),
runs the same staging script, and writes HTML to ``_build/<branch>``. You
may also need to install the ``enchant`` C library using your system's
package manager for the spelling checker to function properly.

To check the formatting of documentation, run ``make lint``. Please do this
before you create a pull request.

To check spelling, run ``make spelling``. If there are additional words that
are correctly spelled but not in the dictionary (acronyms, trademarks, etc.)
please add them to the ``dict.txt`` file.

Creating new Versions of Docs
-----------------------------

To change the version shown on the built site, change the contents of the
``VERSION`` file.

Read the Docs builds one copy of the documentation per activated branch or
tag and provides the version switcher. To publish a release branch
(``voltha-2.x``), activate it in the Read the Docs project settings; the
branch must carry a ``.readthedocs.yaml`` and ``scripts/fetch-external-docs.sh``.

Creating Graphs and Diagrams
----------------------------

Multiple tools are available to render inline text-based graphs definitions and
diagrams within the documentation. This is preferred over images as it's easier
to change and see changes over time as a diff.

`Graphviz
<https://www.sphinx-doc.org/en/master/usage/extensions/graphviz.html>`_
supports many standard graph types.
