VOLTHA Components: voltha-protos
================================

Dependencies
------------

- google-api library version

Validate
--------

- make help
- make lint
- make protos
- make build
- make test

Versioning
----------

- Based on VERSION file contents in root directory of the repository.

Release Preparation
-------------------

- Create a jira ticket for tracking the repo:voltha-protos upgrade.
- Update copyright notice in source to span the current year.
- Regenerate voltha.pb file:

  - make clean
  - make voltha.pb
  - voltha.pb is checked in, should it be ?!?
  - File is .PHONY, always rebuilt, is a static copy needed for usage or bootstrapping ?

- Bump VERSION file to a non-dev semantic version.
- See Validate above
- Commit and approve to trigger a build

Release Branching and Tagging
-----------------------------

- Create and tag release branch (voltha-2.12)
- Update .gitreview file contents to checkin on the release branch:

  - defaultbranch=voltha-2.12

- Commit and merge after jenkins job passes.

Post Release Action
===================

- Clone master branch from repository.
- Bump VERSION file to next minor version with a ``*-dev`` suffix.

  - ie {major}.{minor+1}.0.``-dev``

- Future checkins on master must not conflict with release branch versioning.

Jira Tickets
============

- Create a jira ticket for tracking the repo:voltha-protos upgrade.
- Create sub-tasks attached to the jira ticket to track jenkins job failures.
- Close the ticket after

  - Release branch created
  - VERSION file edit on master has bumped version to {major}.{minor+1}.0.``-dev``
  - All jenkins jobs for repo:voltha-protos reports PASS.

See Also
========
- :ref:`howto_code_voltha-protos`
