VOLTHA 2.10 Release Notes
=========================

Highlights
----------

VOLTHA-2.10 builds on the 2.9 release for VOLTHA. The release focused on including new features, improving scale and
interacting with the Broadband Forum BBF. With VOLTHA 2.10 Fiber to the Building (FTTB) capabilities were introduced,
scale was enhanced to 4096 subscribers per stack, rolling software upgrade capabilities were introduced and the ONU
adapter was improved with extended message support and unknown ME handling. ONU delete and automatic re-discovery
was implemented. Finally collaboration with BBF defined the yang models extension needed to support VOLTHA, that were
started to get implemented in the BBF adapter for the VOLTHA northbound.
Finally new tests were introduced for FTTB, memory leaks and the Telecom Italia (TIM) workflow.


VOLTHA 2.10 first and foremost introduced the support for FTTB use case with the 1 tcont 4 gem technology profile.
VOLTHA now has capability to install ANCP, DPU management and subscriber rules flow rules. These rules are created in
ONOS and translated in vlan swapping at the OLT (outer vlan swap). The rules get installed after the MAC address is
learnt for the DPU device. These Rules configure the OMCI ONT within the DPU. Extensions have been made in ONOS and
in the different adapters. Sadis has been extended with the subscriber and ANCP/Management traffic definitions and
documentation.
Extended work has been put in to increase scalability and in VOLTHA 2.10 a single stack can support up to
4096 subscribers, on one or two OLTs, while keeping the same 10 minute maximum provisioning time from when the OLT
connects to VOLTHA. All the VOLTHA components have also been extended to ensure a smooth upgrade with no request
downtime via the Kubernetes rolling upgrade functionality.
The onu adapter now allows for ONU automatic re-discovery after deletion, unknown ME handling where we ignore
unknown messages but still onboard the ONU. Extended message support has also been introduced allowing for
faster ONU image installation and MIB initial download. Extended message support has been parameterized not to be
enabled by default, it has also been tested only with BBSIM, according to according to ITU-T G.988 Amendment 3
(03/2020, further hardware test will be done and required fixes will be applied, any report from the community
is appreciated.

The stack has been enhanced to provide a pathway for supporting COMBO PON OLTs with the introduction of a framework of
dynamic detection of PON Transceiver Technology and then using that information to configure the MAC and PON modes.

Alignment with the Broadband Forum progressed and a first agreement has been reached on the yang models that correctly
map VOLTHA, both on the OLT and ONU side and the subscriber service abstraction. The BBF models have been extended and
the proposals are ready for submission for official approval. In the meantime a BBF adapter has been written,
exposing a netconf server on the NB which leverages the mentioned models and in turns call the VOLTHA/ONOS apis.

Finally the release provided bug fixes across the stack, especially around Resource Cleanup and correct state assurance
for devices and for the different containers. Also several panics and null pointer exceptions have been prevented,
yielding a much more stable system.

On the testing front VOLTHA 2.10 includes tests for the FTTB functionality, both on BBSIM and on a physical DPU in
the Berlin POD. Also, TIM Workflow tests have been introduced in BBSIM, to avoid regression for that workflow,
which includes the PPPoE application. New tests have been introduced to check for memory leaks during device deletion
and re-creation both for the ONU adapter and the OLT adapter.
Other new tests for the unknown MEs, ONU delete and re-discovery, rolling upgrade and extended OMCI message support.
More tests have been extended, such as TT with unit-tag subscriber provisioning, mac learning, also the
Device management Interface tests are now being run on hardware as well.

Along with VOLTHA 2.10, the Device Management Brigade also released new major versions
(up to `1.5.0 <https://github.com/opencord/device-management-interface/releases/tag/v1.5.0>`_) of the interface
with COMBO PON support, NNI port speed runtime config, new events and states.


Features & Improvements
-----------------------

- Fiber to the Building (FTTB) Support

  - Support for DPU management and ancp traffic rules single tagged with VLAN swap
  - Support for Subscriber traffic flows with outer VLAN swap
  - Sadis integration with documentation
  - Hardware integration with ADTRAN DPU
  - 1 tcont 4 Gem technology profile

- Scale enhancements

  - 4096 subscribers on one OLT with 1 VOLTHA stack
  - 4096 subscribers on two OLTs with 1 VOLTHA stack

- Rolling software upgrade capabilities

  - Kubernetes rolling upgrade of pods
  - Requests always served with no pod downtime

- Initial Combo PON support

  - Framework for dynamic detection of PON Transceiver Technology

- Extended Message Support in ONU Adapter

  - Reduced number of messages for ONU Software Upgrade and MIB template download
  - Higher speed of software image and MIB template download

- Unknown MEs handling

  - Relaxed decoding of unknown MEs
  - Discarded unknown entities but proceed with ONU MIB download for that ONU.

- ONU Delete and re-discovery

- BBF Adapter Initial Implementation

  - Northbound NETCONF server
  - Southbound integration with VOLTHA protos, ONOS APIs
  - Augmentation and use of existing BBF models
  - Get OLT and ONU information via NETCONF and BBF models

- Move to ONOS 2.5.8 with bug fixes

Bug Fixes
---------

- Resource cleanup in ONOS, ETCD and final state machines, especially in case of device delete/restart and adapter(s)
  restart
- Avoid wrong state and missing notification for ONUs in several components and system states.
- Avoid panic and runtime expectations in VOLTHA and ONOS Apis



Test
----

Voltha-2.10 tests are available on `Jenkins <https://jenkins.opencord.org/>`_.

- FTTB tests
- Optimized ATT test for time reduction
- Memory leak tests with 200 iterations of device deletion
- Unknown ME tests
- Extended OMCI message support for MIB Upload
- ONU Delete and Rediscovery
- Mac Learning in TT Sanity
- Mib Audit
- Device Management Interface tests on ADTRAN hardware
- MDS mismatch
- Voltha services Rolling upgrade
- TIM workflow tests
- Unknown attribute tests


Design Discussions
------------------

- OLT Disconnect and Reconnect
- ONOS replacement controller (lightweight VOLTHA controller)
- ONF/BBF integration and models extension
- COMBO PON support



Documentation
-------------

- Contributing to VOLTHA
- Certification program
- release procedure and versioning guidelines
- jenkins node setup for testing
- Rollback scenarios

As usual documentation is published on https://docs.voltha.org

Known Issues
------------

- FTTB Upstream flow stays in pending add on openolt based devices. `[VOL-4742] <https://lf-broadband.atlassian.net/browse/VOL-4742>`_
- ATT Workflow fails EAPOL flow installation at scale `[VOL-4745] <https://lf-broadband.atlassian.net/browse/VOL-4745>`_
- Olt app removes flows based on the latest Sadis entry, if sadis changes flows can’t be removed. `[VOL-4746] <https://lf-broadband.atlassian.net/browse/VOL-4746>`_
- Flows stuck in pending-add when subscriber is provisioned after open-olt-adapter pod restart `[VOL-4747] <https://lf-broadband.atlassian.net/browse/VOL-4747>`_
- Alpha ONUs on soak pod drop upstream ARP/ICMP packets `[VOL-4748] <https://lf-broadband.atlassian.net/browse/VOL-4748>`_
- Rolling update test failures `[VOL-4749] <https://lf-broadband.atlassian.net/browse/VOL-4749>`_


Certification Program
---------------------

Thanks to the `Continuous Certification <https://opennetworking.org/continuous-certification-program>`_ program at
ONF we can also ensure that the following ONF member products are compatible with the VOLTHA 2.10 release:

- Edgecore ASGVolt64 GPON OLT
- Edgecore ASXVolt16 XGSGPON OLT
- Radisys 3200G GPON OLT
- Radisys 1600G GPON OLT
- Radisys 1600X COMBO OLT
- Adtran 6320X COMBO OLT
- Zyxel SDA3016SS Combo OLT
- Sercomm FG1000 GPON ONU
- Sercomm Glasfaser GPON ONU
- Edgecore 6712-32X Switch
- Edgecore 7712-32X Switch

In particular the 2.10 release added the Zyxel SDA3016SS COMBO OLT.

Jira stories
------------
A full list of stories and bugs completed can be found under the
`VOLTHA 2.10 <https://lf-broadband.atlassian.net/secure/ReleaseNote.jspa?projectId=10106&version=12300>`_ release page in Jira.

Component Versions in VOLTHA 2.10 release
-----------------------------------------

ONOS and Atomix:
++++++++++++++++

- `ONOS 2.5 LTS <https://github.com/opennetworkinglab/onos/releases/tag/2.5.8>`_: ``2.5.8``
- `ATOMIX <https://github.com/atomix/atomix/releases/tag/atomix-3.1.9>`_: ``3.1.9``

ONOS Apps:
++++++++++

- `aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_: ``2.6.0``
- `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_: ``2.6.0``
- `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_: ``2.5.0``
- `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_: ``2.9.0``
- `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_: ``2.6.0``
- `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_: ``5.1.2``
- `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_: ``5.6.0``
- `bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`_: ``2.2.0``
- `pppoeagent <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/>`_: ``1.2.0``
- `olttopology <https://gerrit.opencord.org/plugins/gitiles/olttopology/>`_: ``1.2.0``

VOLTHA Components:
++++++++++++++++++

- `Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree>`_ - ``3.1.4``
- `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`_- ``1.12.10`` with `chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_ ``4.8.6``
- `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree>`_ - ``3.1.5`` with chart ``2.11.3``
- `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree>`_ - ``2.1.2``  with chart ``2.11.3``
- `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_ - ``1.7.6``
- `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree>`_ - ``4.2.6`` with chart ``2.11.3``
- `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree>`_ - ``2.2.8`` with chart ``2.10.3``
- `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree>`_ -  ``5.1.1`` with chart ``0.1.27``
- `openolt agent <https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree>`_ - ``3.7.5``
- `voltha-protos <https://github.com/opencord/voltha-protos/releases/tag/v5.2.5>`_ - ``5.2.5``
- `voltha-lib-go <https://github.com/opencord/voltha-lib-go/releases/tag/v7.1.7>`_ - ``7.1.7``
- `Bbsim-sadis-server <https://github.com/opencord/bbsim-sadis-server/releases/tag/v0.3.4>`_ - ``0.3.4`` with chart ``0.3.1``
- `voltha-system-tests <https://github.com/opencord/voltha-system-tests/releases/tag/2.9.0>`_ - ``2.10.1``


Helm Chart Versions:
++++++++++++++++++++
This section refers to the macro charts to deploy the required infrastructure and a (or many) VOLTHA stacks:
- Voltha-infra: ``2.10.7``
- Voltha-stack: ``2.10.5``

BAL Version:
++++++++++++
Broadcom abstraction layer (BAL) version: ``3.10.2.2``.

Openolt Agent packages:
+++++++++++++++++++++++
**EdgeCore**
Get access credentials for https://edgecore.quickconnect.to from Edgecore.
Then login and navigate to ``File_Station`` -> ``EdgecoreNAS``, and then the folder
``/ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/voltha-2.10`` or
``/ASGvOLT64/OpenOLT_Agent/From_ONF_Distribution/voltha-2.10`` based on ``ASXvOLT16`` or ``ASGvOLT64`` platform,
and pick the suitable OLT debian package based on ``BAL 3.10.2.2`` applicable for you.
Please make sure to use the ONL
``/ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ONL-onl-4.14_ONL-OS8_2021-11-26.0058-0de1c30_AMD64_INSTALLED_INSTALLER``
for running ``BAL 3.10.2.2``.

**Radisys**
Please write to `Cameron Lundberg <cameron.lundberg@radisys.com>`_
to get the OLT debian package validated on 3200G, 1600x and 1600G platforms for VOLTHA-2.10 release

**Zyxel**
Please write to `Emanuel Villalobos <Emanuel.Villalobos@zyxel.com.tw>`_
to get the OLT debian package validated on the SDA3016SS for VOLTHA-2.10 release.
