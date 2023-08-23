Release: voltha-onos
====================

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
   :caption: .gitreview for release branch=voltha-2.12

   grep -v 'defaultbranch=' .gitreview > .gitreview.tmp
   echo "defaultbranch=voltha-2.12" >> .gitreview.tmp
   mv -f .gitreview.tmp .gitreview


.gitreview
----------

.. code-block:: shell-session
   :caption: .gitreview for release branch=master

   grep -v 'defaultbranch' .gitreview > .gitreview.tmp
   echo "defaultbranch=master" >> .gitreview.tmp
   mv -f .gitreview.tmp .gitreview


VERSION File
^^^^^^^^^^^^

Minor release version number must be incremented to prevent future conflicts
with the patch branch.  When version file contains either 1.2.1 or 1.2.1-dev:

- branch=main VERSION=1.2.3-dev

  - Update VERSION to contain 1.2.4 or 1.3.0
  - commit and merge

- branch=voltha-2.12 VERSION=1.2.2

  - Update release / bug fix branch
  - commit and merge
