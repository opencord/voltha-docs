Operator workflows
==================

``Workflow`` is a term that spilled from the SEBA Design reference into VOLTHA.

In SEBA a workflows is defined as the set of operations that control the lifecycle
of a subscriber, authentication logic, customer tag management etc...

A full description of the workflows can be `found here <https://drive.google.com/drive/folders/1MfxwoDSvAR_rgFHt6n9Sai7IuiJPrHxF>`_.

A big part of the workflow in SEBA is defined within NEM (Network Edge Mediator).
Given that this component is not available in a plain VOLTHA deployment the definition
of workflow is a subset of the SEBA one, and comprise:

- Customer tags allocation
- Technology profile
- Bandwidth profile
- Flow management (EAPOL/DHCP/Data path)

The `workflows` are often referred to as `use-cases` and the two words are interchangeable
in the VOLTHA environment.

How is the workflow defined in VOLTHA?
----------------------------------------

Customer tag allocation
***********************

The vlan tags for a particular subscriber are defined in the ``sadis`` configuration.
`Sadis <https://github.com/opencord/sadis>`_ stands for `Subscriber and Device Information Service`
and is the ONOS application responsible to store and distribute Subscriber information.

Information on the different ``sadis`` configurations can be found here:
https://docs.google.com/document/d/1JLQ51CZg4jsXsBQcrJn-fc2kVvXH6lw0PYoyIclwmBs

Technology profile
******************

Technology profiles describe technology specific attributes required to implement
Subscriber Services on an OpenFlow managed  Logical Switch overlaid upon an OLT
or other technology specific platform.

More on Technology profiles here:
https://wiki.opencord.org/display/CORD/Technology+Profiles#TechnologyProfiles-IntroductiontoTechnologyProfiles

Technology profiles in VOLTHA are stored in ETCD. If you want to load a custom
Technology profile in your stack you can do so by:

.. code:: bash

    ETCD_POD=$(kubectl get pods | grep etcd | awk 'NR==1{print \$1}')
    kubectl cp <my-tech-profile>.json $ETCD_POD:/tmp/tp.json
    kubectl exec -it $ETCD_POD -- /bin/sh -c 'cat /tmp/tp.json | ETCDCTL_API=3 etcdctl put service/voltha/technology_profiles/XGS-PON/64'

*Note that `XGS-PON` represents the technology of your OLT device and `64` is
the default id of the technology profile. If you want to use a technology profile
that is not the default for a particular subscriber that needs to be configured
in `sadis`.*

Bandwidth profile
*****************

Bandwidth profiles control the allocation Bandwidth for a particular subscriber.
They are defined in the `sadis`.

Flow management
***************

Flows are managed in ONOS by the `olt` application. Through the configuration of
this application you can define wether your setup will create:

- An `EAPOL` trap flow
- A `DHCP` trap flow

in addition to the default data plane flows.
