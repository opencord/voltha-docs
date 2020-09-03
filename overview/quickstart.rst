.. _quickstart:

Quickstart
==========

This page contains a set of one liner useful to setup different VOLTHA use-cases on
a Virtual pod emulating the PON through :doc:`BBSim <../bbsim/docs/source/index>`.

For more information on how to setup a :doc:`physical POD <./pod_physical>` or
use a :doc:`Virtual POD <./dev_virtual>` for development
refer to the respective guides.

Common setup
------------

In order to install VOLTHA you need to have ``golang`` and ``docker`` installed.

.. code:: bash

    export KINDVOLTHADIR=~/kind-voltha
    mkdir $KINDVOLTHADIR
    cd $KINDVOLTHADIR
    curl -sSL https://raw.githubusercontent.com/opencord/kind-voltha/master/voltha --output ./voltha
    chmod +x ./voltha

Now select the use-case you want to deploy:

ATT Workflow
------------

The ATT Workflow expects EAPOL based authentication and DHCP to be handled within
the VOLTHA POD.

.. code:: bash

    cd $KINDVOLTHADIR
    WITH_BBSIM="yes" WITH_EAPOL="yes" WITH_DHCP="yes" WITH_RADIUS="yes" CONFIG_SADIS="bbsim" ./voltha up

DT Workflow
------------

The DT workflow does not require EAPOL based authentication or DHCP packet handling
in the VOLTHA POD.

.. code:: bash

    cd $KINDVOLTHADIR
    WITH_BBSIM="yes" WITH_EAPOL="no" WITH_DHCP="no" CONFIG_SADIS="bbsim" BBSIM_CFG="configs/bbsim-sadis-dt.yaml" ./voltha up

TT Workflow
------------

The TT workflow does not require EAPOL based authentication but expects DHCP packets
for multiple services to be handled within the POD.

.. code:: bash

    cd $KINDVOLTHADIR
    WITH_BBSIM="yes" WITH_EAPOL="no" WITH_DHCP="yes" CONFIG_SADIS="bbsim" BBSIM_CFG="configs/bbsim-sadis-tt.yaml" ./voltha up

Post deploy actions
-------------------

Once the deployment completed, make sure to export the required ``environment``
variables as ``kind-voltha`` outputs:

.. code:: bash

    export KUBECONFIG="/Users/teone/.kube/kind-config-voltha-minimal"
    export VOLTCONFIG="/Users/teone/.volt/config-minimal"
    export PATH=/Users/teone/kind-voltha/bin:$PATH

Once you have the POD up and running you can refer to the :doc:`./operate` guide.

For more information please check :doc:`kind-voltha page <../kind-voltha/README>`.
