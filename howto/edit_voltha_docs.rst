Modify docs.voltha.org
======================

Docs for VOLTHA can be found on the website or via web search:

- https://docs.voltha.org
- https://docs.voltha.org/master/index.html

   - Note: Google search may return an older doc version for topics.
   - Navigate to /master/index.html and use the builtin searchbox to always view current documentation for VOLTHA.

Browse repository content:

- https://gerrit.opencord.org/plugins/gitiles/voltha-docs

Checkout, modify and test:

.. sourcecode:: shell

   $ git clone ssh://gerrit.opencord.org:29418/voltha-docs

   $ cd voltha-docs
   $ vi *.rst
   $ make html           # doc generation
   $ make test           # syntax check *.rst files

   $ "$BROWSER" _build/html/index.html  # BROWSER='firefox'
