VOLTHA 2.6 Release Notes
========================

Highlights
----------

The release of VOLTHA-2.6 and ONOS 2.2.7 comes with two major accomplishments.

First, the move of a key VOLTHA component - the openonu adapter - from python to golang, nearly a year long effort,
has come to fruition in this release. The outstanding performance of the new adapter makes it possible to run only a
single instance of the adapter (in a VOLTHA stack) to do the job that took 8 instances of the python version.
The golang version also paves the way for features such as ONU software upgrade to be implemented in upcoming releases.
With this release, we deprecate the python version, which will no longer be supported in future releases.

Second, this release significantly improves the scale of a VOLTHA pod to up to 10k subscribers in steady-state,
where a VOLTHA pod is a collection of VOLTHA stacks interacting with shared infrastructure of ONOS, etcd and Kafka
clusters. This represents a 10X improvement in scale over previous releases for all three operator workflows.
Several factors contributed to the improvement including scale-optimizations in a single VOLTHA stack, streamlining
and parallelization in ONOS apps, the aforementioned move to the golang openonu adapter, as well as changes that
allowed the deployment of multiple VOLTHA stacks to share common infrastructure.

Additional highlights include a new transactional error model between VOLTHA core and adapters, and a move in
the Helm charts for ETCD and KAFKA from incubator to upstream versions from BITNAMI.

Along with VOLTHA 2.6, the Device Management Brigade also released a new version of the interface, which has been
implemented on BBSIM and has initial robot test cases.


Features & Improvements
-----------------------

- OpenONU GO feature complete and used as default
- BBSim Sadis server rewritten in Golang
- Flow replication in the openolt agent instead of the openolt adapter
- Parallelization and scale hardening of ONOS apps (aaa, dhcpl2relay)
- Multiple thread processing and offloading
  - Refactored AAA Statistic names
  - Packet cloning and flow objective ordering in the DhcpL2Relay
  - Per OLT pending queues
  - Use of Option 82 in DHCP to carry around the access-port/vlan of the subscriber.
- Device Management Interface example server on top of BBSim
- Force delete of a device
- Move to upstream charts from BITNAMI for etcd and kafka
- OMCC encryption support
- OLT software upgrade support (in-band mode only)
- Migration to BAL 3.4.9.6


Development/Deployment process
------------------------------

- Multi-stack support in kind-voltha and across the components

Test
----

Voltha-2.6 tests are available on `Jenkins <https://jenkins.opencord.org/view/VOLTHA-2.6/>`_.

- Multi-OLT tests with a single voltha stack on Physical Hardware and BBSim
- Use of the full suite of tests for openonu-go, both on hardware and BBSim
- New specific tests for openonu-go
- | Multi-stack scale tests, up to 10 VOLTHA stacks enabled one at a time on the three workflows for a total of
  | 10240 ONUs supported in a single VOLTHA pod

  - | Maximum of 1k ONUs on a single VOLTHA stack. Tests were performed with 2 OLTs with 512 ONUs each on a single
    | stack, but other combinations are possible, for example 5 OLTs with 200 ONUs each.
  - Scale tests were performed on 3 physical servers (each one 32 cores Intel(R) Xeon(R) CPU D-1587 @ 1.70GHz,
    | 132GB RAM, 120GB SSD) deploying a common infrastructure a 3 node ONOS cluster, a 3 note ETCD cluster and a 3 node
    | kafka with zookeeper cluster and then 10 VOLTHA stacks comprised of of-agent, core, olt and onu adapter.

- Initial Device management interface tests.


Design Discussions
------------------

- PPPoE contribution over VOLTHA (Furukawa)
- MPLS Pseudowire at the OLT (DT)
- Software upgrade (ONF, Ciena, Community)
- Preparation for EPON support (NTT and Furukawa Electric)


Documentation
-------------

- Updated documentation with workflow specific orientation and published on https://docs.voltha.org

Known Issues
------------

- `VOL-3542 <https://jira.opencord.org/browse/VOL-3542>`_: Missing Mib Audit from the new openonu go adapter.
- `VOL-3709 <https://jira.opencord.org/browse/VOL-3709>`_: Scale tests were performed with the etcd incubator charts
- `VOL-3708 <https://jira.opencord.org/browse/VOL-3708>`_: Scale test results do not include multicast in TT workflow
- `VOL-3707 <https://jira.opencord.org/browse/VOL-3707>`_: Support for Multiple instances of the openonu go adapter
- `VOL-3732 <https://jira.opencord.org/browse/VOL-3732>`_: Non-zero pbit traffic dropped in the downstream direction
  in ATT workflow.

Certification Program
---------------------

Thanks to the `Continuous Certification <https://opennetworking.org/continuous-certification-program>`_ program at
ONF we can also ensure that the following devices are compatible with the VOLTHA 2.6 release:
- Edgecore ASGVolt64 GPON OLT
- Edgecore ASXVolt16 XGSGPON OLT
- Sercomm F1000 GPON ONU
- Edgecore 6712-32X Switch
- Edgecore 7712-32X Switch

VOLTHA 2.6 is also tested with other brands, such as Alpha, Iskratel, Tibit but they are not enrolled in the
continuous certification program thus do not appear in the list.


Jira stories
------------
A full list of stories and bugs completed can be found under the
`VOLTHA 2.6 <https://jira.opencord.org/secure/ReleaseNote.jspa?projectId=10106&version=11900>`_ release page in Jira.

Component Versions in VOLTHA 2.6 release
----------------------------------------

ONOS:
++++++++++

- `ONOS 2.2 LTS <https://github.com/opennetworkinglab/onos/releases/tag/2.2.7>`_: ``2.2.7``

ONOS Apps:
++++++++++

- `aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_: ``2.2.0``
- `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_: ``2.3.0``
- `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_: ``2.1.2``
- `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_: ``2.5.0``
- `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_: ``2.1.0``
- `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_: ``4.3.0``
- `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_: ``5.2.0``

VOLTHA Components:
++++++++++++++++++

- `Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree;h=refs/heads/voltha-2.6>`_ - ``2.6.0``
- `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`_- ``1.4.2`` with `chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_ ``4.1.6``
- `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree;h=refs/heads/voltha-2.6>`_ - ``2.6.3`` with chart ``2.7.2``
- `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree;h=refs/heads/voltha-2.6>`_ - ``1.4.2``  with chart ``2.7.2``
- `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_ - ``1.3.1``
- `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree;h=refs/heads/voltha-2.6>`_ - ``3.0.2`` with chart ``2.7.1``
- `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree;h=refs/heads/voltha-2.6>`_ - ``1.0.0`` with chart ``2.6.10``
- `voltha-openonu-adapter <https://github.com/opencord/voltha-openonu-adapter/releases/tag/2.6.0>`_ - ``2.6.0`` with chart ``2.6.10``
- `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree;h=refs/heads/voltha-2.6>`_ -  ``4.2.0`` with chart ``0.1.11``
- `openolt agent <https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree;h=refs/heads/voltha-2.6>`_ - ``3.2.1``
- `voltha-protos <https://github.com/opencord/voltha-protos/releases/tag/v4.0.5>`_ - ``4.0.5``
- `voltha-lib-go <https://github.com/opencord/voltha-lib-go/releases/tag/v4.0.3>`_ - ``4.0.3``
- `pyvoltha <https://github.com/opencord/pyvoltha/releases/tag/2.5.7>`_ - ``2.5.7``
- `Bbsim-sadis-server <https://github.com/opencord/bbsim-sadis-server/releases/tag/v0.1.3>`_ - ``0.1.4`` with chart ``0.0.5``
- `kind-voltha <https://gerrit.opencord.org/gitweb?p=kind-voltha.git>`_ -  ``6.0.0``

**Available from EdgeCore site**

- Out of band management

  - ONL version (both GPON and XGSPON) ONL-onl-4.14_ONL-OS8_2020-04-14.1946-72b95a7_AMD64_INSTALLED_INSTALLER available
    at /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution
  - for ASFVOLT16 available, from /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/voltha-2.6/:

    - ``openolt_asfvolt16-3.2.0-fc10f0d035181d3125ffc6e7a60bf5328fcf5bfa-100G-NNI.deb`` if 100G NNI port is used
    - ``openolt_asfvolt16-3.2.0-fc10f0d035181d3125ffc6e7a60bf5328fcf5bfa-40G-NNI.deb`` if 40G NNI port is used.

  - for ASGVOLT64 available at /ASGvOLT64/OpenOLT_Agent/From_ONF_Distribution/voltha-2.6:

    - ``openolt_asgvolt64-3.2.0-fc10f0d035181d3125ffc6e7a60bf5328fcf5bfa-100G-NNI.deb`` if 100G NNI port is used
    - ``openolt_asgvolt64-3.2.0-fc10f0d035181d3125ffc6e7a60bf5328fcf5bfa-40G-NNI.deb`` if 40G NNI port is used.

- In band management

  - use ONL image, comprising of Bal and openolt (available from edgecore site) for ASFVOLT16
    ONL-onl-4.14_ONL-OS8_2020-11-22.1509-72b95a7_AMD64_INSTALLED_INSTALLER-40G-NNI,
    available at /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/voltha-2.6/IN-BAND.
    Note that debian package available as part of the ONL support 40G NNI by default.


Get access credentials for https://edgecore.quickconnect.to and then login
and navigate to File_Station -> EdgecoreNAS, and then the folder
/ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ and pick the version above
