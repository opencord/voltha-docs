VOLTHA 2.3 Release Notes
========================

Highlights
----------


Core
----


Development process
-------------------


Testing
-------


Documentation
-------------


Known Issues
------------


Component Versions
------------------

**Helm Charts**

Git repo: `voltha-helm-charts <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree;h=refs/heads/voltha-2.3>`_

voltha ``2.3.1`` with container images:

- voltha-rw-core: ``2.3.6``
- voltha-ofagent-go: ``1.1.6``

voltha-adapter-openolt: ``2.3.0`` with container image voltha-openolt-adapter: ``2.3.21``

voltha-adapter-openonu ``2.3.0`` with container image voltha-openonu-adapter: ``2.3.6``

voltha-onos: ``3.0.1`` using container image ``4.0.2``

bbsim: ``3.0.18`` using container image: ``0.1.0``

**ONOS**

Version: ``2.2.2``

App versions:

- aaa: ``2.0.2``
- dhcpl2relay: ``2.0.2``
- igmpproxy: ``2.0.0``
- kafka: ``2.2.0``
- mcast: ``2.0.0``
- olt: ``4.0.2``
- sadis: ``5.0.1``

**BBSim**

- container: ``0.1.0``

**OpenOLT Agent** ``2.3.0`` using ``BAL 3.2.3.2`` SDK

- ``openolt_2_3_0_asfvolt16.deb`` (available from EdgeCore site)
- Get access credentials for https://edgecore.quickconnect.to and then login
  and navigate to File_Station -> EdgecoreNAS, and then the folder
  /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ and pick the version above
