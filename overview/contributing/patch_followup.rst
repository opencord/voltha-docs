Pull request followup
=====================

Once a patch has been submitted gerrit can be used to track progress.

Find your patch
---------------

| Begin by viewing the history for your patch in gerrit.
| A patch can be accessed in a few different ways.

Item of Note:

- A Gerrit Change-Id is required to interact with a patch. This hashed
  value will be distinct from the underlying git checksum used when
  changes are stored in a repository.

Capture commit message output
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Gerrit commit hash and a URL are readily available in output.

.. code-block:: shell-session
   :linenos:
   :emphasize-lines: 22

   % git commit -F ../jira/5100
   % git rebase
   % git review --reviewers tux@onf.org

   remote:
   remote: Processing changes: (\)
   remote: Processing changes: (|)
   remote: Processing changes: (/)
   remote: Processing changes: (-)
   remote: Processing changes: (\)
   remote: Processing changes: (|)
   remote: Processing changes: (/)
   remote: Processing changes: (-)
   remote: Processing changes: new: 1 (\)
   remote: Processing changes: refs: 1, new: 1 (\)
   remote: Processing changes: refs: 1, new: 1 (\)
   remote: Processing changes: refs: 1, new: 1, done
   remote:
   remote: SUCCESS
   remote:
   remote:   https://gerrit.opencord.org/c/ci-management/+/34600 Disable jobs dependent on offline menlo-3 node [NEW]
   fremote:
   To ssh://gerrit.opencord.org:29418/ci-management.git
    * [new reference]     HEAD -> refs/for/master%topic=dev-joey

.. list-table:: Git commit message
   :widths: 20, 5, 60
   :header-rows: 1

   * - Id
     - Line
     - Description
   * -
     - 2
     - Git commit hash
   * - `34598 <https://gerrit.opencord.org/c/ci-management/+/34598>`_
     - 10
     - Gerrit URL for direct patch access
   * -
     - 14
     -

Git log
^^^^^^^

Gerrit Change-IDs are appended as the last line in a commit mesage.
git log can be used to search for them.

.. code-block:: shell-session
   :linenos:
   :emphasize-lines: 3,14

   % git log --author="joey" | less

   commit 23ce887c4cb3f98506536e00c58ffc8c2af16afe
   Author: Joey Armstrong <joey@opennetworking.org>
   Date:   Thu Aug 24 09:46:22 2023 -0400

      [VOL-5009] - Update release notes

      release_notes/voltha_2.12.rst
      -----------------------------
        o Import Mahir(s) word doc containing tickets and descriptions.
        o Reformat using a grid layout so tickets and description are aligned.

      Change-Id: Ic8ca17f5923496731f88ce8918c9852d904ea066

.. list-table:: Git log commit IDs
   :widths: 20, 5, 60
   :header-rows: 1

   * - Id
     - Line
     - Description
   * - 23ce887c4cb3f98506536e00c58ffc8c2af16afe
     - 3
     - Git commit hash
   * - Ic8ca17f5923496731f88ce8918c9852d904ea066
     - 14
     - Gerrit Change-Id


Patch lookup by Change-Id string
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When you have a Change-Id value (~43 chars)

- Change-Id: Ic8ca17f5923496731f88ce8918c9852d904ea066

  - Visit the `Gerrit dashboard <https://gerrit.opencord.org/dashboard/self>`_
  - Paste Change-Id into the search box at the top right
  - Gerrit UI will navigate to the patch.

Brute force patch lookup
^^^^^^^^^^^^^^^^^^^^^^^^

- Visit `Gerrit dashboard open+is:wip <https://gerrit.opencord.org/q/status:open+-is:wip>`_

  - View all open/unmerged patches
  - Scroll down through the list until something of interest is found.
  - Under the # column (2nd column on left hand side) right click and open to view the patch.
  - For example: `repo:voltha-system-tests <https://gerrit.opencord.org/c/voltha-system-tests/+/33380>`_

Patch history and jenkins jobs
------------------------------

While viewing a patch (`repo:voltha-system-tests <https://gerrit.opencord.org/c/voltha-system-tests/+/33380>`_)
scroll down to the 'Change Log' section at the bottom.
| Line items represent historical comments, code review messages and
processed job status.

Entries prefixed with ``Jenkins Technical User`` contain jenkins job
information.  Jenkins pipeline jobs are constructed by performing
several atomic tasks each of which will generate a log with status.

To view job logs click on an entry to expand (Verified +1, 4th entry from
the bottom) to view a set of clickable jenkins URLs.

- `Patch 33380 <https://gerrit.opencord.org/c/voltha-system-tests/+/33380>`_
  - `verify_voltha-system-tests_unit-test <https://jenkins.opencord.org/job/verify_voltha-system-tests_unit-test>`_          : SUCCESS
  - `verify_voltha-system-tests_licensed <https://jenkins.opencord.org/job/verify_voltha-system-tests_licensed>`_       : SUCCESS
  - `verify_voltha-system-tests_sanity-test <https://jenkins.opencord.org/job/verify_voltha-system-tests_sanity-test>`_ : FAILED
