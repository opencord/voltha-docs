.. _Release Repository ci-management:

Repository: ci-management
=========================

- `repo:ci-management <https://gerrit.opencord.org/plugins/gitiles/ci-management>`_
- First repsitory to release.
- One of only three repositories to branch-then-tag.
- Dependency for releasing all other repositories, test suites are
  launched from release branch=votha-X.Y.

Release: {Tag,Branch}ing script
-------------------------------
`repo:voltha-release <https://github.com/joey-onf/voltha-release>`_ :: `bttb.sh <https://github.com/joey-onf/voltha-release/blob/origin/master/bttb.sh>`_ (branch-tag/or/tag-branch)

The bttb.sh script will perform several tasks to release a repository.

- Clone a named sandbox.
- Identify release activity by repository name: tag-branch or branch-tag.

## Identify release activity by repository (TagBranch-or-BranchTag)

.. code :: python

  # Identify by repository name then tag-branch or branch-tag:
  if repo in ['ci-management', 'voltha-helm-charts', 'voltha-system-tests']:
      create_branch voltha-X.Y
      create_tag attached to branch=voltha-X.Y
  else:
      create_tag 2.12.0 OR v2.12.0
      create_branch voltha-2.12 attached to tag=2.12.0

   % git push {tags,branches}

## Create a release dev branch for edits

.. code-block:: shell-session
   :caption: Identify release activity by repository

   % git clone -b dev-joey voltha-2.12  (or origin/voltha-2.12)

   # Edit VERSION file: X.Y.{1+Z}
   % echo 'X.Y.{1+Z}' > VERSION

   # Edit .gitreview: defaultbranch=voltha-X.Y
   % grep -v 'defaultbranch' .gitreview > .gitreview.tmp
   % echo "defaultbranch=voltha-2.12" >> .gitreview.tmp
   % mv -f .gitreview.tmp .gitreview

## Command usage: bttb.sh

.. code-block:: shell-session
   :caption: Release tagging and branching

   % git clone ssh://gerrit.opencord.org:29418/voltha-release
   % cd voltha-release

   % ./bttb.sh --help

   declare -a args=()

   args+=('--clean')                  # Remove existing checkouts
   args+=('--edit')                   # Edit VERISON, commit message, etc

   args+=('--[no-]gerrit')            # View repo branch & tags early
   args+=('--sandbox' './sandbox')    # git clone target directory

   args+=('--repo' 'ci-management')
   args+=('--version' '2.12')         # votlha-2.12 release

   args+=('--jira' 'VOL-5020') # Jira ticket: release the repository
   args+=('--jira' 'VOL-5021') # addendum
   args+=('--jira' 'VOL-5022')

   # Generate branch={master,voltha-2.12} commit messages
   args+=('--commit-message-dir' "${PWD}/sandbox/messages")

   % ./bttb.sh "${args[@]}" 2>&1 | tee ci-management.log

See Also
--------
https://docs.voltha.org/master/release_notes/release_process.html
