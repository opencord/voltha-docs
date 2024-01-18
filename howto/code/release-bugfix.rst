.. _coding-release-bugfix:

Create a patch on a release branch
==================================

Clone & Checkout Release Branch
-------------------------------

.. code-block:: shell-session
   :caption: Release patch: checkout

   # ------------------------------------------------
   # Clone a repostiory of interest (ex: votlha-lib-go)
   # Checkout release branch voltha-2.12 for patching
   # ------------------------------------------------
   % git clone "ssh://gerrit.opencord.org:29418/voltha-lib-go.git"
   % cd voltha-lib-go
   % git checkout voltha-2.12

   # ------------------------------------------------------
   # Or if something is amiss checkout by tag for diagnosis
   # ------------------------------------------------------
   % cat VERSION
   % git checkout tags/v{VERSION-FILE-STRING}

Command output

::
   % git checkout voltha-2.12
   Branch 'voltha-2.12' set up to track remote branch 'voltha-2.12' from 'origin'.
   Switched to a new branch 'voltha-2.12'


.. code-block:: shell-session
   :caption: Create a dev branch from release

   % git checkout -b dev-joey
   % git branch -a

     master
   * voltha-2.12                          <<---** Commits land here
     remotes/origin/HEAD -> origin/master
     remotes/origin/master
     remotes/origin/voltha-2.11
     remotes/origin/voltha-2.12


Verify sandbox tag and branch are release
-----------------------------------------

.. code-block:: shell-session
   :caption: Release patch: Verify checkout

   # ----------------------------------------------------------------
   # Verify tags and branch for your release patch are correct.
   # HEAD will be attached to the branch (and most recent release tag)
   # ----------------------------------------------------------------
   % git fetch --tags
   % cat VERSION
     7.5.3
   % git log --graph --decorate --oneline $@

HEAD will be attached to origin/voltha-2.12 and the latest release tag v7.5.3

::

   git log --graph --decorate --oneline $@

   * aeb3c4f (HEAD -> voltha-2.12, tag: v7.5.3, origin/voltha-2.12) [VOL-5245] -- release patch
   * ad265dd (tag: v7.5.2) [VOL-5245] - branch and release repo:voltha-lib-go
   * 9cdee9f (tag: v7.5.1, tag: v2.12.0) [VOL-5245] branch and release repo:voltha-lib-go


Edit and commit
---------------

.. code-block:: shell-session
   :caption: Edit, commit, rebase and review

   # ----------------------------------------------------------------
   # Edit sources to taste
   # ----------------------------------------------------------------
   {emacs,vi,$EDITOR} ...

   # :ref:`pull-request--commit-message`
   % git commit -F ./commit-message


Rebase against the release branch
---------------------------------

.. code-block:: shell-session
   :caption: Rebase against release branch ``NOT branch=master``

   # Run one of
   % rebase -i HEAD
   % rebase -i voltha-2.12


Code Review
-----------

.. code-block:: shell-session
   :caption: Push to gerrit, code review

   % git review --reviewers foo@bar.tans


Verify Patch
------------

Now visit gerrit and verify your release bugfix is correctly decorated.
In gerrit, review the 'Repo|Branch' item in the top left corner.
'votlha-2.12' or the release tag will be visible.  If branch 'master' is
listed abandon the patch beucase it will not be applied to the proper branch.
