VOLTHA 2.7 Release Notes
========================

Highlights
----------

The release of VOLTHA-2.7 and ONOS 2.2.8 focused on in-service software upgrade capability and specific improvements
targeted at production deployments.

VOLTHA and ONOS now support in-service minor software upgrades with no impact to the user dataplane. The upgrade
capability has been introduced for all the VOLTHA services: of-agent, rw-core, olt adapter and onu adapter.
Similarly, the ONOS apps - sadis, olt, aaa, kafka, dhcpl2relay, mac-learning, igmpproxy, and mcast - can be upgraded
with no impact to the user. The “minor” software upgrade qualifier refers to an upgrade that does not involve API
changes, which in VOLTHA, refers to a change to the protos or to voltha-lib-go, and in ONOS to a change in the Java
interfaces, CLI commands or REST APIs. Changes to data-structures in storage (etcd for VOLTHA and Atomix for ONOS) are
also out of scope for in-service upgrades. Such changes qualify as “major” software upgrades that typically involve
maintenance windows.

Software upgrade capability has also been introduced for ONU software images. The golang based openonu adapter is
now capable of downloading a new image to the ONU via OMCI and activating it, thereby allowing update of remote
devices at subscriber locations without truck-rolls.

Several new features have been introduced as a result of other needs in production deployments. Performance Metrics
and Alarms capabilities allow the operator to better monitor the status of their network and receive early
notification of possible issues. AES encryption for the GEM ports improves security. The capability to distinguish
between OLT reboot and disconnect prevents service disruption if the olt-adapter and olt-agent temporarily
lose connectivity.

VOLTHA 2.7 also comes with PPPoE intermediate agent support, thanks to extensions in the core and a new ONOS
application which installs trap rules to capture and handle PPPoE packets, allowing for user authentication and
dataplane provisioning. The PPPoE application also provides PPPoE statistics. In addition, an olt-topology application
was also introduced to allow operators to gather OLT peer switch information. Enhancements and bug fixes have been
introduced in the olt, igmpproxy and mcast applications to better support TT multicast at scale.

All the described features, with the exception of the PPPoE and olt-topology apps, come with both a BBSim
implementation and integration tests on hardware and software pods. The robot based integration tests that run
nightly on hardware pods in the ONF infrastructure have now reached over 180+ tests. Preliminary tests have also
been introduced at scale for multicast in the Turk Telekom workflow, and long-term soak tests have been operational
for two weeks at the time of this release in a dedicated hardware soak-pod.

Along with VOLTHA 2.7, the Device Management Brigade also released a new version
(`0.12.0 <https://github.com/opencord/device-management-interface/releases/tag/v0.12.0>`_) of the interface,
which has been implemented on BBSIM and has initial robot test cases. This DMI release introduces specific components,
better error reporting, startup config and logging capabilities.

Features & Improvements
-----------------------

- In service software upgrade with minor versions for VOLTHA components and ONOS apps.

  - ONOS apps api version separated from app version to allow restart
  - OLT pipeliner driver extracted from ONOS.
  - ONU software upgrade capability
- Production requirements in the openonu adapter

  - Performance Metrics
  - Alarms
  - MIB audit and synchronization
  - Reconciliation and in service restart
  - Configurable list of ONU vendors.
  - VEIP ONUs support
- Distinction between OLT channel disconnection and OLT reboot.
- AES encryption for GEM ports
- Integration of the OLT app with the mac learning for TT workflow.
- OLT Topology application to learn about OLT peers
- PPPoE support in VOLTHA stack with Intermediate Agent Application on ONOS
- Flow Error reporting form adapter to the core and to ONOS
- Scale improvements and fixes:

- Validation of TCONT and Gem Port IDs at scale (both via OMCI and flows)
- Igmpproxy, mcast and olt for TT mcast workflow.

Development/Deployment process
------------------------------

- | Introduction of the voltha-infra and voltha-stack helm charts to deploy the across-stack
  | infrastructure and the per stack volta services respectively.

Test
----

Voltha-2.7 tests are available on `Jenkins <https://jenkins.opencord.org/>`_.

- VOLTHA components and ONOS Apps Software Update
- ONU software upgrade test on BBSIM
- Openonu adapter

  - restart and reconciliation tests
  - multi-OLT
  - ETCD data
  - Performance Metrics
- OLT reboot vs disconnect
- TT scale multicast
- Enable/Disable Pon Port
- BBSIM per patchest sanity verification
- Soak tests for 15 days (stable with 515 ONUs)

Design Discussions
------------------

- Minor and Major In Service Software Update
- Storage and High Availability
- MPLS support

Documentation
-------------

- Updated documentation with new voltha-stack and voltha-infra charts and published on https://docs.voltha.org

Known Issues
------------

- | When using in-band mode of management at the OLT, it is observed that the host CPU in-band interface does not get
  | IP sometimes. The Qumran switch drops the DHCP OFFER packets in the downstream (CS00011119237) sometimes.
  | The work around is to reboot the OLT.

Certification Program
---------------------

Thanks to the `Continuous Certification <https://opennetworking.org/continuous-certification-program>`_ program at
ONF we can also ensure that the following ONF member products are compatible with the VOLTHA 2.7 release:

- Edgecore ASGVolt64 GPON OLT
- Edgecore ASXVolt16 XGSGPON OLT
- Sercomm FG1000 GPON ONU
- Sercomm Glasfaser GPON ONU
- Edgecore 6712-32X Switch
- Edgecore 7712-32X Switch

Jira stories
------------
A full list of stories and bugs completed can be found under the
`VOLTHA 2.7 <https://jira.opencord.org/projects/VOL/versions/11900>`_ release page in Jira.

Component Versions in VOLTHA 2.7 release
----------------------------------------

ONOS and Atomix:
++++++++++++++++

- `ONOS 2.2 LTS <https://github.com/opennetworkinglab/onos/releases/tag/2.2.8>`_: ``2.2.8``
- `ATOMIX <https://github.com/atomix/atomix/releases/tag/atomix-3.1.8>`_: ``3.1.8``

ONOS Apps:
++++++++++

- `aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_: ``2.3.0``
- `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_: ``2.4.0``
- `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_: ``2.2.0``
- `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_: ``2.6.0``
- `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_: ``2.3.0``
- `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_: ``4.4.0``
- `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_: ``5.3.0``
- `bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`_: ``2.0.0``
- `pppoeagent <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/>`_: ``1.0.0``
- `olttopology <https://gerrit.opencord.org/plugins/gitiles/olttopology/>`_: ``1.0.3``

VOLTHA Components:
++++++++++++++++++

- `Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree;h=refs/heads/voltha-2.7>`_ - ``2.7.0``
- `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`_- ``1.5.2`` with `chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_ ``4.2.0``
- `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree;h=refs/heads/voltha-2.7>`_ - ``2.7.0`` with chart ``2.8.3``
- `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree;h=refs/heads/voltha-2.7>`_ - ``1.5.2``  with chart ``2.8.3``
- `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_ - ``1.4.4``
- `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree;h=refs/heads/voltha-2.7>`_ - ``3.1.8`` with chart ``2.8.8``
- `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree;h=refs/heads/voltha-2.7>`_ - ``1.2.8`` with chart ``2.7.15``
- `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree;h=refs/heads/voltha-2.7>`_ -  ``4.3.1`` with chart ``0.1.13``
- `openolt agent <https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree;h=refs/heads/voltha-2.7>`_ - ``3.3.3``
- `voltha-protos <https://github.com/opencord/voltha-protos/releases/tag/v4.0.5>`_ - ``4.0.16``
- `voltha-lib-go <https://github.com/opencord/voltha-lib-go/releases/tag/v4.0.3>`_ - ``4.1.1``
- `Bbsim-sadis-server <https://github.com/opencord/bbsim-sadis-server/releases/tag/v0.1.3>`_ - ``0.1.4`` with chart ``0.1.1``
- `kind-voltha <https://gerrit.opencord.org/gitweb?p=kind-voltha.git>`_ -  ``6.1.0``

Helm Chart Versions:
++++++++++++++++++++
This section refers to the macro charts to deploy the required infrastructure and a (or many) VOLTHA stacks:
- Voltha-infra: ``0.1.13``
- Voltha-stack: ``0.1.17``


**Available from EdgeCore site**

- Out of band management

  - ONL version (both GPON and XGSPON) ONL-onl-4.14_ONL-OS8_2020-04-14.1946-72b95a7_AMD64_INSTALLED_INSTALLER available
    at /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution
  - for ASFVOLT16 available, from /ASFvOLT16/OpenOLT_Agent/From_ONF_Distribution/voltha-2.7/OUT-OF-BAND.:

    - ``openolt_asfvolt16-3.3.3-1a5d68b50d8bcc5ba6cb1630d3294c30c37cd2f5-100G-NNI.deb`` if 100G NNI port is used
    - ``openolt_asfvolt16-3.3.3-1a5d68b50d8bcc5ba6cb1630d3294c30c37cd2f5-40G-NNI.deb`` if 40G NNI port is used.

  - for ASGVOLT64 available at /ASGvOLT64/OpenOLT_Agent/From_ONF_Distribution/voltha-2.7/OUT-OF-BAND:

    - ``openolt_asgvolt64-3.3.3-1a5d68b50d8bcc5ba6cb1630d3294c30c37cd2f5-100G-NNI.deb`` if 100G NNI port is used
    - ``openolt_asgvolt64-3.3.3-1a5d68b50d8bcc5ba6cb1630d3294c30c37cd2f5-40G-NNI.deb`` if 40G NNI port is used.

- In band management

  - use ONL image, comprising of Bal and openolt (available from edgecore site) for ASFVOLT16
    ONL-onl-4.14_ONL-OS8_2021-03-19.0322-72b95a7_AMD64_INSTALLED_INSTALLER-40G-NNI,
    available at /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/voltha-2.7/IN-BAND.
    Note that debian package available as part of the ONL support 40G NNI by default.


Get access credentials for https://edgecore.quickconnect.to and then login
and navigate to File_Station -> EdgecoreNAS, and then the folder
/ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ and pick the version above
