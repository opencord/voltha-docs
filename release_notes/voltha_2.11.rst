.. figure:: images/voltha.svg
   :alt: voltha- Release Notes
   :width: 40%
   :align: center


VOLTHA 2.11 Release Notes
=========================

Highlights
----------
VOLTHA-2.11 builds on the 2.10 release for VOLTHA. It is the second LTS release after VOLTHA 2.8. During this release, automated operator tests are reconfigured after the relocation of some test pods. CI/CD scripts are revisited for better visibility of job steps and failures. ONU OMCI counters enabled on CLI for better debugging of the system. OMCI extended message support in openonu-adapter has been enhanced to be used in alarm and PM (Performance Management) data retrievals.
The Broadband Forum(BBF) models have been extended to align with VOLTHA interfaces and implemented in an adapter layer at the northbound of VOLTHA. The POC work on Broadband Forum integration is demonstrated in the `NetworkX event <https://networkxevent.com/>`_ in Amsterdam in October `2022 <https://networkxevent.com/agenda/>`_.  New robustness tests have also been introduced to exercise corner cases  in openonu-adapter as well as the tests for OMCI extended message support.


Features & Improvements
-----------------------

- OMCI extended message support.

  - Support alarm data retrieval.
  - Support PM data retrieval.

- Configure encryption ring on XGS PON:

  - Configure the GEM Encryption Key Ring with the values defined in `G.988 <https://www.itu.int/rec/T-REC-G.988/en>`_.

  - Use the value in XGS_PON tech profile definition.

- ONU OMCI counter retrieval via `voltctl <https://github.com/opencord/voltctl>`__:

  - Number of TX/RX-frames (separated for baseline and extended format):
  - TX AR=1, RX AK=1, TX AR=0, RX AK=0 (AR: Acknowledge Request, AK: Acknowledgement).
  - Number of repeated TX-frames due to missing answer.
  - Number of TX-frames running into timeout (even after repetition).

- OMCI extended message support in BBSIM:

  - support alarm data retrieval.


Bug Fixes
---------
- Error in handling multiple ONU Discovery indications.
- ONUs are now discoverable after multiple OLT reboots.
- Panic in openonu-adapter during scale test, due to permanently disrupted OMCI communication.
- Proper resource initialization for individual failed PON ports.
- Avoid ONUs being set to unreachable after multiple unsuccessful OMCI communication attempts.
- Panic during serialization of extended GetAllAlarmsNextResponse.


Test
----

- Robustness Tests

  - Verify  ONU power-off during flow configuration.
  - Verification/correlation of ONU capabilities against configuration requirements Priority Queues
  - Verification/correlation of ONU capabilities against configuration requirements TConts
  - Test for detecting potential memory leaks
  - Test for ONU Model display via voltctl

- OMCI Extended Message Tests

  - Test verify SW upgrade
  - Test verify  MIB upload


Documentation
-------------

As usual documentation is published on https://docs.voltha.org


Known Issues
------------
.. list-table:: Known Issues
   :widths: 10, 40
   :header-rows: 1

   * - Jira
     - Description
   * - `VOL-4521 <https://jira.opencord.org/browse/VOL-4521>`_
     - Packets arrive on the wrong gem port in the upstream after XGSPON ONU disable/enable.
   * - `VOL-4698 <https://jira.opencord.org/browse/VOL-4698>`_
     - Device actual state not visible during device deletion.
   * - `VOL-4747 <https://jira.opencord.org/browse/VOL-4747>`_
     - Flows stuck in pending-add when subscriber is provisioned after open-olt-adapter pod restart.


Certification Program
---------------------

Thanks to the Continuous Certification program at ONF we can also ensure
that the following ONF member products are compatible with the VOLTHA 2.11
release:

- Edgecore ASGVolt64 GPON OLT
- Radisys 3200G GPON OLT
- Radisys 1600G GPON OLT
- Zyxel SDA3016SS Combo OLT


Jira stories
------------
A full list of stories and bugs completed can be found under the
`VOLTHA 2.11 <https://jira.opencord.org/projects/VOL/versions/12500>`_ (`formatted <https://jira.opencord.org/secure/ReleaseNote.jspa?projectId=10106&version=12500>`_) release page in Jira.

|

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
     - N/A
     - ``2.9.0``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/aaa/+/refs/tags/2.9.0>`__
     - `X <https://github.com/opencord/aaa/tree/2.9.0>`__
   * - `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_
     -
     - ``2.9.0``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/dhcpl2relay/+/refs/tags/2.9.0>`__
     - `X <https://github.com/opencord/dhcpl2relay/tree/2.9.0>`__
   * - `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_
     -
     - ``2.7.0``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/igmpproxy/+/refs/tags/2.7.0>`__
     - `X <https://github.com/opencord/igmpproxy/tree/2.7.0>`__
   * - `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_
     -
     - ``2.11.1``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/kafka-onos/+/refs/tags/2.11.1>`__
     - `X <https://github.com/opencord/kafka-onos/tree/2.11.1>`__
   * - `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_
     -
     - ``2.8.0``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/mcast/+/refs/tags/2.8.0>`__
     - `X <https://github.com/opencord/mcast/tree/2.8.0>`__
   * - `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_
     -
     - ``5.2.3``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/olt/+/refs/tags/5.2.3>`__
     - `X <https://github.com/opencord/olt/tree/5.2.3>`__
   * - `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_
     -
     - ``5.10.0``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/sadis/+/refs/tags/5.10.0>`__
     - `X <https://github.com/opencord/sadis/tree/5.10.0>`__
   * - `bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`_
     -
     - ``2.4.0``
     -
     - `X <https://github.com/opencord/bng/tree/2.4.0>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/bng/+/refs/tags/2.4.0>`__
   * - `pppoeagent <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/>`_
     -
     - ``1.2.0``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/+/refs/tags/1.2.1>`__
     - `X <https://github.com/opencord/pppoeagent/tree/1.2.1>`__
   * - `olttopology <https://gerrit.opencord.org/plugins/gitiles/olttopology/>`_
     -
     - ``1.2.0`` ``latest: 1.2.1``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/olttopology/+/refs/tags/1.2.1>`__
     - `X <https://github.com/opencord/olttopology/tree/1.2.1>`__

VOLTHA Components
+++++++++++++++++

.. list-table:: VOLTHA Components
   :widths: 30, 5, 5, 5, 5, 5, 5
   :header-rows: 2

   * - Component
     - VOLTHA
     - Component
     -
     - Gerrit
     - Github
     - `Docker <https://hub.docker.com/search?q=voltha>`_
   * - Name
     - Version
     - Version
     - `with Chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_
     - URL
     - URL
     - URL
   * -
     -
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
     -
   * - `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`__
     - ``1.14.4``
     - ``4.8.6``
     - `chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-openolt-adapter/+/refs/tags/v4.2.10>`__
     - `X <https://github.com/opencord/bbsim/tree/v1.14.4>`__
     - `X <https://hub.docker.com/layers/voltha/bbsim/1.14.4/images/sha256-c23de193c1d7cf8d32c48edfbec4bfa6c47dbeecd4b31d040da0255eeab2ec58?context=explore>`__
   * - `Bbsim-sadis-server <https://gerrit.opencord.org/gitweb?p=bbsim-sadis-server.git;a=tree>`_
     -
     - ``0.3.4``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/bbsim-sadis-server/+/refs/tags/v0.3.4>`_
     - `X <https://github.com/opencord/bbsim-sadis-server/releases/tag/v0.3.4>`__
     -
   * - `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree>`_
     - ``2.1.2``
     - ``2.1.2``
     - ``2.11.3``
     -
     - `X <https://github.com/opencord/ofagent-go>`__
     - `1.1.4-? <https://hub.docker.com/layers/voltha/ofagent-go/1.1.4/images/sha256-8231111b69c8643c4981d64abff0a85d71f80763bb98632bb101e92b89882647?context=explore>`_
   * - `openolt agent <https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree>`_
     -
     - ``3.7.5``
     -
     -
     - `X <https://github.com/opencord/openolt>`__
     -
   * - `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_
     - ``1.8.3``
     -
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltctl/+/refs/tags/v1.8.3>`__
     - `X <https://github.com/opencord/voltctl/tree/v1.8.3>`__
     -
   * - `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree>`_
     - ``3.1.8``
     - `docker <https://jenkins.opencord.org/job/docker-publish_voltha-go/464/console>`__
     - ``2.11.3``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-go/+/refs/tags/v3.1.8>`__
     - `X <https://github.com/opencord/voltha-go/tree/v3.1.8>`__
     -
   * - `voltha-lib-go <https://gerrit.opencord.org/plugins/gitiles/voltha-lib-go>`_
     - ``2.11.3 (?)``
     - ``7.3.2``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-lib-go/+/refs/tags/v7.3.2>`__
     - `X <https://github.com/opencord/voltha-lib-go/releases/tag/v7.3.2>`__
     -
   * - `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree>`_
     -
     - ``5.1.2``
     - ``0.1.27``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-onos/+/refs/tags/5.1.3>`__
     - `X <https://github.com/opencord/voltha-onos/tree/5.1.3>`__
     - `X <https://hub.docker.com/layers/voltha/voltha-onos/5.1.3/images/sha256-d9c686acf177ed823ff359dc43ba59aab05ae067be27c92e48c08b72f94b9ca3?context=explore>`__
   * - `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree>`_
     -
     - ``2.7.3``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-openonu-adapter-go/+/refs/tags/v2.7.3>`__
     - `X <https://github.com/opencord/voltha-openonu-adapter-go/tree/v2.7.3>`__
     - `X <https://hub.docker.com/layers/voltha/voltha-openonu-adapter-go/2.7.3/images/sha256-e9484a8963d08748af5766a6a8ce7f7485efb384488bcf93840ecc1142d7ad74?context=explore>`__
   * - `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree>`_
     - ``v4.2.12``
     - ``4.2.6``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-openolt-adapter/+/refs/tags/v4.2.12>`__
     - `X <https://github.com/opencord/voltha-openolt-adapter/tree/v4.2.12>`__
     - `X <https://hub.docker.com/layers/voltha/voltha-openolt-adapter/4.2.12/images/sha256-844eac272323dc8bca10880a111957a95839578b3210dd777be5ac9370aaa52e?context=explore>`__
   * - `voltha-protos <https://gerrit.opencord.org/plugins/gitiles/voltha-protos>`_
     -
     - `5.3.8 <https://pypi.org/project/voltha-protos/5.3.8>`__
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/tags/v5.3.8>`__
     - `X <https://github.com/opencord/voltha-protos/tree/v5.3.8>`__
     -
   * - `voltha-system-tests <https://github.com/opencord/voltha-system-tests/releases/tag/2.9.0>`__
     - ``2.11.10``
     -
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-system-tests/+/refs/tags/2.11.10>`__
     - `X <https://github.com/opencord/voltha-system-tests/tree/2.11.10>`__
     -
   * - maclearner
     - ``1.2.1``
     -
     -
     -
     -
     -
   * - ppoeagent
     - ``1.2.1``
     -
     -
     -
     -
     -
   * - segmentrouting
     - ``3.0.0``
     -
     -
     -
     -
     -


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
     - ``2.10.10``
     -
     -
     -
     -
   * - Voltha-stack
     - ``2.10.10``
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

|

Get Involved
------------
We'd love to accept your patches and contributions to the VOLTHA project, join the community!

| Here are a few resources to get you started:


Index/Entry points
++++++++++++++++++

  - `https://docs.voltha.org <https://docs.voltha.org/master/index.html>`_
  - `Getting Started <https://docs.voltha.org/master/overview/contributing.html>`_

HOWTO
+++++

  - `Code, Documentation, Makefiles <https://docs.voltha.org/master/howto/index.html>`_
  - `Setup a test pod <https://docs.voltha.org/master/overview/lab_setup.html>`_
  - `Troubleshooting <https://docs.voltha.org/master/overview/troubleshooting.html>`_

Testing
+++++++

  - `Automation <https://docs.voltha.org/master/testing/voltha_test_automation.html>`_
  - `Robot testing harness <https://docs.voltha.org/master/testing/index.html>`_
  - `voltha-system-tests <https://docs.voltha.org/master/voltha-system-tests/README.html>`_

CLI Tools
+++++++++

  - `BBSIM <https://docs.voltha.org/master/bbsim/docs/source/index.html>`__
  - `voltctl <https://docs.voltha.org/master/voltctl/README.html?highlight=voltctl>`__

|
