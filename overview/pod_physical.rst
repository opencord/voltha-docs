.. _pod_physical:

Deploy a physical VOLTHA POD
============================

The quickstart assumes you POD is already correctly cabled, if not you can
refer to :ref:`lab_setup`

Requires:

- a physical kubernetes cluster
- `kind-voltha <https://gerrit.opencord.org/gitweb?p=kind-voltha.git>`_ cloned
  on your machine


Enter the ``kind-voltha`` directory and execute this command (``kubectl`` must
be installed and pointing to your cluster):

.. code:: bash

    DEPLOY_K8S=no WITH_RADIUS=y CONFIG_SADIS=y ./voltha up

If you already have a ``radius`` server that you want to use, change the flag to ``WITH_RADIUS=n``
and `configure ONOS accordingly <https://github.com/opencord/aaa>`_.

For more information please check :doc:`kind-voltha page <../kind-voltha/README>`.

Configuration for in-band OLT control
-------------------------------------

Coming soon
