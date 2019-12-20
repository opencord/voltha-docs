.. _deploy_physical:

Deploy a physical VOLTHA POD
============================

Quickstart
----------

The quickstart assumes you POD is already correctly cabled, if not you can
refer to :ref:`Physical_Layout`

Requires:

- a physical kubernetes cluster
- `kind-voltha <https://github.com/ciena/kind-voltha>`_ cloned on your machine


Enter the ``kind-voltha`` directory and execute this command (``kubectl`` must
be installed and pointing to your cluster):

.. code:: bash

    DEPLOY_K8S=no WITH_RADIUS=y CONFIG_SADIS=y ./voltha up

If you already have a ``radius`` server that you want to use, change the flag to ``WITH_RADIUS=n``
and `configure ONOS accordingly <https://github.com/opencord/aaa>`_.

TLDR;
-----

Below are the complete steps to install a physical cluster. It assumes
``kubectl`` and ``helm`` commands are already available.

Configure Helm
--------------

Helm provide a capability to install and manage Kubernetes applications.
VOLTHA’s default deployment mechanism utilized Helm. Before Helm can be
used to deploy VOLTHA it must be initialized and the repositories that
container the artifacts required to deploy VOLTHA must be added to Helm.

.. code:: bash

    helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com
    helm repo add stable https://kubernetes-charts.storage.googleapis.com
    helm repo add onf https://charts.opencord.org
    helm repo update

.. _installation_steps:

Install EtcdOperator
--------------------

ETCD Operator is a utility that allows applications to create and manage
ETCD key/value clusters as Kubernetes resources. VOLTHA utilizes this
utility to create its key/value store. *NOTE: it is not required that
VOLTHA create its own datastore as VOLTHA can utilize an existing
datastore, but for this example VOLTHA will creates its own datastore*

.. code:: bash

   helm install -f $TYPE-values.yaml --namespace voltha --name etcd-operator stable/etcd-operator

Wait for operator pods
~~~~~~~~~~~~~~~~~~~~~~

Before continuing, the Kubernetes pods associated with ETCD Operator must
be in the ``Running`` state.

.. code:: bash

   kubectl get -n voltha pod

Once all the pods are in the ``Running`` state the output, for a
**full** deployment should be similar to the output below. For a
**minimal** deployment there will only be a single pod, the
``etcd-operator-etcd-operator-etcd-operator`` pod.

.. code:: bash

   NAME                                                              READY     STATUS    RESTARTS   AGE
   etcd-operator-etcd-operator-etcd-backup-operator-7897665cfq75w2   1/1       Running   0          2m
   etcd-operator-etcd-operator-etcd-operator-7d579799f7-bjdnj        1/1       Running   0          2m
   etcd-operator-etcd-operator-etcd-restore-operator-7d77d878wwcn7   1/1       Running   0          2m

It is not just VOLTHA
---------------------

To demonstrate the capability of VOLTHA other *partner* applications are
required, such as ONOS. The following sections describe how to install
and configure these *partner* applications.

*NOTE: It is important to start ONOS before VOLTHA as if they are started in
the reverse order the ``ofagent`` sometimes does not connect to the SDN
controller*\ `VOL-1764 <https://jira.opencord.org/browse/VOL-1764>`__.

ONOS (OpenFlow Controller)
~~~~~~~~~~~~~~~~~~~~~~~~~~

VOLTHA exposes an OLT and its connected ONUs as an OpenFlow switch. To control
that virtual OpenFlow switch an OpenFlow controller is required.  For most
VOLTHA deployments that controller is ONOS, with a set of ONOS applications
installed. To install ONOS use the following Helm command:

.. code:: bash

   helm install -f $TYPE-values.yaml --name onos onf/onos

Exposing ONOS Services
^^^^^^^^^^^^^^^^^^^^^^

.. code:: bash

   screen -dmS onos-ui kubectl port-forward service/onos-ui 8181:8181
   screen -dmS onos-ssh kubectl port-forward service/onos-ssh 8101:8101

Configuring ONOS Applications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Configuration files have been provided to configure aspects of the ONOS
deployment. The following curl commands push those configurations to the
ONOS instance. It is possible (likely) that ONOS won’t be immediately
ready to accept REST requests, so the first ``curl`` command may need
retried until ONOS is ready to accept REST connections.

.. code:: bash

   curl --fail -sSL --user karaf:karaf \
       -X POST -H Content-Type:application/json \
       http://127.0.0.1:8181/onos/v1/network/configuration/apps/org.opencord.kafka \
       --data @onos-files/onos-kafka.json
   curl --fail -sSL --user karaf:karaf \
       -X POST -H Content-Type:application/json \
       http://127.0.0.1:8181/onos/v1/network/configuration/apps/org.opencord.dhcpl2relay \
       --data @onos-files/onos-dhcpl2relay.json
   curl --fail -sSL --user karaf:karaf \
       -X POST -H Content-Type:application/json \
       http://127.0.0.1:8181/onos/v1/configuration/org.opencord.olt.impl.Olt \
       --data @onos-files/olt-onos-olt-settings.json
   curl --fail -sSL --user karaf:karaf \
       -X POST -H Content-Type:application/json \
       http://127.0.0.1:8181/onos/v1/configuration/org.onosproject.net.flow.impl.FlowRuleManager \
       --data @onos-files/olt-onos-enableExtraneousRules.json

SADIS Configuration
^^^^^^^^^^^^^^^^^^^

The ONOS applications leverage the *Subscriber and Device Information
Store (SADIS)* when processing EAPOL and DHCP packets from VOLTHA
controlled devices. In order for VOLTHA to function properly, SADIS
entries must be configured into ONOS.

The repository contains two example SADIS configuration that can be used
with ONOS depending if you using VOLTHA with *tech profile* support
(``onos-files/onos-sadis-no-tp.json``) or without *tech profile* support
(``onos-files/onos-sadis-tp.json``). Either of these configurations can
be pushed to ONOS using the following command:

.. code:: bash

   curl --fail -sSL --user karaf:karaf \
       -X POST -H Content-Type:application/json \
       http://127.0.0.1:8181/onos/v1/network/configuration/apps/org.opencord.sadis \
       --data @<selected SADIS configuration file>

Install VOLTHA Core
-------------------

VOLTHA has two main *parts*: core and adapters. The **core** provides
the main logic for the VOLTHA application and the **adapters** contain
logic to adapter vendor neutral operations to vendor specific devices.

Before any adapters can be deployed the VOLTHA core must be installed
and in the ``Running`` state. The following Helm command installs the
core components of VOLTHA based on the desired deployment type.

.. code:: bash

   helm install -f $TYPE-values.yaml --set use_go=true --set defaults.log_level=WARN \
       --namespace voltha --name voltha onf/voltha

During the install of the core VOLTHA components some containers may
"crash" or restart. This is normal as there are dependencies, such as
the read/write cores cannot start until the ETCD cluster is established
and so they crash until the ETCD cluster is operational. Eventually all
the containers should be in a ``Running`` state as queried by the
command:

.. code:: bash

   kubectl get -n voltha pod

The output should be similar to the following with a different number of
``etcd-operator`` and ``voltha-etcd-cluster`` pods depending on the
deployment type.

.. code:: bash

   NAME                                                         READY     STATUS    RESTARTS   AGE
   etcd-operator-etcd-operator-etcd-operator-7d579799f7-xq6f2   1/1       Running   0          19m
   ofagent-8ccb7f5fb-hwgfn                                      1/1       Running   0          4m
   ro-core-564f5cdcc7-2pch8                                     1/1       Running   0          4m
   rw-core1-7fbb878cdd-6npvr                                    1/1       Running   2          4m
   rw-core2-7fbb878cdd-k7w9j                                    1/1       Running   3          4m
   voltha-api-server-5f7c8b5b77-k6mrg                           2/2       Running   0          4m
   voltha-cli-server-5df4c95b7f-kcpdl                           1/1       Running   0          4m
   voltha-etcd-cluster-4rsqcvpwr4                               1/1       Running   0          4m
   voltha-kafka-0                                               1/1       Running   0          4m
   voltha-zookeeper-0                                           1/1       Running   0          4m

Install Adapters
----------------

The following commands install both the simulated OLT and ONU adapters
as well as the adapters for an OpenOLT and OpenONU device.

.. code:: bash

   helm install -f $TYPE-values.yaml -set use_go=true --set defaults.log_level=WARN \
       --namespace voltha --name sim onf/voltha-adapter-simulated
   helm install -f $TYPE-values.yaml -set use_go=true --set defaults.log_level=WARN \
       --namespace voltha --name open-olt onf/voltha-adapter-openolt
   helm install -f $TYPE-values.yaml -set use_go=true --set defaults.log_level=WARN \
       --namespace voltha --name open-onu onf/voltha-adapter-openonu

Exposing VOLTHA Services
------------------------

At this point VOLTHA is deployed, and from within the Kubernetes cluster
the VOLTHA services can be reached. However, from outside the Kubernetes
cluster the services cannot be reached.

.. code:: bash

   screen -dmS voltha-api kubectl port-forward -n voltha service/voltha-api 55555:55555
   screen -dmS voltha-ssh kubectl port-forward -n voltha service/voltha-cli 5022:5022

Install FreeRADIUS Service
--------------------------

.. code:: bash

   helm install -f minimal-values.yaml --namespace voltha --name radius onf/freeradius

Configure ``voltctl`` to Connect to VOLTHA
------------------------------------------

In order for ``voltctl`` to connect to the VOLTHA instance deployed in
the Kubernetes cluster it must know which IP address and port to use.
This configuration can be persisted to a local config file using the
following commands.

.. code:: bash

   mkdir -p $HOME/.volt
   voltctl -a v2 -s localhost:55555 config > $HOME/.volt/config

To test the connectivity you can query the version of the VOLTHA client
and server::

   voltctl version

The output should be similar to the following::

   Client:
    Version        unknown-version
    Go version:    unknown-goversion
    Vcs reference: unknown-vcsref
    Vcs dirty:     unknown-vcsdirty
    Built:         unknown-buildtime
    OS/Arch:       unknown-os/unknown-arch

   Cluster:
    Version        2.1.0-dev
    Go version:    1.12.6
    Vcs feference: 28f120f1f4751284cadccf73f2f559ce838dd0a5
    Vcs dirty:     false
    Built:         2019-06-26T16:58:22Z
    OS/Arch:       linux/amd64
