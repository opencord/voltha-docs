VOLTHA 2.8 Release Notes
========================

Highlights
----------

VOLTHA-2.8 is the first Long Term Support (LTS) release for VOLTHA. Together with  ONOS 2.5  (which is already LTS),
the LTS designation means that testing and bug-fixes will be guaranteed for 18 months on the released version of the
codebase. The release focused on storage with persistence at scale, platform hardening, tcont type selection, Multi-Uni
support and introduced several PON level metrics. All these elements provide confidence to the operators to expand
their production deployments.

The Long Term Support process is as follows:

- LTS releases 18 months apart.
- Each LTS release will be supported for 18 months with bug fixes and testing
- 6 month release cycles following LTS release
- Two interim releases every 6 months between LTS versions.

VOLTHA 2.8 first and foremost meets the scale requirements (1024 ONUS per stack, 10240 on 10 stack across the same
infrastructure) of the operator’s with persistence enabled on ETCD 6.2.5 version, deployed with the BITNAMI helm
charts. Such result was achieved thanks to the combination of several improvements across the whole stack.
The Technology profile is now mostly templated, the openolt adapter makes heavier use of the read-through cache,
the rw-core does not store the flows for each device. A ETCD connection pool has been introduced in voltha-lib-go
to ensure that the system is not choking by using 1 connection per service. With all these improvements on NVMe
disks all 3 workflows provision 1024 subscribers in around 2 minutes.

During the VOLTHA 2.8 release ONOS was moved from the 2.2 release which is shortly approaching EOL (end of life) to
ONOS 2.5, guaranteeing that for the extent of the 2.8 release also ONOS will be supported.

To support more customers in the field multi-UNI capability has been introduced across the VOLTHA stack and ONOS apps.
The system is now capable of delivering configuration and thus traffic to subscribers connected to all UNI ports
of each ONU, up to 16 per ONU.

Further subscriber configuration has been introduced with the support for the IETF model for bandwidth profiles
and the capability to provision and choose all the 5 TCONT types. These elements allow operator’s a wider variety
of subscriber configurations

To comply with operator requirements the ONU software upgrade APIs have been changed to support retrieval of images
present on the ONU and to separate the download, activate, commit, requests, allowing the operator more control over
the actions performed over the ONU. Furthermore hardening of the functionality has been done, achieving a much faster
ONU update time.

Further insight into live deployed networks has been introduced thanks to more Performance Measurements that can be
retrieved from the ONU and the OLT. In particular VOLTHA 2.8 implements ANi-G and ANi-G test messages with tx/rx
power readout, ONUi-PON, GEMj and UNI Ethernet layer, FEC and GEM history and several other counters.

Finally the release provided bug fixes across the stack, especially concerning device/port handling, such as,
PON enable/disable, OLT and ONU reboot and ONU software upgrade. Performance related improvements were included
in ONOS apps. VOLTHA 2.8 hardened several operations, one worth noting is the omci message retry on failure in
openonu adapter

On the testing front VOLTHA 2.8 expanded the suite for TT up to 20 tests, with failure and error scenarios,
including several multi TCONT testing as per TT workflow. Testing has included also a full suite for the
Performance Measurements functionality, especially ANI-G. Furthermore we included support for multi-uni in the robot
suite and expanded the soak testing with DT workflow.

Along with VOLTHA 2.8, the Device Management Brigade also released a new version
(`1.0.0 <https://github.com/opencord/device-management-interface/releases/tag/v1.0.0>`_) of the interface,
which has been implemented on BBSIM and has initial robot test cases. This DMI release introduces specific components
values, BITS protocol, gRPC streams for events and metrics that can be use in place of kafka, more events and
a heart beat check.

Features & Improvements
-----------------------

- ETCD 6.2.5 with persistence enabled

  - Templated technology profile
  - Removal of flows and meters storage in the rw-core.
  - Openolt adapter read-through cache
  - ETCD connection pool in voltha-lib-go
  - Optimization of several stored attributes, removing duplicate items
  - Automatic compaction and defragmentation

- Move to ONOS 2.5 LTS
- Expanded ONU software upgrade capability

  - Retrieval of image specifics via OMCI of the images from the device
  - Separation of download/activate/commit APIs
  - Time optimization
- Multi Uni per ONU support across the whole stack, ONOS apps and BBSIM
- IETF bandwidth profile definition support
- 5 Tcont type configuration and selection
- Collection of more performance measurements and counters

  - ANi-G and ANi-G test message with te/rs power support
  - ONUi-PON and ONUi-GEMj
  - ONU-UNI Ethernet layer
  - Eth-Port
  - GEM Port History
  - FEC History
  - Transceiver data via DMI
- OMCI channel message send/receive failure handling with retry in openonu adapter
- Voltctl extensions

  - Multi-stack support
  - Groups list
  - Retrieve of Performance Metrics
- Distroless and non root docker images for production deployment security

Development/Deployment process
------------------------------

- Deprecation of kind-voltha in favour of voltha-stack and voltha-infra helm charts.

Test
----

Voltha-2.8 tests are available on `Jenkins <https://jenkins.opencord.org/>`_.

- Full Performance Monitoring Attributes test suite
- Multi Uni per ONU tests
- OMCI requests failures chaos monkey
- Expanded TT tests from 5 to 19

  - Disable/Enable ONU
  - Disable/Delete OLT
  - Open-olt, Open-onu, Rw-core, Of-agent Restart
  - Delete/Re-add (reprovisioning) Subscribers
  - ONU and OLT Physical and Soft Reboot
  - Various Multi-Tcont scenarios

- Radisys 3200G GPON OLT DT and ATT tests
- Expanded and automated soak testing with DT workflow.
- OLT soft reboot for DT
- Updated ONU Software Upgrade Tests based on new Voltctl commands

Design Discussions
------------------

- PON-ID configuration
- MPLS support
- TIM workflow


Documentation
-------------

- Updated documentation with new ONU software update and software update is published on https://docs.voltha.org

Known Issues
------------
.. raw:: html

   <s>

- [FIXED] Same TCONT for two uni add/delete subscribers does not work. `[VOL-4215] <https://jira.opencord.org/browse/VOL-4215>`_

.. raw:: html

   </s>

- [FIXED] EAPOL flow meter mismatch at scale for ATT job. `[VOL-4235] <https://jira.opencord.org/browse/VOL-4235>`_


Certification Program
---------------------

Thanks to the `Continuous Certification <https://opennetworking.org/continuous-certification-program>`_ program at
ONF we can also ensure that the following ONF member products are compatible with the VOLTHA 2.8 release:

- Edgecore ASGVolt64 GPON OLT
- Edgecore ASXVolt16 XGSGPON OLT
- Radisys 3200G GPON OLT
- Radisys 1600G GPON OLT
- Radisys 1600X GPON OLT
- Adtran 6320 GPON OLT
- Sercomm FG1000 GPON ONU
- Sercomm Glasfaser GPON ONU
- Edgecore 6712-32X Switch
- Edgecore 7712-32X Switch

In particular the 2.8 release added the Radisys 3200G GPON OLT.

Jira stories
------------
A full list of stories and bugs completed can be found under the
`VOLTHA 2.8 <https://jira.opencord.org/projects/VOL/versions/12100>`_ release page in Jira.

Component Versions in VOLTHA 2.8 release
----------------------------------------

ONOS and Atomix:
++++++++++++++++

- `ONOS 2.5 LTS <https://github.com/opennetworkinglab/onos/releases/tag/2.5.2>`_: ``2.5.4``
- `ATOMIX <https://github.com/atomix/atomix/releases/tag/atomix-3.1.9>`_: ``3.1.9``

ONOS Apps:
++++++++++

- `aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_: ``2.4.0``
- `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_: ``2.4.0``
- `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_: ``2.3.0``
- `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_: ``2.7.0``
- `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_: ``2.4.0``
- `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_: ``4.5.0``
- `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_: ``5.4.0``
- `bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`_: ``2.1.0``
- `pppoeagent <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/>`_: ``1.1.0``
- `olttopology <https://gerrit.opencord.org/plugins/gitiles/olttopology/>`_: ``1.1.0``

VOLTHA Components:
++++++++++++++++++

- `Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree;h=refs/heads/voltha-2.8>`_ - ``2.8.19``
- `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`_- ``1.8.1`` with `chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_ ``4.4.3``
- `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree;h=refs/heads/voltha-2.8>`_ - ``2.9.6`` with chart ``2.9.10``
- `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree;h=refs/heads/voltha-2.8>`_ - ``1.6.5``  with chart ``2.9.10``
- `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_ - ``1.6.11``
- `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree;h=refs/heads/voltha-2.8>`_ - ``3.5.11`` with chart ``2.9.11``
- `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree;h=refs/heads/voltha-2.8>`_ - ``1.3.16`` with chart ``2.8.13``
- `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree;h=refs/heads/voltha-2.8>`_ -  ``5.0.3`` with chart ``0.1.16``
- `openolt agent <https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree;h=refs/heads/voltha-2.8>`_ - ``3.4.9``
- `voltha-protos <https://github.com/opencord/voltha-protos/releases/tag/v4.0.5>`_ - ``4.2.0``
- `voltha-lib-go <https://github.com/opencord/voltha-lib-go/releases/tag/v4.0.3>`_ - ``5.0.7``
- `Bbsim-sadis-server <https://github.com/opencord/bbsim-sadis-server/releases/tag/v0.1.3>`_ - ``0.3.0`` with chart ``0.2.0``
- `voltha-system-tests <https://github.com/opencord/voltha-system-tests/releases/tag/2.8.0>`_ - ``2.8.17``


Helm Chart Versions:
++++++++++++++++++++
This section refers to the macro charts to deploy the required infrastructure and a (or many) VOLTHA stacks:
- Voltha-infra: ``2.8.2``
- Voltha-stack: ``2.8.15``

BAL Version:
++++++++++++
Broadcom abstraction layer (BAL) version: ``3.4.9.9``.

Openolt Agent packages:
+++++++++++++++++++++++
**EdgeCore**
Available from EdgeCore site:

- Out of band management

  - ONL version (both GPON and XGSPON) ONL-onl-4.14_ONL-OS8_2020-04-14.1946-72b95a7_AMD64_INSTALLED_INSTALLER available
    at /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution
  - for ASFVOLT16 available, from /ASFvOLT16/OpenOLT_Agent/From_ONF_Distribution/voltha-2.8/OUT-OF-BAND.:

    - ``openolt_asfvolt16-3.4.9-e2a9597f3d690fe3a0ea0df244571dfc9e8c2833-100G-NNI.deb`` if 100G NNI port is used
    - ``openolt_asfvolt16-3.4.9-e2a9597f3d690fe3a0ea0df244571dfc9e8c2833-40G-NNI.deb`` if 40G NNI port is used.

  - for ASGVOLT64 available at /ASGvOLT64/OpenOLT_Agent/From_ONF_Distribution/voltha-2.8/OUT-OF-BAND:

    - ``openolt_asgvolt64-3.4.9-e2a9597f3d690fe3a0ea0df244571dfc9e8c2833-100G-NNI.deb`` if 100G NNI port is used
    - ``openolt_asgvolt64-3.4.9-e2a9597f3d690fe3a0ea0df244571dfc9e8c2833-40G-NNI.deb`` if 40G NNI port is used.

- In band management

  - use ONL image, comprising of Bal and openolt (available from edgecore site) for ASFVOLT16
    ONL-onl-4.14_ONL-OS8_2021-08-05.0514-72b95a7_AMD64_INSTALLED_INSTALLER-40G-NNI,
    available at /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/voltha-2.8/IN-BAND.
    Note that debian package available as part of the ONL support 40G NNI by default.

Get access credentials for https://edgecore.quickconnect.to and then login
and navigate to File_Station -> EdgecoreNAS, and then the folder
/ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ and pick the version above

**Radisys**
For 3200G 40G NNI .Deb Version: ``openolt_rlt-3200g-w-40g-3.5.1-dev-262b6293cdeda78317dda9d3a6cfab0e7ebfbf05.deb``
To get the debian package for Radisys 3200G OLT please write to `Cameron Lundberg <cameron.lundberg@radisys.com>`_

