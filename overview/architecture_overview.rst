VOLTHA Architecture Overview
=============================

A VOLTHA and ONOS deployment is comprised of two main groups of services, the ``infrastructure`` made of storage,
message bus and SDN controller and a number of voltha stacks, each including voltha core, adapters and openflow agent.

All the components in the VOLTHA project are containerized and the default deployment environment is ``kubernetes``,
where they are installed through ``helm`` charts.
The location of the ``kubernetes`` cluster is not of a concern of the VOLTHA project per se, it can be deployed in a
data centre, on the cloud or on the OLT box itself if the hardware is powerful enough, e.g. multi-chassis OLTs.
Proper considerations should be made by the operator around failure and resiliency of the system in any of these
different deployments. The suggested deployment from ONF is on a 3 node bare metal cluster located close to the
OLT location, e.g. Central office of the operator.

Alongside VOLTHA and ONOS also the Device Manager, an (optional) component which implements the
`Device Management Interface <https://github.com/opencord/device-management-interface>`_,
can be deployed to support non VOLTHA related operations, e.g. OLT software update, through the standard.

Infrastructure
---------------

The Infrastructure for a VOLTHA deployment contains, at the bare minimum:

    - A ``kafka`` cluster. `Kafka <https://kafka.apache.org>`_  is the messaging bus system used to communicate to
      and from the different VOLTHA components and to publish events to the outside listeners, such as the Operator's
      OSS/BSS. The recommended deployment size is 3 nodes for failure and resiliency, but can also be a single node.
    - An ``etcd`` cluster. `ETCD <https://etcd.io>`_ is used to store information and state by the different VOLTHA
      components. The recommended deployment size is 3 nodes for failure and resiliency,
      but can also be a single node.
    - ``ONOS`` SDN Controller. `ONOS <https://github.com/opennetworkinglab/onos>`_ manages the VOLTHA abstracted
      switch, installs traffic forwarding rules and handles different type of failures, e.g. port down events.
      ONOS comes with it's own storage in the form of an ``Atomix`` cluster.
      The recommended deployment size is 3 nodes for ONOS and 3 nodes for Atomix to achieve high avaliability and
      resiliency, but can also be a single node with no atomix.
    - [Optional] ``radius`` server. A radius server is required for the ATT workflow for EAPOL based authentication.

An infrastructure comprised of 3 node clusters of each of the components can handle up to 10 VOLTHA stacks, where
each stack has up to 1024 subscribers, located on a single OLT or divided over a handful of them.

VOLTHA Stack
-------------

A single VOLTHA stack contains several components, each interacting with one another with open APIs defined in protobuf
within the `voltha-protos <https://github.com/opencord/voltha-protos>`_ repo:

    - ``voltha-core``. The `VOLTHA core <https://github.com/opencord/voltha-go>`_ is the heart of the VOLTHA
      components. It receives requests from the Northbound, divides them in the proper sub-set of
      operations for each of adapters. Handles registration of the adapters and the subsequent device
      information of ONUs and OLTs which it stores in ETCD.
      It also abstracts the OLT and ONU pairs as a switch in the form of a ``logical device``. Flows from the SDN
      controller are stored, decomposed by the core and sent as specific instructions to the correct adapter(s).
    - ``OpenFlow Agent``. The `ofAgent <https://github.com/opencord/ofagent-go>`_ as it is also known is responsible
      of establishing the connection to theSDN controller, pushing information and events about the devices in VOLTHA
      given by the core. It also receives flows, groups and meters instructions from the controller and sends them to
      the core. It's complelty stateless.
    - ``OLT adapter``. The OLT adapter is the key component for importing an OLT of any model into VOLTHA. The main
      purpose of this component is to interact with the physical OLT, receive it's information, events and status and
      report them to the core, while at the same time receive requests from the core and issue them to the device.
      The olt adapter also abstracts the technology of the OLTs, e.g GPON, XGS-PON, EPON.
      The interface to the core is standardized in the `voltha-protos <https://github.com/opencord/voltha-protos>`_
      and must be common for any adapter by any OLT vendor.
      The southbound interface towards the OLT and its software can be proprietary as it's not seen by upper layers
      of the system. An opensource implementation exists in the form of the `open-olt-adapter <https://github.com/opencord/voltha-openolt-adapter>`_) which uses
      gRPC and the ``olt.proto`` API as its means of communication to the ``open-olt-agent``. Closed source adapter
      that use different SB protocols to the device, such as NETCONF, have been have been proven to work with VOLTHA
      with no changes to the system.
    - ``ONU Adapter``. The ONU adapter is responsible for all the interactions and commands towards the ONU via OMCI,
      such as discovery, MIB upload, ME configuration, T-CONT and GEM port configuration and so on.
      The existing open source implementation `voltha-openonu-adapter-go <https://github.com/opencord/voltha-openonu-adapter-go>`_) includes a virtualized openOMCI,
      fully compliant withe `G983 spec <https://www.itu.int/rec/T-REC-G.983.9-200406-W/en>`_ stack. Any
      openOMCI compliant ONU can thus be connected to VOLTHA with no additional effort. For other technologies
      (e.g. EPON) or other Vendors other onu adapters that adhere to the `voltha-protos <https://github.com/opencord/voltha-protos>`_
      can be brought in.

A VOLTHA stack is intended to be deployed for 1 up to a handful of OLTs with a total of 1024 subscribers connected.
For multiple OLT scenarios many VOLTHA stacks can be connected to the same infrastructure, thus sharing storage,
message bus and SDN controller.

Device Management Interface
----------------------------

The `Device Management Interface <https://github.com/opencord/device-management-interface>`_
is a protobuf Open API to allow an Operator OSS/BBS to manage aspects of the OLTs that are not under the control
and pertinence of VOLTHA, for example software upgrade or component inventory.
In a VOLTHA deployment one can (optionally) deploy a component implementing the Device Management Interface.
The component of the architecture that implements the DMI interface can live in different places:

    - on hardware, in which case it's a process running on the pyhsical OLT leveraging platfrom APIs (e.g. ONLP)
      to report information.
    - in the same kubernetes cluster as VOLTHA and the VOLTHA infrastructure, possibly leveraging
      the same Kafka Bus for events as well. In this case is will leverage some form of protocol (e.g. NETCONF)
      to communicate to the physical OLT

An exemplar implementation of the DMI with option 1 deployment can be seen on
`BBSIM <https://github.com/opencord/bbsim/blob/master/docs/source/DMI_Server_README.md>`_

