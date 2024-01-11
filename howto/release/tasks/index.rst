Release Tasks
=============

BUILD[baseline]: detect pre-existing corruption
----------------------------------------------

- Apply cosmetic edits to sorce: comments, formatting, nothing that changes logic flow.
- Update copyright notice ending date (if December release).
- gofmt - standard golang source formatting.
- Else add/modify comments in all sources.
- These edits are cosmetic and should be a NOP.
- Failing jobs are a sign of pre-existing corruption.  Open a jira ticket and fix.

BUILD[pre-release]: dependency and module updates
-------------------------------------------------

- make go mod-update


- Update copyright notices :ref:`Release Task Copyright`
  
Copyright Notice
----------------

.. code-block:: shell-session
   :caption: Update copyrigth notice ending date.

   # Clone copyright repository
   % git clone git@github.com:joey-onf/copyright.git /tmp/copyright

   % cd myrepo
   % /tmp/copyright/gather.sh

Standard syntax & formatting
----------------------------

- Golang syntax fomatting :ref:`Release Task Golang Syntax`6

golang
^^^^^^

Use the gofmt command to reformat golang sources gathered outside the vendor/ directory.

.. code-block:: shell-session
   :caption: 

   % make golang-fmt

   % cd mysandbox
   % find . ! -path './vendor/\*' -name '*.go' -print | xargs -n1 gofmt -s -e -w


Chart.yaml
----------

- Update version string(s) for voltha-lib-go.
