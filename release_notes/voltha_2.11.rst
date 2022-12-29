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

Component Versions in VOLTHA 2.11 release
-----------------------------------------

ONOS and Atomix
+++++++++++++++

.. list-table:: ONOS and Atomix
   :widths: 30, 5, 5, 5, 5, 5
   :header-rows: 2

   * - Component
     - VOLTHA
     - Component
     - with
     - Gerrit
     - Github
   * - Name
     - Version
     - Version
     - Chart
     - URL
     - URL
   * -
     -
     -
     -
     -
     -
   * - `ONOS 2.5 LTS <https://github.com/opennetworkinglab/onos/releases/tag/2.5.8>`_
     -
     - ``2.5.8``
     -
     -
     -
   * - `ATOMIX <https://github.com/atomix/atomix/releases/tag/atomix-3.1.9>`_
     -
     - ``3.1.9``
     -
     -
     -

ONOS Apps
+++++++++

.. list-table:: ONOS Apps
   :widths: 30, 5, 5, 5, 5, 5
   :header-rows: 2

   * - Component
     - VOLTHA
     - Component
     - with
     - Gerrit
     - Github
   * - Name
     - Version
     - Version
     - Chart
     - URL
     - URL
   * -
     -
     -
     -
     -
     -
   * - `aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_
     -
     - ``2.6.0``
     -
     -
     -
   * - `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_
     -
     - ``2.6.0``
     -
     -
     -
   * - `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_
     -
     - ``2.5.0``
     -
     -
     -
   * - `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_
     -
     - ``2.9.0``
     -
     -
     -
   * - `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_
     -
     - ``2.6.0``
     -
     -
     -
   * - `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_
     -
     - ``5.1.2``
     -
     -
     -
   * - `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_
     -
     - ``5.6.0``
     -
     -
     -
   * - `bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`_
     -
     - ``2.2.0``
     -
     -
     -
   * - `pppoeagent <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/>`_
     -
     - ``1.2.0``
     -
     -
     -
   * - `olttopology <https://gerrit.opencord.org/plugins/gitiles/olttopology/>`_
     -
     - ``1.2.0``
     -
     -
     -

VOLTHA Components
+++++++++++++++++

.. list-table:: VOLTHA Components
   :widths: 30, 5, 5, 5, 5, 5
   :header-rows: 2

   * - Component
     - VOLTHA
     - Component
     -
     - Gerrit
     - Github
   * - Name
     - Version
     - Version
     - with Chart
     - URL
     - URL
   * -
     -
     -
     -
     -
     -
   * - `Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree>`_
     - ``3.2.1-dev1``
     -
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master>`__
     - `X <https://github.com/opencord/voltha-helm-charts/tree/3.2.0>`__
   * - `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`_
     - ``1.14.4``
     - ``4.8.6``
     - `chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-openolt-adapter/+/refs/tags/v4.2.10>`__
     - `X <https://github.com/opencord/bbsim/tree/v1.14.4>`__
   * - `Bbsim-sadis-server <https://gerrit.opencord.org/gitweb?p=bbsim-sadis-server.git;a=tree>`_
     -
     - ``0.3.4``
     -
     -
     - `X <https://github.com/opencord/bbsim-sadis-server/releases/tag/v0.3.4>`__
   * - `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree>`_
     - ``2.11.3``
     - ``2.1.2``
     -
     -
     - `X <https://github.com/opencord/ofagent-go>`__
   * - `openolt agent <https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree>`_
     -
     - ``3.7.5``
     -
     -
     - `X <https://github.com/opencord/openolt>`__
   * - `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_
     - ``1.8.3``
     -
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltctl/+/refs/tags/v1.8.3>`__
     - `X <https://github.com/opencord/voltctl/tree/v1.8.3>`__
   * - `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree>`_
     - ``3.1.7``
     -
     - ``2.11.3``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-go/+/refs/tags/v3.1.7>`__
     - `X <https://github.com/opencord/voltha-go/tree/v3.1.7>`__
   * - `voltha-lib-go <https://gerrit.opencord.org/gitweb?p=voltha-lib-go.git;a=tree>`_
     - ``2.11.3``
     - ``7.3.1``
     -
     -
     - `X <https://github.com/opencord/voltha-lib-go/releases/tag/v7.3.1>`__
   * - `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree>`_
     -
     - ``5.1.2``
     - ``0.1.27``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-onos/+/refs/tags/5.1.2>`__
     - `X <https://github.com/opencord/voltha-onos/tree/5.1.2>`__
   * - `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree>`_
     - ``2.7.2``
     - ``2.10.3``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-openonu-adapter-go/+/refs/tags/v2.7.2>`__
     - `X <https://github.com/opencord/voltha-openonu-adapter-go/tree/v2.7.2>`__
   * - `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree>`_
     - ``master: v4.2.11``
     - ``4.2.6``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-openolt-adapter/+/refs/tags/v4.2.10>`__
     - `X <https://github.com/opencord/voltha-openolt-adapter/tree/v4.2.11>`__
   * - `voltha-protos <https://github.com/opencord/voltha-protos/releases/tag/v5.2.5>`__
     - ``master: 5.3.6``
     - ``5.3.6``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/tags/v5.3.6>`__
     - `X <https://github.com/opencord/voltha-protos/tree/v5.3.6>`__
   * - `voltha-system-tests <https://github.com/opencord/voltha-system-tests/releases/tag/2.9.0>`_
     - ``2.11.10``
     -
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-system-tests/+/refs/tags/2.11.10>`__
     - `X <https://github.com/opencord/voltha-system-tests/tree/2.11.10>`__

Helm Chart Versions
+++++++++++++++++++
This section refers to the macro charts to deploy the required infrastructure and a (or many) VOLTHA stacks:

.. list-table:: Helm Chart Versions
   :widths: 30, 5, 5, 5, 5, 5
   :header-rows: 2

   * - Component
     - VOLTHA
     - Component
     -
     - Gerrit
     - Github
   * - Name
     - Version
     - Version
     - with Chart
     - URL
     - URL
   * -
     -
     -
     -
     -
     -
   * - Voltha-infra
     - ``2.10.7``
     -
     -
     -
     -
   * - Voltha-stack
     - ``2.10.5``
     -
     -
     -
     -

BAL Version
+++++++++++

.. list-table:: Helm Chart Versions
   :widths: 30, 5, 5, 5, 5, 5
   :header-rows: 2

   * - Component
     - VOLTHA
     - Component
     -
     - Gerrit
     - Github
   * - Name
     - Version
     - Version
     - with Chart
     - URL
     - URL
   * -
     -
     -
     -
     -
     -
   * - Broadcom abstraction layer (BAL)
     -
     - ``3.10.2.2``
     -
     -
     -

Openolt Agent packages:
+++++++++++++++++++++++
**EdgeCore**
Get access credentials for https://edgecore.quickconnect.to from Edgecore.
Then login and navigate to ``File_Station`` -> ``EdgecoreNAS``, and then the folder
``/ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/voltha-2.11`` or
``/ASGvOLT64/OpenOLT_Agent/From_ONF_Distribution/voltha-2.11`` based on ``ASXvOLT16`` or ``ASGvOLT64`` platform,
and pick the suitable OLT debian package based on ``BAL 3.10.2.2`` applicable for you.
Please make sure to use the ONL
``/ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ONL-onl-4.14_ONL-OS8_2021-11-26.0058-0de1c30_AMD64_INSTALLED_INSTALLER``
for running ``BAL 3.10.2.2``.

**Radisys**
Please write to `Cameron Lundberg <cameron.lundberg@radisys.com>`_
to get the OLT debian package validated on 3200G, 1600x and 1600G platforms for VOLTHA-2.11 release

**Zyxel**
Please write to `Emanuel Villalobos <Emanuel.Villalobos@zyxel.com.tw>`_
to get the OLT debian package validated on the SDA3016SS for VOLTHA-2.11 release.
