.. _Release Task Golang Syntax:

GOLANG: Syntax formatting with gofmt
====================================

Use the gofmt command to reformat golang sources gathered outside the vendor/ directory.

.. code-block:: shell-session
   :caption:

   % make golang-fmt

   % cd mysandbox
   % find . ! -path './vendor/\*' -name '*.go' -print | xargs -n1 gofmt -s -e -w
