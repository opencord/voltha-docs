VOLTHA Release process
======================

This document describes the technical steps of VOLTHA's release process.
The document assumes you are creating a release named voltha-X.Y, where X
is the major release version and Y is the minor.  See versioning in the
:doc:`releases documentation </overview/releases>`

Code Freeze and pre-release testing
-----------------------------------

VOLTHA is released every 6 months. The suggested codefreeze is 3 weeks before release.
Code freeze means that no functionality is added, only bug fixes and tests can be added during the code freeze time.
Code freeze is announced during the TST meetings and enforced by the core contributors that have +2/merge access.
The 3 weeks of code freeze are used to stabilize the tests and prepare the components for the release.

During code freeze the jenkins jobs test the latest code in master which, given the code freeze state, is the
release candidate (RC) for the release.
A release can be considered ready if the tests on Jenkins pass with no issue, both on hardware and bbsim jobs.

Component releasing and Lazy Branching
--------------------------------------
In VOLTHA for a release we release components (services) and lazy branch when/if needed.
Once a component (service) is ready to be released we increase the version in the VERSION file,
going from the -dev or released version x.y.z to either a higher number in minor version (y) or in bug version (z).

To allow for future patches to go into the repo in a way that does not conflict with the patch version,
each component repo's VERSION file should have it's minor version increased in master. (ex: 1.1.X to 1.2.0-dev,
so future 1.1.X+1 component release can easily be created for the released VOLTHA version).

The same should be done on Helm charts in the chart repos post release, but the versions there shouldn't include a
-dev suffix because chart publishing requires that every new chart version be unique and using un-suffixed SemVer is a
better release numbering pattern.

If a repository is branched the `.gitreview` file needs to be changed, adding `defaultorigin=voltha-X.Y` at the end.

.. note::
    Given the dependency of the containers on the protos and the library, if the voltha-protos and/or voltha-lib-go or
    omci-lib-go need to be released, it should be done first and then updated in the components:

    - release `voltha-proto`
    - update `voltha-lib-go` and release it
    - change the protos and lib-go versions in the components (in `go.mod`)
    - issue `make mod-update`
    - release the component


Every repository that need releasing is listed here.

Services:

- `VOLTHA Core <https://github.com/opencord/voltha-go>`_
- `OpenFlow Agent <https://github.com/opencord/ofagent-go>`_
- `Openonu Adapter <https://github.com/opencord/voltha-openonu-adapter-go>`_
- `Openolt Adapter <https://github.com/opencord/voltha-openolt-adapter>`_
- `Openolt Agent <https://github.com/opencord/openolt>`_
- `ONOS controller <https://github.com/opencord/voltha-onos>`_ (Note, only do it after releasing all the apps below)
- `BBSIM <https://github.com/opencord/bbsim>`_
- `BBSIM Sadis Server <https://github.com/opencord/bbsim-sadis-server>`_

Libraries and APIs:

- `VOLTHA protos <https://github.com/opencord/voltha-protos>`_
- `VOLTHA Library in Go <https://github.com/opencord/voltha-lib-go>`_
- `OMCI Library in GO <https://github.com/opencord/omci-lib-go>`_

Tools:

- `voltctl <https://github.com/opencord/voltctl>`_

Configuration:

- `pod-configs <https://github.com/opencord/pod-configs>`_

ONOS Apps
^^^^^^^^^

:ref:`_howto_release_components_onos_components`

The ONOS Apps need to be released in a different manner.

A dedicated Jenkins job is used to release ONOS app: https://jenkins.opencord.org/job/onos-app-release.

The job will need to be initiated using specific parameters, for an example view the lateset pipeline job.

1. `Build with parameters <https://jenkins.opencord.org/job/onos-app-release>`_: use the name of the repo (not of the app itself)
   - appRepo: sadis
   - appName: sadis
   - apiVersion: `sadis:5.12.0-SNAPSHOT <https://gerrit.opencord.org/plugins/gitiles/sadis/+/refs/heads/master/api/pom.xml#22>`__
   - nextApiVersion: version+1
   - version: `sadis:5.12.0-SNAPSHOT <https://gerrit.opencord.org/plugins/gitiles/sadis/+/refs/heads/master/app/pom.xml#20>`__
   - nextVersion: version+1
   - branch: master
   - jdkDistro: java-11-amazon-corretto

2. Wait for build to complete
3. Merge the component patches on gerrit
   - `View <https://gerrit.opencord.org/q/owner:do-not-reply%2540opennetworking.org>`_
   - Two pull requests are created modifying pom.xml.
   - Approve patch one (-SNAPSHOT: no)  to initiate a release build.
   - Approve patch two (-SNAPSHOT: yes) to revert pom.xml to a non-release version.

4. Approval and merge will trigger `jenkins::maven-publish_sadis <https://jenkins.opencord.org/job/maven-publish_sadis/>`_
   that will publish an artifact into the staging repo on `sonatype <https://oss.sonatype.org>`_.
   Once published to the staging server the artifact will need to be released to maven central.

   - Login into the sonatype server (for username and password contact michelle@opennetworking.org)
   - search for org.opencord
   - Select the app you want to release and click "all versions"
   - Click on "Staging repositories" (in the left side navigation)
   - In the top right search for last part of the app name (eg: olt)
   - Click release (top left bar, small button)

5. Wait until the artifacts are published

   - https://search.maven.org/search?q=g:org.opencord
   - https://search.maven.org/artifact/org.opencord/dhcpl2relay/2.9.0/pom

6. Iterate through apps:

   - Modify pom.xml and dependencies.xml
   - Update version string for all released dependencies.

7. Start over with the next app

ss.. note::
   Given component inter dependencies,  ONOS apps need to be released in order:

    1. sadis
    2. olt, aaa, dhcpl2relay, mcast, igmpproxy, maclearning
    3. bng, PPPoE
    4. kafka

ONOS APPs:

- `AAA <https://github.com/opencord/aaa>`_
- `BNG <https://github.com/opencord/bng>`_
- `DHCP L2 Relay <https://github.com/opencord/dhcpl2relay>`_
- `IGMPProxy <https://github.com/opencord/igmpproxy>`_
- `Kafka <https://github.com/opencord/kafka-onos>`_
- `Mac Learning <https://github.com/opencord/mac-learning>`_
- `Multicast <https://github.com/opencord/mcast>`_
- `OLT <https://github.com/opencord/olt>`_
- `OLT Topology <https://github.com/opencord/olttopology>`_
- `PPPoE Agent <https://github.com/opencord/pppoeagent>`_
- `Sadis <https://github.com/opencord/sadis>`_


Creating the release
--------------------

Once the components have been tested and the release is considered ready
there are 4 more elements that need to be tagged:

- `VOLTHA Helm Charts <https://github.com/opencord/voltha-helm-charts>`_
- `VOLTHA System Tests <https://github.com/opencord/voltha-system-tests>`_
- `VOLTHA docs <https://github.com/opencord/voltha-docs>`_
- `repo:ci-management <https://gerrit.opencord.org/plugins/gitiles/ci-management>`_

These 4 repos are the only ones that receive a X.Y.Z tag.
Other repos that contain individual components have their own
versioning/release cadence, driven by SemVer.

repo:ci-management
^^^^^^^^^^^^^^^^^^

Jenkins pipelines for building & testing release jobs are retrieved from
repository branch=voltha-X.Y.  This repository is a dependency for all
other VOLTHA repositories that invoke test suites.

See Also: :ref:`_Release Repository ci-management`


Helm Charts
^^^^^^^^^^^

The official action of creating the voltha-X.Y release is releasing the voltha helm chart, and adapter charts
with version:X.Y.Z (e.g. 2.10.0) specified in Chart.yaml within the voltha-helm-charts repo, and within the VERSION
file in that repo.
A branch named voltha-X.Y needs to be created on the voltha-helm-charts repo.
The helm charts repo overall VERSION should also be incremented to the next minor version (X.Y+1-dev), so all X.Y.Z
releases of the overall charts repo will happen on the voltha-X.Y branch.

Voltha-system-tests
^^^^^^^^^^^^^^^^^^^
Accompanying tests for voltha-X.Y are created by creating a branch created named voltha-X.Y on the voltha-system-tests
repo and creating a tag X.Y.Z on that branch.

Documentation and Release Notes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Release notes for the voltha-X.Y release are created and added to the voltha-docs repo. Please follow the template of
past releases, an :doc:`example <voltha_releases/voltha_2.12.rst>`

Also, if needed a voltha-X.Y branch is created on docs repo.  These release notes also contain all the
versions of components that will be released, and may be updated during the final QA process.
At release we create a tag X.Y.Z in the VERSION file.

CI-Management
^^^^^^^^^^^^^
In the `Ci management <https://github.com/opencord/ci-management>`_ repository create the /voltha-x.y.z folder and copy the /master repos
Testing CI jobs should be created that check out the voltha-X.Y branch of the voltha-system-tests repo, testing the
charts as checked out with the voltha-X.Y tag of voltha-helm-charts.


Release support and bug-fixing
------------------------------

What changes can be brought into the X.Y.Z branch?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Has to be a bug or non-code fix.

Add a Jira item with type Bug, tag against VOLTHA vX.Y
Discuss on the Voltha mailing list, or in all-Voltha meeting, get consensus on whether should be brought to X.Y.z
Documentation or other non-code updates are also acceptable

What is a bug? Not a new feature!
Anything that causes a functional regression test (Robot tests) to fail
Severe issue (causes data loss or crash), or frequently occurring -> add to X.Y
Issues that are merely annoying and don't cause data loss or a crash, or are very infrequently occurring -> may
wait for next release

WHen a bug is found please add to tests both on the released version and the master branch, if tests don't cover
the bug. Add to Robot tests for integration-related issues, to Unit tests for code-level or functional issues.

Update/Fixes to the released version
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This section shows how to create minor releases on the X.Y.Z branch when a bug fix is required.

If a fix is needed to the helm charts:

- Make the fix on the master branch of voltha-helm-charts (assuming that it is required in both places).
- After the master tests pass, manually cherry-pick the fix to the voltha-X.Y branch (the Chart version would be
  different, requiring the manual step).
- Cherry-picked patchsets on that branch will be checked by the voltha-X.Y branch of tests.
- When it passes, submitting the change will make a new X.Y.Z release
- Update the documentation to reflect the chart changes, a description of the changes made, and increment the tag
  on the docs from X.Y.Z to X.Y.Z+1, to reflect the patch change.
- If all the charts are updated and working correctly, create a new charts point release by increasing the
  X.Y.Z VERSION file in the voltha-helm-charts repo.  The versions need to be updated in the voltha-docs repo,
  which needs to be tagged as well, thus releasing it.

If a fix is needed to the components/containers that are included by the helm charts:

- Develop a fix to the issue on the master branch, get it approved after passing master tests.
- Manually cherry-pick to the voltha-X.Y branch of the component (create one if needed)
- incrementing the patch version in the VERSION file,
- test with the voltha-X.Y version of voltha-system-tests and helm charts.
- Update helm charts and go through the helm chart update process above.
- Update the voltha-docs with the right version of the component.

If a fix is needed to the ONOS apps:

- Create a branch here https://gerrit.opencord.org/plugins/gitiles/olt/+/refs/heads/olt-4.1
- then `Git checkout -b <branch-name> opencord/<version>`
- Then push a commit changing to `.1-SNAPSHOT` more (see e.g. https://gerrit.opencord.org/c/igmpproxy/+/19589)
- Then push you changes (e.g. https://gerrit.opencord.org/c/igmpproxy/+/19590)
- Then release as per the process above.

See Also
========
- `VOLTHA Release Process <https://docs.voltha.org/master/overview/release_process.html?highlight=charts%20yaml>`_
- `release_notes: Release Process <https://docs.voltha.org/master/release_notes/release_process.html>`_
- `VOLTHA and ONOS Software Update Procedure <https://docs.voltha.org/master/operations/software-upgrade.html?highlight=set%20global%20image>`_
- `Helm Chart Deployment <https://docs.voltha.org/master/voltha-helm-charts/README.html?highlight=voltctl>`_
