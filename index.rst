VOLTHA Documentation
====================

`VOLTHA (Virtual OLT Hardware Abstraction
<https://www.opennetworking.org/voltha/>`_ is an open source project to create a
hardware abstraction for broadband access equipment. It supports the principle
of multi-vendor, disaggregated, "any broadband access as a service" for the
Telco Central Office.

Key concepts in VOLTHA:

- **Network as a Switch**: It makes a set of connected access network devices
  to look like a SDN programmable switch.

- **Evolution to virtualization**: it can work with a variety of access network
  technologies and devices

- **Unified OAM abstraction**: it provides unified, vendor- and technology
  agnostic handling of device management tasks, such as service lifecycle,
  device lifecycle (including discovery, upgrade), system monitoring, alarms,
  troubleshooting, security, etc.

- **Cloud/DevOps bridge to modernization**: it does all above while using a
  microservices architecture running on top of Docker and/or Kubernetes.

VOLTHA is a sub-project of the `Open Networking Foundation's
<https://www.opennetworking.org>`_ `CORD project
<https://www.opennetworking.org/cord/>`_.

.. figure:: ./_static/voltha_diagram.svg
   :alt: VOLTHA Component Diagram
   :width: 70%
   :align: center

   VOLTHA Component Diagram

Here some quick links to get you started:

- :doc:`./overview/architecture_overview`
- :doc:`./overview/deployment_environment`
- :doc:`./overview/troubleshooting`

Repositories
------------

Following is a list of all the repositories related to the VOLTHA project.

Services:

- `VOLTHA Core <https://github.com/opencord/voltha-go>`_
- `OpenFlow Agent <https://github.com/opencord/ofagent-go>`_
- `Openonu Adapter <https://github.com/opencord/voltha-openonu-adapter-go>`_
- `Openolt Adapter <https://github.com/opencord/voltha-openolt-adapter>`_
- `Openolt Agent <https://github.com/opencord/openolt>`_
- `ONOS controller <https://github.com/opencord/voltha-onos>`_
- `BBSIM <https://github.com/opencord/bbsim>`_
- `BBSIM Sadis Server <https://github.com/opencord/bbsim-sadis-server>`_

ONOS APPs:

- `AAA <https://github.com/opencord/aaa>`_
- `BNG <https://github.com/opencord/bng>`_
- `DHCP L2 Relay <https://github.com/opencord/dhcpl2relay>`_
- `IGMPProxy <https://github.com/opencord/igmpproxy>`_
- `Kafka <https://github.com/opencord/kafka-onos>`_
- `Mac Learning <https://github.com/opencord/mac-learning>`_
- `Multicast <https://github.com/opencord/mcast>`_
- `OLT <https://github.com/opencord/olt>`_
- `OLT Topology <https://github.com/opencord/olttopology>`_
- `PPPoE Agent <https://github.com/opencord/pppoeagent>`_
- `Sadis <https://github.com/opencord/sadis>`_

Libraries and APIs:

- `VOLTHA protos <https://github.com/opencord/voltha-protos>`_
- `VOLTHA Library in Go <https://github.com/opencord/voltha-lib-go>`_
- `OMCI Library in GO <https://github.com/opencord/omci-lib-go>`_

Device Management:

- `Device Management Interface <https://github.com/opencord/device-management-interface>`_
- `Device Manager <https://github.com/opencord/opendevice-manager>`_
- `Device Manager Agent <https://github.com/opencord/opendm-agent>`_

Tools:

- `voltctl <https://github.com/opencord/voltctl>`_

Deployment and Testing:

- `VOLTHA Helm Charts <https://github.com/opencord/voltha-helm-charts>`_
- `VOLTHA System Tests <https://github.com/opencord/voltha-system-tests>`_
- `CORD Tester <https://github.com/opencord/cord-tester>`_
- `Grpc robot library <https://github.com/opencord/grpc-robot>`_
- `Kafka robot library <https://github.com/opencord/kafka-robot>`_
- `Docker Tools <https://github.com/opencord/voltha-docker-tools>`_
- `Openolt scale tester <https://github.com/opencord/openolt-scale-tester>`_
- `Ci management <https://github.com/opencord/ci-management>`_
- `Pod Configs <https://github.com/opencord/pod-configs>`_
- `Openolt agent scale tester  <https://github.com/opencord/openolt-scale-tester>`_
- `Openolt functional tester <https://github.com/opencord/openolt-test>`_


Community
---------

VOLTHA is an open source project led by a technical steering team that holds weekly meetings.
You can find more information about the TST, community, meetings, mailing lists and slack channels
in the `VOLTHA wiki page <https://wiki.opennetworking.org/display/COM/VOLTHA>`_


.. toctree::
   :maxdepth: 1
   :caption: Overview
   :hidden:
   :glob:

   overview/architecture_overview.rst
   overview/deployment_environment.rst
   Deploy VOLTHA <voltha-helm-charts/README.md>
   overview/workflows.rst
   overview/operate.rst
   overview/lab_setup.rst
   overview/jenkins_node.rst
   overview/troubleshooting.rst
   overview/releases.rst
   overview/release_process.rst
   overview/contributing.rst

.. toctree::
   :maxdepth: 1
   :hidden:
   :caption: Components

   BBSIM <bbsim/docs/source/index.rst>
   OpenFlow Agent <ofagent-go/README.md>
   OpenOlt Adapter <voltha-openolt-adapter/README.md>
   OpenOnu Adapter Go <voltha-openonu-adapter-go/README.md>
   Openolt Agent <openolt/README.md>
   VOLTHA CLI <voltctl/README.md>
   VOLTHA Protos <voltha-protos/README.md>

.. toctree::
   :maxdepth: 1
   :hidden:
   :caption: Operations

   operations/software-upgrade.rst
   ONU software update <voltha-openonu-adapter-go/docs/ONU_Upgrade_Notes.md>

.. toctree::
   :maxdepth: 1
   :hidden:
   :caption: Performance Metrics, Alarms

   ONU Performance Metrics <voltha-openonu-adapter-go/docs/PM_Notes.md>
   ONU Alarms <voltha-openonu-adapter-go/docs/ONU_Alarms.md>

.. toctree::
   :maxdepth: 1
   :hidden:
   :caption: Bandwidth Profiles

   bandwidth-profiles/bandwidth-profiles.rst

.. toctree::
   :maxdepth: 1
   :hidden:
   :caption: Testing

   VOLTHA system tests <voltha-system-tests/README.md>
   testing/index.rst
   testing/memory_usage_pprof.rst
   testing/voltha_test_automation.rst
   testing/certification.rst

.. toctree::
   :maxdepth: 1
   :hidden:
   :caption: Logging

   logging/centralised_log_analysis.rst
   ONU adapter per package logging <voltha-openonu-adapter-go/docs/Specific_Logging_Notes.md>

.. toctree::
   :maxdepth: 1
   :hidden:
   :caption: Device Management Interface

   Overview <device-management-interface/README.md>
   Image management <device-management-interface/docs/DeviceImageManagement.md>
   Events and Metrics <device-management-interface/docs/EventsMetrics.md>
   Managing a device <device-management-interface/docs/ManagingDevice.md>
   Examples <device-management-interface/docs/Examples.md>
   Guidelines <device-management-interface/docs/RpcGuidelines.md>
   Implementation on BBSIM <bbsim/docs/source/DMI_Server_README.md>

.. toctree::
   :maxdepth: 1
   :hidden:
   :caption: Releases
   :glob:

   release_notes/release_process.rst
   release_notes/index.rst

.. toctree::
   :maxdepth: 2
   :caption: HOWTO Topics

   howto/index
