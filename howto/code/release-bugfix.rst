.. _coding-release-bugfix:

Create a patch on a release branch
==================================

.. code-block:: shell-session
   :caption: Clone repository

   # ------------------------------------------------
   # Clone a repostiory of interest (ex: votlha-lib-go)
   # Checkout release branch voltha-2.12 for patching
   # ------------------------------------------------
   % git clone "ssh://gerrit.opencord.org:29418/voltha-lib-go.git"
   % cd voltha-lib-go

   # Pull in all remote tags/branches
   % git fetch --all

.. code-block:: shell-session
   :caption: Create a dev branch for the patch

   # -------------------------
   # Display available options
   # -------------------------
   % git branch -a

     master
     remotes/origin/HEAD -> origin/master
     remotes/origin/master
     remotes/origin/voltha-2.11
     remotes/origin/voltha-2.12

   # ----------------------------------------------------------
   # Create a dev branch anchored to release branch voltha-2.12
   # ----------------------------------------------------------
   % git checkout -b dev-joey voltha-2.12


.. code-block:: shell-session
   :caption: Sanity check tag & branch

   # ----------------------------------------------------------------------
   # Verify tag & branch for your checkout are correct:
   #   Your developer branch will be attached to branch=voltha-2.12
   #   initial branch checkouts will also mention the 'v2.12.x' tag.
   #     (HEAD -> dev-joey, tag: v2.12.0, origin/voltha-2.12)
   # ----------------------------------------------------------------------
   # When --graph shows your dev branch is attached to 'origin/master' as
   # the ancestor, consider this to be a red flag that something is amiss.
   # ----------------------------------------------------------------------

::

   % git log --graph --decorate --oneline $@
   * 653504fa (HEAD -> dev-joey, tag: v2.12.0, origin/voltha-2.12*) [VOL-5247] repo:voltha-go release patching prep

::

   % git branch -vv
   * dev-joey 253fa01b [origin/voltha-2.12: ahead 1] repo:voltha-go Post tag & branch activity
     help     253fa01b repo:voltha-go Post tag & branch activity
     master   4e0e0347 [origin/master] [VOL-5247] repo:voltha-go release patching prep

HEAD will be attached to origin/voltha-2.12 and the latest release tag v7.5.3

::

   git log --graph --decorate --oneline {relpath}

   * aeb3c4f (HEAD -> voltha-2.12, tag: v7.5.3, origin/voltha-2.12) [VOL-5245] -- release patch
   * ad265dd (tag: v7.5.2) [VOL-5245] - branch and release repo:voltha-lib-go
   * 9cdee9f (tag: v7.5.1, tag: v2.12.0) [VOL-5245] branch and release repo:voltha-lib-go

.. code-block:: shell-session
   :caption: Sanity check dev sandbox attributes

   # ------------------------------------------------------
   # Sanity check your sanbox
   # ------------------------------------------------------
   #  1) VERSION file: no conflicts (master > release)
   #    master=x.y.0 > release=x.{y-1}.z
   # ------------------------------------------------------

   % cat VERSION

   # ------------------------------------------------------
   #  .gitreview - commit, rebase, merge will be applied to the release branch
   # ------------------------------------------------------

   % grep -i branch .gitreview
   defaultbranch=voltha-2.12

   # -------------------------------------------------------
   # On branch=master, defaultbranch=master or will be unset
   # -------------------------------------------------------
   % git checkout master
   % grep -i branch .gitreview
   defaultbranch=master
   % git checkout dev-joey


.. code-block:: shell-session
   :caption: Tag debugging

   # ---------------------------------------------------------
   # If something is amiss checkout by named tag for diagnosis
   # ---------------------------------------------------------
   % cat VERSION
   % git checkout tags/v{VERSION-FILE-STRING}

Command output

::
   % git checkout voltha-2.12
   Branch 'voltha-2.12' set up to track remote branch 'voltha-2.12' from 'origin'.
   Switched to a new branch 'voltha-2.12'


Edit and commit
---------------

- :ref:`pull-request--commit-message`
- :ref:`code--makefile-lint-targets`

.. code-block:: shell-session
   :caption: Edit, commit, rebase and review

   # ----------------------------------------------------------------
   # Edit sources to taste
   # ----------------------------------------------------------------
   {emacs,vi,$EDITOR} ...

   # ----------------------------------------------------------------
   # Sanity check for problems
   # ----------------------------------------------------------------
   % make help | grep lint
   % make lint   LOCAL_FIX_PERMS=1
   % make build
   % make test

   # ----------------------------------------------------------------
   # Create a patch for upload
   # ----------------------------------------------------------------
   % git commit -F ./commit-message


[Rebase|merge] against the release branch
-----------------------------------------

.. code-block:: shell-session
   :caption: Rebase against release branch ``NOT branch=master``

   % git checkout "voltha-2.12"
   % git pull --ff-only origin "voltha-2.12"
   % git checkout dev-joey
   % git rebase -i "origin/voltha-2.12"


Code Review
-----------

.. code-block:: shell-session
   :caption: Push to gerrit, code review

   % git review --reviewers "foo@bar.org"


Verify Patch Creation
---------------------

.. code-block:: shell-session
   :caption: Verify patch creation

   % git review --reviewers "foo@bar.org" "bar@tans.org"

::

   As a cross check visit gerrit and verify your release bugfix is correctly
   decorated.  In gerrit, review the 'Repo|Branch' item in the top left corner.
   'votlha-2.12' or the release tag will be visible.  If branch 'master' is
   listed abandon the patch, it will not be applied to the proper branch.
