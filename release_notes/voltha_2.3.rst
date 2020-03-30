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


Chart version in `voltha-helm-charts <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree;h=refs/heads/voltha-2.3>`_:

- voltha: ``2.3.1`` with containers images:
  - voltha-rw-core: ``2.3.6``
  - voltha-ofagent-go: ``1.1.6``
- voltha-adapter-openolt: ``2.3.0`` with container image:
  - voltha-openolt-adapter: ``2.3.21``
- voltha-adapter-openonu ``2.3.0`` with container image:
  - voltha-openonu-adapter: ``2.3.6``

ONOS: ``2.2.2``, with app versions, packaged as ``voltha-onos`` chart ``3.0.1``
with container image ``4.0.2``

- aaa: ``2.0.2``
- dhcpl2relay: ``2.0.2``
- igmpproxy: ``2.0.0``
- kafka: ``2.2.0``
- mcast: ``2.0.0``
- olt: ``4.0.2``
- sadis: ``5.0.1``

BBSim
  - helm charts: ``3.0.18``
  - container: ``0.1.0``

OpenOLT Agent ``2.3.0`` using ``BAL 3.2.3.2`` SDK
    - openolt_2_3_0_asfvolt16.deb (available from EdgeCore site)
    - | Get access credentials for https://edgecore.quickconnect.to and then login and navigate to File_Station ->
      | EdgecoreNAS, and then the folder /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ and pick the version above

