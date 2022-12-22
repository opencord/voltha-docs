.. figure:: images/voltha.svg
   :alt: voltha- Release Notes
   :width: 40%
   :align: center



VOLTHA 2.11 Release Notes
=========================

Highlights
----------



Features & Improvements
-----------------------



Bug Fixes
---------



Test
----



Design Discussions
------------------



Documentation
-------------

As usual documentation is published on https://docs.voltha.org


Known Issues
------------



Certification Program
---------------------



Jira stories
------------
A full list of stories and bugs completed can be found under the
`VOLTHA 2.11 <https://jira.opencord.org/secure/ReleaseNote.jspa?projectId=10106&version=12300>`_ release page in Jira.

Component Versions in VOLTHA 2.10 release
-----------------------------------------

ONOS and Atomix:
++++++++++++++++

.. csv-table::
   :header: "Component", "Version"
   :widths: 30, 10

   "`ONOS 2.5 LTS <https://github.com/opennetworkinglab/onos/releases/tag/2.5.8>`_", "``2.5.8``"
   "`ATOMIX <https://github.com/atomix/atomix/releases/tag/atomix-3.1.9>`_", "``3.1.9``"

ONOS Apps:
++++++++++

.. csv-table::
   :header: "Component", "Version"
   :widths: 30, 10

   "`aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_", "``2.6.0``"
   "`dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_", "``2.6.0``"
   "`igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_", "``2.5.0``"
   "`kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_", "``2.9.0``"
   "`mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_", "``2.6.0``"
   "`olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_", "``5.1.2``"
   "`sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_", "``5.6.0``"
   "`bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`_", "``2.2.0``"
   "`pppoeagent <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/>`_", "``1.2.0``"
   "`olttopology <https://gerrit.opencord.org/plugins/gitiles/olttopology/>`_", "``1.2.0``"

VOLTHA Components:
++++++++++++++++++

.. csv-table::
   :header: "Component", "Version", "Chart", "Version"
   :widths: 30, 10, 10, 10

   "`Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree>`_", "``3.1.4``", "", ""
   "`bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`_", "``1.12.10``", "`chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_", "``4.8.6``"
   "`Bbsim-sadis-server <https://github.com/opencord/bbsim-sadis-server/releases/tag/v0.3.4>`_", "``0.3.4``", "?", "``0.3.1``"
   "`ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree>`_", "``2.1.2``", "?", "``2.11.3``"
   "`openolt agent <https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree>`_", "``3.7.5``", "?", ""
   "`voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_", "``1.7.6``", "?", ""
   "`voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree>`_", "``3.1.5``", "?", "``2.11.3``"
   "`voltha-lib-go <https://github.com/opencord/voltha-lib-go/releases/tag/v7.1.7>`_", "``7.1.7``", "?", ""
   "`voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree>`_", "``5.1.1``", "?", "``0.1.27``"
   "`voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree>`_", "``4.2.6``", "?", "``2.11.3``"
   "`voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree>`_", "``2.2.8``", "?", "``2.10.3``"
   "`voltha-protos <https://github.com/opencord/voltha-protos/releases/tag/v5.2.5>`_", "``5.2.5``", "?", ""
   "`voltha-system-tests <https://github.com/opencord/voltha-system-tests/releases/tag/2.9.0>`_", "``2.10.1``", "?", ""


Helm Chart Versions:
++++++++++++++++++++
This section refers to the macro charts to deploy the required infrastructure and a (or many) VOLTHA stacks:

.. csv-table::
   :header: "Component", "Version"
   :widths: 30, 10

   "Voltha-infra", "``2.10.7``"
   "Voltha-stack", "``2.10.5``"

BAL Version:
++++++++++++

.. csv-table::
   :header: "Component", "Version"
   :widths: 30, 10

   "Broadcom abstraction layer (BAL)", "``3.10.2.2``"

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
