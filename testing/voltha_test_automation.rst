Voltha Test Automation
======================

This page shows how the Voltha tests are automated to run on `OpenCORD Jenkins <https://jenkins.opencord.org/>`_.

Tests of different workflows, i.e. ATT, DT and TT, with various configurations based on either BBSim deployment or
actual Physical POD run on Jenkins periodically.

.. figure:: ../_static/Voltha_Test_Automation_Jenkins.png
   :alt: Voltha OpenCord Jenkins
   :width: 70%
   :align: center

   Voltha OpenCord Jenkins

Similar set of jobs are kept under similar tabs. Like,
all the master build jobs are placed under `VOLTHA-2.X-Tests <https://jenkins.opencord.org/view/VOLTHA-2.X-Tests/>`_ tab,
jobs related to the voltha-2.8 LTS release are in VOLTHA-2.8 tab.

Likewise, tests that collect measurements on Voltha performance at scale are placed under `voltha-scale-measurements <https://jenkins.opencord.org/view/voltha-scale-measurements/>`_,
and the Voltha Soak testing jobs are kept under the tab named `voltha-soak <https://jenkins.opencord.org/view/voltha-soak/>`_.

Jenkins also host `verification jobs <https://jenkins.opencord.org/view/VOLTHA%202.x%20verify/>`_ that trigger automatically whenever a patch is pushed or updated on Gerrit for the review.


Job Templates
^^^^^^^^^^^^^

Templates for the jobs are defined in `ci-management <https://github.com/opencord/ci-management>`__ repo.


BBSim Jobs
^^^^^^^^^^

OpenCORD Jenkins host a large number of BBSim based regression jobs that run periodically
with different deployment configurations for different operator workflows. Such as,

- `periodic-voltha-multi-uni-test-bbsim <https://jenkins.opencord.org/job/periodic-voltha-multi-uni-test-bbsim/>`_ & `periodic-voltha-multi-uni-multiple-olts-test-bbsim <https://jenkins.opencord.org/job/periodic-voltha-multi-uni-multiple-olts-test-bbsim/>`_ : tests Voltha functionality with multiple UNIs enabled, and with single & multiple OLT (BBSim) deployments
- `periodic-voltha-dt-test-bbsim <https://jenkins.opencord.org/job/periodic-voltha-dt-test-bbsim/>`_ : tests functional and failure scenarios for DT workflow
- `periodic-software-upgrade-test-bbsim <https://jenkins.opencord.org/job/periodic-software-upgrade-test-bbsim/>`_ : tests for ONOS Applications, Voltha Components and ONU Software Upgrades
- `periodic-voltha-etcd-test <https://jenkins.opencord.org/job/periodic-voltha-etcd-test/>`_ : tests to verify Voltha etcd functionality

The template for the jobs that run on BBSim based deployment is defined `here <https://github.com/opencord/ci-management/blob/master/jjb/voltha-e2e.yaml>`__.


Hardware (or Physical POD) Jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The hardware jobs are mostly defined in a combination of a build job and a test job.

The template for the jobs that run on physical pod is defined `here <https://github.com/opencord/ci-management/blob/master/jjb/voltha-test/voltha-nightly-jobs.yaml>`__.


Per-Patchset Verification Jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The verification jobs gets triggered automatically whenever a patch is pushed or updated on Gerrit, e.g.

- verify_{project}_licensed : This job verifies that there is valid license/copyright on files.
- verify_{project}_tag-collision : This job checks for changes to version files,
  and that they don't duplicate tags already in the git repo.
- verify_{project}_unit-test : This job runs the Makefile based unit tests.
- verify_{project}_sanity-test : This job verifies that basic Voltha functionality is not broken
  for any of the operator workflows.

Apart from system triggered jobs, there are some verification jobs which can be triggered by the user
by providing apt comment in the Gerrit patch, e.g.

- hardware test functional tests : This comment triggers the run on a dedicated physical pod
  and executes the entire functional test suite for ATT.
- hardware test functional tests DT : This comment triggers the functional suite tests for DT.

The templates for the above mentioned and other similar jobs can be found in the
`ci-management <https://github.com/opencord/ci-management>`__ repo.
