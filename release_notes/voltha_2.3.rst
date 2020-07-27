VOLTHA 2.3 Release Notes
========================

Highlights
----------

With the release of VOLTHA 2.3 and ONOS 2.2.2, the SEBA Surge effort from Oct1,
2019 to March 31st 2020 comes to an end. Highlights of this release include
performance and scale improvements, substantially expanded automated-tests,
improved stability and robustness, and better support for the Deutsche Telekom
(DT) FTTH and Turk Telekom (TT) workflows.

Features & Improvements
-----------------------

- VOLTHA support moves from ONOS 1.13.9 to ONOS 2.2 (LTS branch); all ONOS apps
  migrated to ONOS 2.2.x .

- EdegCore OLT (and openolt-agent) moves from BAL 3.1 to BAL 3.2.3.2 with many
  bug fixes and improved scale; in particular we now support multiple-GEM ports
  reliably, for example 1 TCONT, 4 GEMs in AT&T workflow and 1 TCONT, 8 GEMs in
  DT FTTH workflow.

- ONOS olt, sadis and other apps upgraded to simultaneously support AT&T, DT
  and TT workflows (together with related changes in VOLTHA).

- Log levels are changeable on many VOLTHA components at runtime.

- OMCI MIB templating implemented to reduce the number of OMCI messages for
  known ONU types in order to improve openonu-adaptor scale.

- Several scale improvements in voltha-rw-core including flow-decomposer route
  calculations and core-to-adaptor transaction lifecycles.

- OMCI MIB external (etcd) storage support implemented in the ONU adapter to
  enable restart/reconcile and improve performance.

- Container readiness and health checks were implemented.

- Openflow agent (ofagent) rewritten in Golang.

- Support for ANY_VLAN (4096) for DT workflow.

- Several features added to support hardware-reboot and software-restarts.

- ONOS-FCAPS support added for igmp and multicast (and related BBSim changes).

- VOLTHA-pod management preliminary support for Redfish APIs added.

- VOLTHA FCAPS: Added additional alarm types, dynamic log configuration, and
  On-Demand API for ONU Self-Test.

Development process
-------------------

- voltha-lib-go turned into a shared library, separated from voltha-go

- Golang tooling has been containerized for easier development and version
  maintenance

- Kafka events can be viewed from voltctl

- Updated to Python 3 within components and supporting tools


Testing
-------

- `Unit tests coverage
  <https://jenkins.opencord.org/view/VOLTHA%202.x%20verify>`_ greatly improved

- Integration Tests

  - `Automated tests run on both hardware and BBSim platforms
    <https://jenkins.opencord.org/>`_

    - Functional Tests (ATT)
    - All Container Restart/Failure scenarios (ATT)
    - Validation checks for Error Scenarios
    - Beginning of functional tests for DT WorkFlow

- `Community pods <https://jenkins.opencord.org/view/Community-PODs/>`_ at DT
  (Berlin) with GPON and XGSPON OLTs, and Infosys with XGSPON OLT, were set up

- Scale Tests

  - `Automated scale tests implemented with BBSim
    <https://jenkins.opencord.org/view/voltha-scale-measurements/>`_
  - Scale test procedure standardized and documented.

Documentation
-------------

- Versioned documentation now published on `<https://docs.voltha.org>`_
- Robot Test resource documentation is automatically generated and published.

Known Issues
------------

**All of the issues listed below are expected to be supported in VOLTHA 2.4
release.**

- This release does not support multiple-OLTs, which is targeted for the next
  release. In the meantime, please use ‘master’ for multiple-OLT support.

- This release does not support multicast and multi-TCONT based workflows,
  although substantial additions were made.

- This release does not support multiple-ONU-adaptors, although several
  features like multiple onu-adaptor registration and kafka topics per
  onu-adaptor have been added to master.

- This release does not officially support GPON. Although the feature exists,
  it has not been tested completely.

- This release does not officially support ONOS clustering for HA. Although
  several features were added to make ONOS apps work in clustered mode, as well
  as ofagent-go to work with an ONOS cluster, it has not been tested
  completely.

- This release does not distinguish between an OLT reboot and a temporary
  disconnection between voltha and the OLT hardware - both cases are treated as
  OLT reboot.

- This release does not support disable of an OLT followed by a re-enable. The
  only operation supported after OLT-disable is OLT-delete.

Component Versions
------------------

`Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree;h=refs/heads/voltha-2.3>`_

voltha ``2.3.2`` with container images:

- `voltha-rw-core <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree;h=refs/heads/voltha-2.3>`_: ``2.3.6``
- `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree;h=refs/heads/voltha-2.3>`_: ``1.1.7``

voltha-adapter-openolt: ``2.3.2`` with container image `voltha-openolt-adapter
<https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree;h=refs/heads/voltha-2.3>`_:
``2.3.23``

voltha-adapter-openonu ``2.3.0`` with container image `voltha-openonu-adapter
<https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter.git;a=tree;h=refs/heads/voltha-2.3>`_:
``2.3.6``

`voltha-onos
<https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree;h=refs/heads/voltha-2.3>`_:
`onos chart
<https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=onos>`_
``3.0.1`` using container image ``4.0.2``

ONOS App versions:

- `aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_: ``2.0.2``
- `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_: ``2.0.2``
- `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_: ``2.0.0``
- `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_: ``2.2.0``
- `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_: ``2.0.0``
- `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_: ``4.0.2``
- `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_: ``5.0.1``

`bbsim
<https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree;h=refs/heads/voltha-2.3>`_:
`bbsim chart
<https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_
``3.0.18`` using container image: ``0.1.0``

`OpenOLT Agent
<https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree;h=refs/heads/voltha-2.3>`_
``2.3.0`` using ``BAL 3.2.3.2`` SDK

- ``openolt_2_3_0_asfvolt16.deb`` (available from EdgeCore site)
- Get access credentials for https://edgecore.quickconnect.to and then login
  and navigate to File_Station -> EdgecoreNAS, and then the folder
  /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ and pick the version above



