Release overview
================

For a VOLTHA release several actions and patches are applied to each repository.
Release also happens in a hierarchial manner due to dependencies.

- Version string differs between branch=master and branch=voltha-2.12.
- For ex repo:voltha-protos currently has:

  - master=5.5.0
  - voltha-2.12=5.4.11

- For release create an initial baseline build to verify no pre-existing corruption or test failures are present.

  - Baseline builds contain no logic changes, only bulk cosmetic changes which may include:

    - Copyright notice ending date change.

      - Bulk edit scripts: `gather-and-update.sh <https://github.com/joey-onf/copyright/blob/origin/master/gather-and-update.sh>`_, `morph.pl <https://github.com/joey-onf/copyright/blob/origin/master/morph.pl>`_.

    - Cosmetic comment changes in source.
    - Syntax formatting (gofmt -s -e -w)

  - Baseline builds may also remove suffixes like -dev from the VERSION file.

- Now tag-branch or branch-tag the repo (depending on repository) for release.
  A few things will need to happen:

  - A few distinct sets of patches for each branch are created:

    - Update VERSION string so master and voltha-2.12 patches cannot collide.

      - branch=voltha-2.12 : VERSION = {max}.{min}+1.0
      - branch=master      : VERSION = {max+1}.{min}.0

    - Update release branch .gitreview file:

      - defaultbranch=voltha-2.12
      - This will rebase/merge against the release branch rather than master.

  - Update go.mod version strings to be appropriate for branch={voltha-2.12, master}

- Extra credit

  - Run the `pre-commit hook script <https://pre-commit.com/>`_ and cleanup any linting problems reported.

NOTE

::

   One item that may be confusing.  Baseline builds for release are independent
   of tagging & branching so may be initiated in parallel.  Generally release
   tasks for a repository are performed in hierarchial order, release
   repositories and obtain the final version string.  Next continue onto
   releasing repositories that depend on ones released earlier.

   For ex, the release sequence for repo:voltha-go would be
   1) Release repo:votlha-protos
   2) Release repo:votlha-lib-go  # Depends on voltha-protos
   3) Release repo:votlha-go      # Depends on both.

Todo
----

- Add document references to existing release pages.
- Link to repo dependencies in howto/release/repositories

See Also
--------

- https://docs.voltha.org/master/release_notes/template.html?highlight=howto
- `Release Notes <https://docs.voltha.org/master/release_notes/index.html>`_: `template <https://docs.voltha.org/master/release_notes/template.html>`
