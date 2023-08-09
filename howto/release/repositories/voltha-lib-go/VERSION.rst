Repository: voltha-lib-go
=========================

Releasing repository voltha-lib-go requires tag-then-release branching,
first create a versioned tag 2.12.0-beta then create branch voltha-2.12-beta
from the release tag.

Repository tag names differ based on repository, golang repositories
use tags with the prefix vee v1.2.3, v2.45.0

.. code-block:: shell-session
   :caption: First create a release tag

   ## Determine repository tagname convention (with/with-out vee)
   git tag --list-tags

   ## ---------------------------
   ## Step 1 create a release tag
   ## ---------------------------
   local branch_name='voltha-2.12-beta'
   local tag_name='v2.12.0-beta'
   git tag -a "$tag_name" -m "${branch_name} release"
   git push origin "$tag_name"

.. code-block:: shell-session
   :caption: Create a release branch attached to the release tag

   ## ------------------------------------------------------------
   ## Step 2 - create a release branch attached to the release tag
   ## ------------------------------------------------------------
   local branch_name='voltha-2.12-beta'
   local tag_name='v2.12.0-beta'
   local repo_name='voltha-lib-go'

   git clone "ssh://gerrit.opencord.org:29418/${repo_name}.git"
   git fetch --all --tags

   git checkout -b "$branch_name" "tags/tag_name"
   git push origin "$branch_name" "tags/$tag_name"
   git tag -a "$tag_name" -m "${branch_name} release"
   git push origin "$tag_name"
 
See Also
--------
https://docs.voltha.org/master/release_notes/release_process.html   
