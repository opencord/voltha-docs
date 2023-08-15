Repository: voltha-lib-go
=========================

- Tag and branch repositories (order is important)
- Update .gitreview, set defaultbranch=voltha-2.12-beta for commits
- Update VERSION file to prevent future conflicts.


Release branching and tagging
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Releasing repository voltha-lib-go requires tag-then-release branching,
first create a versioned tag 2.12.0-beta then create branch voltha-2.12-beta
from the release tag.

Repository tag names differ based on repository, golang repositories
use tags with the prefix vee v1.2.3, v2.45.0

.. code-block:: shell-session
   :caption: First create a release tag

   # Determine repository tagname convention (with/with-out vee)
   git clone "ssh://gerrit.opencord.org:29418/${repo_name}.git"
   git tag --list-tags

   # ---------------------------
   # Step 1 create a release tag
   # ---------------------------
   local branch_name='voltha-2.12-beta'
   local tag_name='v2.12.0-beta'

   git tag -a "$tag_name" -m "${branch_name} release"
   git push origin "$tag_name"

.. code-block:: shell-session
   :caption: Create a release branch attached to the release tag

   # ------------------------------------------------------------
   # Step 2 - create a release branch attached to the release tag
   # ------------------------------------------------------------
   local branch_name='voltha-2.12-beta'
   local tag_name='v2.12.0-beta'
   local repo_name='voltha-lib-go'

   git clone "ssh://gerrit.opencord.org:29418/${repo_name}.git"
   git fetch --all --tags

   git checkout -b "$branch_name" "tags/tag_name"
   git push origin "$branch_name" "tags/$tag_name"

See Also
--------
https://docs.voltha.org/master/release_notes/release_process.html


.gitreview
----------

.. code-block:: shell-session
   :caption: Create a release branch attached to the release tag

   grep -v 'defaultbranch' .gitreview > .gitreview.tmp
   echo "defaultbranch=voltha-2.12-beta" >> .gitreview.tmp
   mv -f .gitreview.tmp .gitreview


VERSION File
^^^^^^^^^^^^

Minor release version number must be incremented to prevent future conflicts
with the patch branch.

- branch=main VERSION=1.2.3

  - Update VERSION to contain 1.2.4 or 1.3.0
  - commit and merge

  - Update VERSION file/patch branch to contain 1.2.3.1
  - commit and merge


Patch creation on release branch
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Note: Devs should create a dev branch for merging rather than manipulating
the release branch directly as these instructions will.

- git checkout -b voltha-2.12 tags/v2.12.0
- git pull --ff-only origin voltha-2.12
- git rebase -i voltha-2.12
- git diff --name-only votlha-2.12 2>&1 | less
- git review --reviewers foo@foo bar@bar

Patch creation on release branch
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`docs.voltha.org - create the initial release <https://docs.voltha.org/master/release_notes/release_process.html#creating-the-initial-release>`_

- git clone ssh://gerrit.opencord.org:29418/voltha-protos.git
- git checkout -b dev_tux
- Edit VERSION file, increment and suffix a -dev modifier

  - VERSION file contains 5.4.3
  - Increment and commit 5.4.4-dev
