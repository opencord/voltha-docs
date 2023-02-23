.. |voltha-latest| replace:: voltha_2.11

Release Process
===============

This document describes the technical steps to create a new release of VOLTHA.

Creating the initial release
----------------------------

A release branch name is decided on, where all tagged releases will be created
in each repo. Historically this has been ``voltha`` followed by the Major and
Minor `Semver <https://semver.org/>`_ version, such as ``voltha-2.3``,
etc.  The rest of this section will use the ``voltha-2.3`` release as an
example:

A branch named ``voltha-2.3`` is created on the voltha-helm-charts repo.
Release candidates will be created of each chart for the ``2.3`` release.
The action that indicates the creation of the ``2.3`` release is to changing
the `voltha
<https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree;f=voltha>`_
helm chart, and adapter charts with version: ``2.3.0`` specified in
``Chart.yaml`` within the `voltha-helm-charts
<https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=summary>`_ repo.

Accompanying tests for 2.3 are created by creating a branch created named
``voltha-2.3`` on the `voltha-system-tests
<https://gerrit.opencord.org/gitweb?p=voltha-system-tests.git;a=summary>`_
repo. At release we create a tag ``2.3.0`` on that branch.

These two repos are the only ones receiving a ``2.3.0`` tag. Other repos that
contain individual components have their own versioning/release cadence, driven
by SemVer.

For all other repos that create components that go into the release, tags will
be created and ``voltha-2.3`` branches are created starting from the tag.

To allow for future patches to go into the repo in a way that does not conflict
with the patch version, each component repo's ``VERSION`` file should have it's
Minor version increased. (ex: ``1.1.x`` to ``1.2.0-dev``, so future ``1.1.x+1``
component release can easily be created).

Testing CI jobs will be created that check out the voltha-2.3 branch of the
`voltha-system-tests
<https://gerrit.opencord.org/gitweb?p=voltha-system-tests.git;a=summary>`_
repo, testing the charts as checked out with the ``voltha-2.3`` branch of
``voltha-helm-charts``.  Patches on the ``voltha-2.3`` branch of components
that build containers will need to be changed to rebuild those containers and
test with the ``voltha-2.3`` branch of helm charts.

Creating point releases on a stable branch
------------------------------------------

If a fix is only needed to the helm charts:

- Make the fix on the master branch of voltha-helm-charts (assuming that it is
  required in both places).

- After the master tests pass, manually cherry-pick the fix to the voltha-2.3
  branch (the Chart.yaml version would be different, requiring the manual
  step).

- Cherry-picked patchsets on that branch will be checked by the voltha-2.3
  branch of tests.

- When it passes, submitting the change will make a new 2.3.x release

If a fix is needed to the components/containers that are included by the helm
charts:

- Develop a fix to the issue on the master branch, get it approved after
  passing master tests.

- Manually cherry-pick to the voltha-2.3 branch of the component, incrementing
  the patch version, and test with the voltha-2.3 version of
  voltha-system-tests and helm charts.

- Update helm charts and go through the helm chart update process above.


What changes can be brought into a stable branch?
-------------------------------------------------

For a change to be suitable for a stable branch, it has to be either a:

- Bug
- Non-code fix (documentation, build process)
- Security or compatibility updates (problem found in a dependency, upstream
  software EOL, etc.)

Process to create a change on a stable branch

- Create a jira ticket for the problem and document the ``Affects Version/s:``
  - field with affected version(s) ``VOLTHA vX.X``.
- Discuss and get consensus on the issue via the Voltha mailing list, in the
  all-Voltha meeting, or on Slack about whether this fix should be brought to a
  stable branch
- Create a fix, and go through the integration process to create a new point
  release.

What is a bug?
""""""""""""""

- Anything that causes a functional regression test (Robot tests) to fail
- Not a new feature!
- Severe issue (causes data loss or crash), or frequently occurring are
  generally more likely to be accepted.
- Issues that are merely annoying and don't cause data loss or a crash, or
  happen very infrequently or can't be reproduced may not be.

As a best practice, please add tests when bugs are found, if tests don't
currently cover the particular bug. Examples:

- Robot tests for integration-related issues
- Unit tests for code-level issues

API Deprecation policy
----------------------
VOLTHA supports 2 release deprecation policy. Starting from ``voltha-2.9``
the APIs that are marked as deprecated are automatically removed.
For example an API marked as deprecated in ``voltha-2.9`` will be removed after
the ``voltha-2.10`` release and will not be present anymore in ``voltha-2.11``.

The removal process is intended to happen automatically, meaning no further notice of removal needs to be sent out.
The deprecated objects and APIs are marked in the `voltha-protos <https://github.com/opencord/voltha-protos>`_ using the
``deprecated`` construct from protobuf, as per `specification <https://developers.google.com/protocol-buffers/docs/proto3>`_.
An example is ``int32 old_field = 6 [deprecated = true];``


Repos (lazily) branched for each release
----------------------------------------

Charts
""""""

- voltha-helm-charts

Testing
"""""""

- voltha-system-tests
- pod-configs

Tools
"""""

- bbsim (also creates containers)
- voltctl

ONOS Apps
"""""""""

- aaa
- dhcpl2relay
- igmpproxy
- kafka
- mcast
- olt
- sadis
- mac-learning

Libraries
"""""""""

- voltha-lib-go
- voltha-protos

Components (which build containers)
"""""""""""""""""""""""""""""""""""
- ofagent-go
- voltha-go (rw_core)
- voltha-openolt-adapter
- voltha-openonu-adapter-go
- voltha-onos (includes ONOS Apps)
