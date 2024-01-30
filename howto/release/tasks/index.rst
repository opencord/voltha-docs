Release Tasks
=============

BUILD[baseline]: detect pre-existing corruption
-----------------------------------------------

- Apply cosmetic edits to sorce: comments, formatting, nothing that changes logic flow.
- Update copyright notice ending date (if December release).
- gofmt - standard golang source formatting.
- Else add/modify comments in all sources.
- These edits are cosmetic and should be a NOP.
- Failing jobs are a sign of pre-existing corruption.  Open a jira ticket and fix.

BUILD[pre-release]: dependency and module updates
-------------------------------------------------

- :ref:`Release Task Golang Mod Update`
- :ref:`Release Task Copyright`

Standard syntax & formatting
----------------------------

- Golang syntax fomatting :ref:`Release Task Golang Syntax`

golang
^^^^^^

Use the gofmt command to reformat golang sources gathered outside the vendor/ directory.

.. code-block:: shell-session
   :caption: Standard syntax formatting for golang source

   % make golang-fmt

   % cd mysandbox
   % find . ! -path './vendor/\*' -name '*.go' -print0 \
     | xargs -n1 gofmt -s -e -w


Chart.yaml
----------

- Update version string(s) for voltha-lib-go.
