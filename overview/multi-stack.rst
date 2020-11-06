Deploy multiple VOLTHA stacks on a Kubernetes cluster
=====================================================

VOLTHA is designed so that multiple stacks can work together sharing the same infrastructure.
You can read more about VOLTHA Stacks in this `document <https://docs.google.com/document/d/1Szo7vMS7M96O4Vsm1NpDYd3zckk9g0HLMck6eldwmcI/edit?usp=sharing>`_.

This guide assumes you have a ``kubernetes`` cluster already up and running.
We also assume you have familiarity with the `kind-voltha <../kind-voltha/README.html>`_. tool.

Deploy the common infrastructure
--------------------------------

When we refer to `infrastructure` components in VOLTHA, we are referring to:

- ``Kafka``
- ``ETCD``
- ``ONOS``
- ``RADIUS Server`` (optional)
- ``Sadis Server`` (optional)

*Note that these components can be deployed on ``kubernetes`` via ``kind-voltha`` or can be completely independent.*

.. code:: bash

  NAME=infra INFRA_NS=infra JUST_INFRA=y ./voltha up

Note that this command will output configurations that you'll need to deploy your ``VOLTHA`` stack:

.. code:: bash

  To configure your VOLTHA stack to use this infrastructure please export these variables:
    export INFRA_NS=infra
    export WITH_ETCD=etcd.infra.svc:2379
    export WITH_KAFKA=kafka.infra.svc:9092
    export WITH_ONOS=onos-onos-classic-hs.infra.svc:6653

  Or use:

    INFRA_NS=infra WITH_ETCD=etcd.infra.svc:2379 WITH_KAFKA=kafka.infra.svc:9092 WITH_ONOS=onos-onos-classic-hs.infra.svc:6653 ./voltha up

    If you are deploying mutltiple VOLTHA stack, also remember to configure a different NAME, NAMESPACE and BBSIM_BASE_INDEX for each stack:
    export NAME=voltha1
    export VOLTHA_NS=voltha1
    export ADAPTER_NS=voltha1
    export BBSIM_NS=voltha1
    export BBSIM_BASE_INDEX=1

  Or use:

    INFRA_NS=infra WITH_ETCD=etcd.infra.svc:2379 WITH_KAFKA=kafka.infra.svc:9092 WITH_ONOS=onos-onos-classic-hs.infra.svc:6653 NAME=voltha1 VOLTHA_NS=voltha1 ADAPTER_NS=voltha1 BBSIM_NS=voltha1 BBSIM_BASE_INDEX=1 ./voltha up

Deploy a VOLTHA stack
---------------------

Once the ``infrastructure`` is set up you can deploy a ``VOLTHA`` stack using this command:

.. code:: bash

  NAME=voltha1 VOLTHA_NS=voltha1 ADAPTER_NS=voltha1 BBSIM_NS=voltha1 BBSIM_BASE_INDEX=1 ./voltha up

NOTE that this command assumes you have exported the variables printed at the end of the ``infra`` deployment.
In particular the required variables are:

- ``INFRA_NS=infra`` (optional) only required if you installed the infrastructure using ``kind-voltha``
- ``WITH_ETCD=etcd.infra.svc:2379`` the ETCD address
- ``WITH_KAFKA=kafka.infra.svc:9092`` the KAFKA address
- ``WITH_ONOS=onos-onos-classic-hs.infra.svc:6653`` the ONOS address

Deploying multiple VOLTHA stacks
********************************

When you deploy a second ``VOLTHA`` stack there are some information that you need to customize in order to keep the
two stacks independent:

- ``NAME`` - the name of the stack, is used in log and configuration files and to customize the KAFKA topics each stack
  is listening on
- ``VOLTHA_NS, ADAPTER_NS, BBSIM_NS`` - are used to configure in which namespace the components are installed
- ``BBSIM_BASE_INDEX`` - is used to guarantee that different ``BBSim`` instances won't have the same ID (have to be
  unique across all the stacks)

Operate a VOLTHA stack
----------------------

Once the installation completes a ``voltctl`` config file is generated for each cluster, in the format:

.. code:: bash

  VOLTCONFIG="~/.volt/config-<$NAME>"

In order to use multiple stacks via the same ``voltcl`` tools we **strongly** suggest to **always** specify
the appropriate configuration with the ``-c`` flag, for example:

.. code:: bash

  voltctl -c ~/.volt/config-voltha1 adapter list
