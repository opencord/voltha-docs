Quickstart Guide: Editing
=========================

Intent
------

This quickstart guide decribes how to modify and commit changes that will
be visible on https://docs.voltha.org.

Clone repo:voltha-docs
----------------------

.. code:: bash

   # Clone repo:voltha-docs
   git clone ssh://gerrit.opencord.org:29418/voltha-docs.git

   # Create a developer branch
   git checkout -b dev-joey

.. code-block:: shell-session
   :linenos:
   :emphasize-lines: 2

   # Clone repo:voltha-docs
   git clone ssh://gerrit.opencord.org:29418/voltha-docs.git

   # Create a developer branch
   git checkout -b dev-joey

Repositories:
[`gerrit <https://gerrit.opencord.org/plugins/gitiles/voltha-docs>`_],
[`github <https://github.com/opencord/voltha-docs>`_]

.. code-block:: shell-session
   :linenos:
   :emphasize-lines: 2,5

   # Clone repo:voltha-docs
   git clone ssh://gerrit.opencord.org:29418/voltha-docs.git

   # Create a developer branch
   git checkout -b dev-joey

Interactive development
-----------------------

.. code-block:: shell-session
   :caption: Launch a browser for viewing local edits
   :linenos:
   :emphasize-lines: 4

   cd voltha-docs
   make reload

- source edit: modify reStructuredText (RST) sources
- Modify content to taste

Invoke checkin tests locally
----------------------------

.. code-block:: shell-session
   :linenos:
   :emphasize-lines: 3

   cd voltha-docs
   make sterile
   make test

.. list-table:: makefile targets for testing
   :widths: 30,50
   :header-rows: 2

   * - make target
     - Description
   * -
     -
   * - make test
     - Kitchen sink target: invokes all checkin tests (make lint linkcheck)
   * - make lint
     - Syntax check by source: rst, python
   * - make linkcheck
     - Verify URLs inlined within rst files are valid

Document and commit changes for git log
---------------------------------------

.. code-block:: shell-session

   # Commit message:
   #   - symmarize changes with jira ticket linkage.
   #   - jenkins will update jira ticket with status when a job is run.
   echo '[VOL-XXXX] update voltha.docs' > commit_message

   # Commit message: Capture list of modified files
   git status >> commit_message

   # Commit message: Capture source diffs
   git diff >> commit_message

   # Summarize changes for git log
   $EDIT commit_message

   # git add <modified files>

   # Commit changes to revision control
   git commit -F commit_message

   # Rebase your sandbox, merge branch=master into branch=dev-joey
   ... git rebase documentation URL needed here ...

   # Create a patch and request a code review
   git review --reviewers email1 email2 email3


Sample commit message
---------------------

.. code-block:: shell-session

   # Line 1: Commit message summary for git log
   #   - 50cpl max else a warning displayed.
   #   - jira tickets are updated by jenkins as jobs are run.
   [VOL-xxxx] - Update voltha docs

   # Optional extra jira tickets related to the patch
   [VOL-yyyy]
   [VOL-zzzz]

   jjb/pipeline/voltha/master/bbsim-tests.groovy
   vars/installKind.groovy
   vars/installKind.sh
   --------------------------------------------------
     o Refactor inlined installer logic into a standalone script for reuse.
     o Updated voltha-system-tests makefiles, added a target to install
       the kind command (centrally, consistent version!) similar to kail.

Extra credit
------------

- Update `copyright notice <https://github.com/joey-onf/copyright/blob/origin/master/notice>`_ in the year files are modified (`repo:copyright <https://github.com/joey-onf/copyright>`_).

- Syntax checking source

.. code-block:: shell-session

   make help | grep lint
   make lint

- make test

.. code-block:: shell-session

   make test  # Invoke: make lint linkcheck

- Warning triage and cleanup.

.. code-block:: shell-session

   make sterile
   make html 2>&1 | sed -e 's/WARNING/\nWARNING/g' | less --ignore-case --hilite-search '/WARNING'

Caveat(s)
---------

- An overnight process is responsible for publishing repo:voltha-docs
  edits on https://docs.voltha.org.  Due to this delay it can take
  up to 24 hours before changes become visible on the website.
