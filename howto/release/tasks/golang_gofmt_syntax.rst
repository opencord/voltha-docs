.. _Release Task Golang Syntax:

GOLANG: Syntax formatting with gofmt
====================================

Use the gofmt command to reformat golang sources gathered outside the vendor/ directory.

.. code-block:: shell-session
   :caption: Golang source formatting

   % git clone ssh://gerrit.opencord.org:29418/voltha-lib-go.git
   % cd voltha-lib-go

   % make sterile
   % make golang-fmt

   % find . ! -path './vendor/\*' -name '*.go' -print | xargs -n1 gofmt -s -e -w
