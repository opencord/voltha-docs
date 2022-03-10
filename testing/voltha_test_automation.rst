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
jobs related to LTS release, i.e. voltha-2.8 are in `VOLTHA-2.8 <https://jenkins.opencord.org/view/VOLTHA-2.8/>`_ tab.

Likewise, tests that collect measurements on Voltha performance at scale are placed under `voltha-scale-measurements <https://jenkins.opencord.org/view/voltha-scale-measurements/>`_,
and the Voltha Soak testing jobs are kept under the tab named `voltha-soak <https://jenkins.opencord.org/view/voltha-soak/>`_.

Jenkins also host `verification jobs <https://jenkins.opencord.org/view/VOLTHA%202.x%20verify/>`_ that trigger automatically whenever a patch is pushed or updated on Gerrit for the review.


Job Templates
-------------

Templates for the jobs are defined in `ci-management <https://github.com/opencord/ci-management>`_ repo.

BBSim Jobs
^^^^^^^^^^

The template for the jobs that run on BBSim based deployment is defined `here <https://github.com/opencord/ci-management/blob/master/jjb/voltha-e2e.yaml>`_.

