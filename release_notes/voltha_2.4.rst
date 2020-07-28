VOLTHA 2.4 Release Notes
========================

Highlights
----------

VOLTHA 2.4 together with ONOS 2.2.3 is the first release with full support for
all 3 operator workflows - AT&T’s 1 TCONT- 4 GEMs, Deutsche Telekom’s  FTTH 1
TCONT- 8 GEMs, and Turk Telekom’s  Multi-TCONT triple-play workflows. Also,
for the first time, this release supports whitebox GPON OLTs and in-band management
of remotely-located OLTs. It improves on performance and scale, achieving the
MVP 1.0 requirements for production deployments of 2 OLTs with 500 ONUs each for
the AT&T and DT workflows. The release also expands on automated-tests,
with over 100+ tests run nightly in regression testing jobs across 3 hardware pods,
delivering improved stability and robustness. VOLTHA 2.4 also comes on top of
up-to-date versions of key infrastructure components such as HELM 3 and Kubernetes 1.18.


Features & Improvements
-----------------------

- Full support for Turk Telekom triple play workflow with HSIA, Multicast IPTV, VoIP and VoD using T-CONTS per service.
  Two new ONOS apps introduced - igmp-proxy and mcast
- Support for multiple OLTs in a single-VOLTHA stack.
- Support for GPON OLTs, specifically EdgeCore’s ASGvOLT64 OLT
- Support for ONOS controller clustering (typically with 3 ONOS instances and 3 Atomix instances) for scale and high
  availability. All 7 ONOS applications used with VOLTHA upgraded to work in a clustered setting.
- Support for multiple ONU adaptor instances for scaling out (internal to a VOLTHA stack)
- Support for In-band Management of OLTs
- BAL transitioned from version 3.2.3.2 to version 3.4.3.3 with several bug fixes
- Full DT and ATT workflow support on BBSIM simulator for scale testing
- Scale improvements to meet MVP 1 targets of 2 OLTs with 500 ONUs each for both DT and ATT workflows,
  including several improvements to VOLTHA core data models.
- Enhanced Meter handling for Bandwidth profile support.
- Enhanced Group handling and cleanup.

Development process
-------------------

- Update to Kubernetes 1.18.5
- Update to Helm3 of all the charts and deployment tools.

Testing
-------

- Integration Tests

  - Automated tests run on both hardware and BBSim platforms, please use the VOLTHA-2.4 view under https://jenkins.opencord.org/
  - Sanity test on hardware for TT workflow
  - In Band Management of OLT on one of the ONF Menlo testing pods
  - GPON OLT test job in Berlin pod

- Scale Tests

  - Met required scale measurements with 2 OLTs and 500 ONUs each for both ATT and DT workflows

Documentation
-------------

- Updated documentation with workflow specific orientation and published on https://docs.voltha.org

Known Issues
------------

- [VOL-3376]  Data rate error margin beyond allowed limit
- [VOL-3377]  In-band interface does not get an IP address from DHCP sometimes due to an issue in BAL.
  Workaround automatically reboots the OLT.
- [VOL-3125]  Bandwidth profile not enforced with BAL 3.4.3.3.
- [VOL-3241] Scale measurements require the use of etcd in-memory

Component Versions
------------------

`Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree;h=refs/heads/voltha-2.4>`_

voltha ``2.5.5`` with container images:

- `voltha-rw-core <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree;h=refs/heads/voltha-2.4>`_: ``2.4.4``
- `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree;h=refs/heads/voltha-2.4>`_: ``1.2.6``

voltha-adapter-openolt: ``2.5.8`` with container image `voltha-openolt-adapter
<https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree;h=refs/heads/voltha-2.4>`_:
``2.4.13``

voltha-adapter-openonu ``2.4.6`` with container image `voltha-openonu-adapter
<https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter.git;a=tree;h=refs/heads/voltha-2.4>`_:
``2.4.8``

`voltha-onos
<https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree;h=refs/heads/voltha-2.4>`_:
`onos chart
<https://github.com/onosproject/onos-helm-charts/tree/master/onos-classic>`_
``0.1.1`` using container image ``4.1.3``

`ONOS <https://gerrit.onosproject.org/plugins/gitiles/onos>`_: ``2.2.3``

ONOS App versions:

- `aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_: ``2.1.0``
- `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_: ``2.1.0``
- `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_: ``2.1.2``
- `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_: ``2.3.1``
- `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_: ``2.1.0``
- `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_: ``4.1.2``
- `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_: ``5.1.0``

`bbsim
<https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree;h=refs/heads/voltha-2.4>`_:
`bbsim chart
<https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_
``3.1.0`` using container image: ``0.2.6``

`OpenOLT Agent
<https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree;h=refs/heads/voltha-2.4>`_
``2.4.9`` using ``BAL 3.4.3.3`` SDK

**Available from EdgeCore site**

- Out of band management

  - ONL version (both GPON and XGSPON) ONL-onl-4.14_ONL-OS8_2020-04-14.1946-72b95a7_AMD64_INSTALLED_INSTALLER
  - ``openolt_asfvolt16-2.4.9-dev-d4aeca5a2094f7dc7c519913ab1558348c546dab.deb`` for ASFVOLT16
  - ``openolt_asgvolt64-2.4.9-dev-d4aeca5a2094f7dc7c519913ab1558348c546dab.deb`` for ASGVOLT64

- In band management

  - use ONL image, comprising of Bal and openolt (available from edgecore site)
    for ASFVOLT16 ``ONL-onl-4.14_ONL-OS8_2020-07-24.2214-72b95a7_AMD64_INSTALLED_INSTALLER``

Get access credentials for https://edgecore.quickconnect.to and then login
and navigate to File_Station -> EdgecoreNAS, and then the folder
/ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ and pick the version above

A full list of Jira tickets releated to the VOLTHA 2.4 release is available
`here <https://docs.google.com/document/d/1BolYA52uJ0LVJkYz5SYPWdWamkt4J3yP6CLhH7FNjBg/edit?usp=sharing>`_ .
