.. _pod_physical:

Deploy a physical VOLTHA POD
============================

This document assumes you POD is already correctly cabled, if not you can
refer to :ref:`lab_setup`

Requires:

- a physical kubernetes cluster
- `kind-voltha <https://gerrit.opencord.org/gitweb?p=kind-voltha.git>`_ cloned
  on your machine


Enter the ``kind-voltha`` directory and execute this command (``kubectl`` must
be installed and pointing to your cluster):

.. code:: bash

    DEPLOY_K8S=no WITH_RADIUS=y CONFIG_SADIS=y SADIS_CFG="my-sadis-cfg.json" ./voltha up

*``my-sadis-cfg.json`` is a reference to your own ``sadis`` configuration.
This is needed to specify the appropriate values for your devices and subsribers*

If you already have a ``radius`` server that you want to use, change the flag to ``WITH_RADIUS=n``
and `configure ONOS accordingly <https://github.com/opencord/aaa>`_.

For more information please check :doc:`kind-voltha page <../kind-voltha/README>`.

After the deployment please refer to :ref:`operate` .

HA Cluster
----------

To deploy ONOS in a multi instance environment for redundancy, High avaliablity and scale, you can add
`NUM_OF_ONOS=3 NUM_OF_ATOMIX=3` to any of the workflow command. You can pick the number of instances onf ONOS
and ATOMIX independently. As a good suggestion is 3 or 5.

If you are planning to support a big number of ONU we suggest to horizontally scale
the ``openonu-adapater``, you can do so by setting the ``NUM_OF_OPENONU`` variable.
Generally speaking a single ``openonu-adapter`` instance can support up to 200 ONU devices.

As an example for the ATT workflow:

.. code:: bash

    WITH_RADIUS=y CONFIG_SADIS=y SADIS_CFG="my-sadis-cfg.json" NUM_OF_ONOS=3 NUM_OF_ATOMIX=3 NUM_OF_OPENONU=8 ./voltha up

Configuration for in-band OLT control
-------------------------------------

If OLT is being used in in-band connectivity mode, the following
`document <https://docs.google.com/document/d/1OKDJCPEFVTEythAFUS_I7Piew4jHmhk25llK6UF04Wg>`_
details the configuration aspects in ONOS and the aggregation switch to
trunk/switch in-band packets from the OLT to BNG or Voltha.
