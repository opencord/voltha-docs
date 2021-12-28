VOLTHA 2.9 Release Notes
========================

Highlights
----------

VOLTHA-2.9 builds on the existing 2.8 Long Term Support (LTS) release for VOLTHA.

The release focused on including some important underlying architectural changes that were avoided before the LTS
release. With VOLTHA 2.9 Kafka was removed as a mechanism for the inter-container communication and the ONOS OLT app
was completely rewritten, moreover a new transparent OLT tagging workflow has been introduced, to support
new operators, e.g. TIM. OLT Underlying software was updated to newer APIs. Other enhancements included resource
limits for the various components, optimization on the OMCI channel and proper cleanup of several items and resources.
During the 2.9 continuous support of the 2.8 release was done, with continuous bug fixes based on the jenkins
nightly suite and 2.9 discoveries.


VOLTHA 2.9 first and foremost moved away from the Kafka bus for inter container communication. Removing Kafka made the
interaction between the different VOLTHA components (core and adapters) direct and with no serialization overhead,
guaranteeing not only faster communication but an immediate response for operations. Removing Kafka uncovered several
bugs related to timing between the core and the adapters. All of these were fixed and where applicable also back-ported
to the 2.8 release.
Alongside the removal of Kafka, while the voltha-protos and voltha-lib go were modified a cleanup of stale APIs and
objects was performed, clarifying the supported protos objects and simplifying the library functions.

During the VOLTHA 2.9 release the OLT ONOS app was completely re-written to ensure better code quality, workflow
separation, correct handling and ordering of events. The app is based on a per subscriber queue mechanism, not on a
series of java completable futures, which were hard to coordinate. The queue mechanism also increased speed and
performance of the app. Furthermore code quality vastly improved, making the app now much more extensible as
showcased by a new transparent OLT workflow that was integrated. ONOS was moved to ONOS 2.5.4, which includes a
key bugfix on the application store to enable In Service Software Update (ISSU) of ONOS instances. The 2.5.4 includes
also other bug fixes on the 2.5 LTS version.
Along with the OLT app queuing mechanism a flow serialization and queuing mechanism was also introduced in the
openonu adapter and finalized in the OLT adapter to handle flows and technology profile instances, ensuring correct
ordering at this level as well.

Transparent OLT tagging capability has been integrated in VOLTHA and ONOS. Configuring the 4096 VLAN in sadis as
c-tag for a subscriber now makes the OLT just transparently forward traffic, which must be double tagged. No VLAN
operation will be performed after the ONT tags the packet. Such workflow requirement from Telecom Italia that,
thanks to this support, can now deploy VOLTHA in their network.

The Broadcom Abstraction Layer has been moved to BAL 3.10.2.2. A major version upgrade that ensures inclusion of
multiple bug fixes and setting up for feature support such as LAG and IPv6.

Several enhancements were made on the interaction and process with the ONUs. First and foremost VOLTHA 2.9 supports
OMCI prioritized sending allowing operations such as ONU software download to have lower priority than other
configuration requests. The decoding of MEs has been relaxed and storing of unknown MEs has been implemented,
allowing the inclusion of non-standard MEs from ONUs, expanding the pool of supported devices.

Finally the release provided bug fixes across the stack. Previously discussed were the ETCD stale information
fixes that ensured Proper Cleanup of resources in the storage after device/flows delete. Cleanup of VTFD and
other resources is also performed on the ONU.
Several fixes were brought in the ONU image upgrade procedures concerning multiple ONUs, allowing abort during any
phase and correct indication statuses. The ONU port locking state is also now correctly reported. Fixes were also
included for flow deletion operation during reconciliation and possible deadlocks for Flow/GemPort multi-uni scenarios.
Serialization was enhanced in omci-lib-go.  For a complete list of bugs please refer to the Jira Issues section.

On the testing front VOLTHA 2.9 expanded the openonu suite with new multi-uni and multi-olt tests, extending the ONU
software update success and failure scenarios.  2.9 expands the TT multicast tests to 7 tests from the basic first
test. Container restart tests now include a continuous background ping. ONU delete and re-add is also tested,
alongside the before-mentioned correct device, subscriber and service information deletion across the stack.
Furthermore 3 new OLTs were added to Certification for both the 2.8 and 2.9 releases, Radisys 1600G and 1600X and
the ADTRAN 6320.

During the 2.9 release also key design discussions have been happening to have BBF relationship and design discussion
for IPv6, Plain Old Telephone Support (POTS), LAG and the next iteration of a controller for VOLTHA that will replace
ONOS.

Along with VOLTHA 2.9, the Device Management Brigade also released a new minor version
(`1.1.1 <https://github.com/opencord/device-management-interface/releases/tag/v1.1.1>`_) of the interface with
Introduce PON-ID related APIs, port mapping labels and auto-negotiation parameters.


Features & Improvements
-----------------------

- Move to gRPC for inter container communication

  - Removal of Kafka bus for internal use
  - Direct communication between containers via gRPC
  - Immediate response for request
  - Faster container to container interaction
  - Fixed several bug fixes exposed by different/faster timing in interaction

- Complete OLT application rewrite

  - Queue based mechanism for subscribers and events
  - Flow installation feedback
  - Better performance and event sequence handling
  - Better code quality and extensibility
  - Fully backwards compatible with VOLTHA 2.8

- Transparent OLT workflow

  - 4096 c-tag translates into no VLAN operation performed at the OLT
  - Support in olt pipeliner in ONOS, olt adapter and agent
  - Full support for TIM HISA workflow

- ONU interaction enhancements in openonu adapter

  - Prioritized OMCI sending
  - Relaxed decoding and storing of unknown MEs
  - PM counter Reset
  - Flow serialization and queueing mechanism

- Move to ONOS 2.5.5 with bug fixes to support ISSU
- Broadcom Abstraction Layer (BAL) has been moved to BAL 3.10.2.2

Bug Fixes
---------

- Proper Cleanup of resources in ETCD and on the ONU after device/flows delete.

- ONU image upgrade

  - multiple ONUs
  - abort during any phase
  - correct indication statuses

- Correct ONU port locking state indication
- Flow deletion operations during reconciliation
- Flow/GemPort deadlock in multi-uni scenarios
- Error reporting from openolt-agent for scheduler and queue configurations
- Error corrections at openolt adapter in case of scheduler and queue confi\guration failures
- OMCI lib-go

  - serialization of Alarms
  - Mib upload next decoding error


Test
----

Voltha-2.9 tests are available on `Jenkins <https://jenkins.opencord.org/>`_.

- Multi-uni and multi-olt tests for openonu adapter suite.
- Extended the ONU software update success and failure test scenarios.
- Extended Turk Telecom multicast tests to 5 tests.
- Container restart tests now include a continuous background ping.
- Added test for updating and validating user bandwidth profile for ATT and DT.
- Enhanced the tests voltha logging.
- Enhanced DT soak pod job with bbsim subscribers provisioning (to mock system load).
- Optimised timeouts for DT and TT workflow tests.
- Added support for subscriber uniTag provisioning for TT test suite.
- ONU delete and re-add.
- Empty device, subscriber and service information verification after deletion.


Design Discussions
------------------

- LAG and LACP
- Voice Support on multi UNI devices
- IPv6 support
- DPU support Design discussion
- New micro-service controller for VOLTHA (onos-classic replacement)
- BBF API integration



Documentation
-------------

- Updated documentation with alarms, meters/bandwidth profiles and several other enhancements
  is published on https://docs.voltha.org

Known Issues
------------

- Edgecore ASxVOLT16 platform issues requiring hard/soft reboot(s). `[VOL-4520] <https://jira.opencord.org/browse/VOL-4520>`_
- Packets arrive on the wrong gem port in the upstream after XGSPON ONU disable/enable. `[VOL-4521] <https://jira.opencord.org/browse/VOL-4521>`_
- Packets arrive on the wrong gem port with Radisys 1600X OLT with BAL 3.10.2.2 `[VOL-4527] <https://jira.opencord.org/browse/VOL-4527>`_
- voltha-onos is based on snapshots due to sonatype issue `[VOL-4528] <https://jira.opencord.org/browse/VOL-4528>`_


Certification Program
---------------------

Thanks to the `Continuous Certification <https://opennetworking.org/continuous-certification-program>`_ program at
ONF we can also ensure that the following ONF member products are compatible with the VOLTHA 2.9 release:

- Edgecore ASGVolt64 GPON OLT
- Edgecore ASXVolt16 XGSGPON OLT
- Radisys 3200G GPON OLT
- Radisys 1600G GPON OLT
- Radisys 1600X COMBO OLT
- Adtran 6320X COMBO OLT
- Sercomm FG1000 GPON ONU
- Sercomm Glasfaser GPON ONU
- Edgecore 6712-32X Switch
- Edgecore 7712-32X Switch

In particular the 2.8 release added the Radisys 3200G GPON OLT.

Jira stories
------------
A full list of stories and bugs completed can be found under the
`VOLTHA 2.9 <https://jira.opencord.org/projects/VOL/versions/12200>`_ release page in Jira.

Component Versions in VOLTHA 2.9 release
----------------------------------------

ONOS and Atomix:
++++++++++++++++

- `ONOS 2.5 LTS <https://github.com/opennetworkinglab/onos/releases/tag/2.5.2>`_: ``2.5.5``
- `ATOMIX <https://github.com/atomix/atomix/releases/tag/atomix-3.1.9>`_: ``3.1.9``

ONOS Apps:
++++++++++

- `aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_: ``2.5.0``
- `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_: ``2.5.0``
- `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_: ``2.4.0``
- `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_: ``2.8.0``
- `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_: ``2.5.0``
- `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_: ``5.5.0``
- `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_: ``5.5.0``
- `bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`_: ``2.2.0``
- `pppoeagent <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/>`_: ``1.2.0``
- `olttopology <https://gerrit.opencord.org/plugins/gitiles/olttopology/>`_: ``1.2.0``

VOLTHA Components:
++++++++++++++++++

- `Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree;h=refs/heads/voltha-2.9>`_ - ``3.0.1``
- `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`_- ``1.9.1`` with `chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_ ``4.5.2``
- `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree;h=refs/heads/voltha-2.9>`_ - ``3.0.2`` with chart ``2.10.9``
- `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree;h=refs/heads/voltha-2.9>`_ - ``2.0.1``  with chart ``2.10.9``
- `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_ - ``1.7.4``
- `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree;h=refs/heads/voltha-2.9>`_ - ``4.1.5`` with chart ``2.10.8``
- `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree;h=refs/heads/voltha-2.9>`_ - ``2.1.2`` with chart ``2.9.11``
- `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree;h=refs/heads/voltha-2.9>`_ -  ``5.0.4`` with chart ``0.1.27``
- `openolt agent <https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree;h=refs/heads/voltha-2.9>`_ - ``3.6.2``
- `voltha-protos <https://github.com/opencord/voltha-protos/releases/tag/v5.1.2>`_ - ``5.1.2``
- `voltha-lib-go <https://github.com/opencord/voltha-lib-go/releases/tag/v7.1.3>`_ - ``7.1.3``
- `Bbsim-sadis-server <https://github.com/opencord/bbsim-sadis-server/releases/tag/v0.3.2>`_ - ``0.3.2`` with chart ``0.2.3``
- `voltha-system-tests <https://github.com/opencord/voltha-system-tests/releases/tag/2.9.0>`_ - ``2.9.0``


Helm Chart Versions:
++++++++++++++++++++
This section refers to the macro charts to deploy the required infrastructure and a (or many) VOLTHA stacks:
- Voltha-infra: ``2.9.12``
- Voltha-stack: ``2.9.15``

BAL Version:
++++++++++++
Broadcom abstraction layer (BAL) version: ``3.10.2.2``.

Openolt Agent packages:
+++++++++++++++++++++++
**EdgeCore**
Get access credentials for https://edgecore.quickconnect.to from Edgecore.
Then login and navigate to ``File_Station`` -> ``EdgecoreNAS``, and then the folder
``/ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/voltha-2.9`` or
``/ASGvOLT64/OpenOLT_Agent/From_ONF_Distribution/voltha-2.9`` based on ``ASXvOLT16`` or ``ASGvOLT64`` platform,
and pick the suitable OLT debian package based on ``BAL 3.10.2.2`` applicable for you.
Please make sure to use the ONL
``/ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ONL-onl-4.14_ONL-OS8_2021-11-26.0058-0de1c30_AMD64_INSTALLED_INSTALLER``
for running ``BAL 3.10.2.2``.

**Radisys**
Please write to `Cameron Lundberg <cameron.lundberg@radisys.com>`_ with `Girish Gowdra <cameron.lundberg@radisys.com>`_
to get the OLT debian package validated on 3200G, 1600x and 1600G platforms for VOLTHA-2.9 release

