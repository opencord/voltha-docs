Jenkins jobs: Release branching for unit tests
==============================================

Intent
------

With each new VOLTHA LTS release (v2.12, v2.11, v2.8) jenkins unit testing and
sandbox tooling must be branched for release to protect testing from
future enhancements on master branch.

JJB configs used to generate pipeline jobs are maintained in a central
repository, test suites are not maintained on distinct branches within
revision control.  Instead versioning is implemented using naming conventions
within the job configs.

WIP:
----

Makefile target create-jobs-release will create a versioned hierarchy
for VOLTHA test jobs.  Refactoring is still needed to modularize job
definitions from the monolithic yaml job config that contains all
jobs and versions.

.. code-block:: shell-session
   :caption: Clone and branch VOLTHA testing for release.
   :linenos:
   :emphasize-lines: 5,8,14

   # Clone repo:ci-management
   % git clone ssh://gerrit.opencord.org:29418/ci-management.git
   % cd ci-management

   % make help | grep release
     help-voltha-release Display voltha release targets

   % make help-voltha-release
   [RELEASE] - Create branch driven testing pipelines
     create-jobs-release
     create-jobs-release-nightly Nightly testing
     create-jobs-release-units   Unit testing

   % make create-jobs-release voltha-version=voltha-2.12

.. code-block:: shell-session
   :caption: Jenkins (JJB) branched job configs created

   % cd ci-management
   % find jjb -name '*2.12*'

   jjb/voltha-test/voltha-certification/voltha-2.12.yaml
   jjb/voltha-test/voltha-nightly-jobs/voltha-2.12.yaml

TODO
----

- Document the current testing setup and branching within monolithic yaml file.
