.. figure:: images/voltha.svg
   :alt: voltha- Release Notes
   :width: 40%
   :align: center


VOLTHA 2.12 Release Notes
=========================

Highlights
----------

Features & Improvements
-----------------------

.. list-table:: Features & Improvements
   :widths: 10, 60
   :header-rows: 1

   * - Jira
     - Description
   * - | `VOL-4444 <https://jira.opencord.org/browse/VOL-4444>`_
       | `VOL-4340 <https://jira.opencord.org/browse/VOL-4340>`_
     - Create API for profile in voltha rw-core for profile operations
   * - `VOL-4782 <https://jira.opencord.org/browse/VOL-4782>`_
     - Enchance DMI to include DataValueType in Events and also clarification for Transceiver Events
   * - `VOL-4783 <https://jira.opencord.org/browse/VOL-4783>`_
     - Introduce UploadDebugInformation RPC in DMI
   * - `VOL-4788 <https://jira.opencord.org/browse/VOL-4788>`_
     - Create package in voltha-libs-go for support of prometheus counters in voltha
   * - `VOL-4877 <https://jira.opencord.org/browse/VOL-4877>`_
     - Enhance DMI interface to be able to retrieve the Tx Power on the Transceivers
   * - `VOL-4878 <https://jira.opencord.org/browse/VOL-4878>`_
     - Improve the voltha-protos extensions interface to get the Rx Power levels from an OLT
   * - `VOL-4949 <https://jira.opencord.org/browse/VOL-4949>`_
     - Introduce DEVICE_BUSY reason in the UploadDebugInfoStatus DMI message
   * - `VOL-4952 <https://jira.opencord.org/browse/VOL-4952>`_
     - Add retry client options to the grpc library in voltha-lib-go
   * - `VOL-4958 <https://jira.opencord.org/browse/VOL-4958>`_
     - Introduce protobuf dependencies in DMI for the python testing framework
   * - `VOL-4983 <https://jira.opencord.org/browse/VOL-4983>`_
     - voltctl list device meters with traffic shaping info
   * - `VOL-5043 <https://jira.opencord.org/browse/VOL-5043>`_
     - Enhance DMI interface to have CPU/Mem/Disk usage alarms and also NTP synch alarms

Bug Fixes
---------

.. list-table:: Bug Fixes
   :widths: 10, 10, 40
   :header-rows: 1

   * - Jira
     - Resource
     - Description
   * - `VOL-4934 <https://jira.opencord.org/browse/VOL-4934>`_
     - omci-lib-go
     - MIC (AES-128) calculation does not properly support the Ex
   * - `VOL-4931 <https://jira.opencord.org/browse/VOL-4931>`_
     - openoltAdapter
     - memory leak seen in long term tests
   * - `VOL-4929 <https://jira.opencord.org/browse/VOL-4929>`_
     - openonuAdapterGo
     - memory leak seen in long term tests
   * - `VOL-4927 <https://jira.opencord.org/browse/VOL-4927>`_
     - omci-lib-go
     - ONT-G ME alarms are not supposed by auto-generated code of omci-lib-go
   * - `VOL-4984 <https://jira.opencord.org/browse/VOL-4984>`_
     - voltctl
     - log level list does not display the component open-flow-agent

Test
----

.. list-table:: Test
   :widths: 10, 10, 40
   :header-rows: 1

   * - Jira
     - Resource
     - Description
   * - `VOL-4829 <https://jira.opencord.org/browse/VOL-4829>`_
     - openonuAdapterGo
     - Robustness - Test of reconciling openonu-adapter with continuous traffic at real HW

Documentation
-------------

As usual documentation is published on https://docs.voltha.org


Known Issues
------------

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
`VOLTHA 2.12 <https://jira.opencord.org/projects/VOL/versions/12600>`_ (`formatted <https://jira.opencord.org/secure/ReleaseNote.jspa?projectId=10106&version=12600>`_) release page in Jira.

|

Component Versions in VOLTHA 2.12 release
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
     - Ver
     - Ver
     - Chart
     - URL
     - URL
   * -
     -
     -
     -
     -
     -
   * - ONOS 2.5 LTS: `2.5.9 <https://github.com/opennetworkinglab/onos/releases/tag/2.5.9>`_, `2.5.8 <https://github.com/opennetworkinglab/onos/releases/tag/2.5.8>`_
     - ``2.5.5``
     - ``2.5.9``, ``2.5.8``
     -
     -
     -
   * - `ATOMIX <https://github.com/atomix/atomix/releases/tag/atomix-3.1.9>`_
     -
     - ``3.1.9``
     -
     -
     -

ONOS Components
+++++++++++++++

.. list-table:: ONOS Components
   :widths: 10, 2, 2, 2, 2, 2, 2, 2
   :header-rows: 2

   * - Component
     - Artifact
     - Api
     - App
     - Pkg
     - Gerrit
     - Github
     - Released
   * - Name
     - Ver
     - Ver
     - Ver
     - Ver
     - URL
     - URL
     -
   * -
     -
     -
     -
     -
     -
     -
     -
   * - `aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_
     - `2.11.0 <https://mvnrepository.com/artifact/org.opencord/aaa/2.11.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/aaa-api/2.11.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/aaa-app/2.11.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/aaa>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/aaa/+/refs/tags/2.11.0>`__
     - `X <https://github.com/opencord/aaa/releases/tag/2.11.0>`__
     - ``Y-``
   * - `bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`__
     - `2.5.1 <https://mvnrepository.com/artifact/org.opencord/bng/2.5.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/bng-api/2.5.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/bng-app/2.5.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/bng/>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/bng/+/refs/tags/2.5.1>`__
     - `X <https://github.com/opencord/bng/tree/2.5.1>`__
     - ``N``
   * - `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`__
     - `2.11.0 <https://mvnrepository.com/artifact/org.opencord/dhcpl2relay/2.11.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/dhcpl2relay-api/2.11.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/dhcpl2relay-app/2.11.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/dhcpl2relay>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/dhcpl2relay/+/refs/tags/2.11.0>`__
     - `X <https://github.com/opencord/dhcpl2relay/releases/tag/2.11.0>`__
     - Y
   * - `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`__
     - `2.9.0 <https://mvnrepository.com/artifact/org.opencord/onos-app-igmpproxy/2.9.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/onos-app-igmpproxy-api/2.9.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/onos-app-igmpproxy-app/2.9.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/onos-app-igmpproxy/2.9.0>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/igmpproxy/+/refs/tags/2.9.0>`__
     - `X <https://github.com/opencord/igmpproxy/releases/tag/2.9.0>`__
     -
   * - `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`__
     - `2.13.0 <https://mvnrepository.com/artifact/org.opencord/kafka/2.13.0>`__, `2.12.0 <https://mvnrepository.com/artifact/org.opencord/kafka/2.12.0>`__
     - X
     - X
     - `X <https://mvnrepository.com/artifact/org.opencord/kafka>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/kafka-onos/+/refs/tags/2.13.0>`__
     - `X <https://github.com/opencord/kafka-onos/releases/tag/2.13.0>`__, `T <https://github.com/opencord/kafka-onos/tree/2.13.0>`__
     - ``N``
   * - `maclearner <https://gerrit.opencord.org/plugins/gitiles/mac-learning>`__
     - `1.2.3 <https://mvnrepository.com/artifact/org.opencord/maclearner/1.2.3>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/maclearner-api/1.2.3>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/maclearner-app/1.2.3>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/maclearner>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/mac-learning/+/refs/tags/1.2.3>`__
     - `X <https://github.com/opencord/mac-learning/releases/tag/1.2.3>`__, `T <https://github.com/opencord/mac-learning/tree/1.2.3>`__
     - Y
   * - `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`__
     - `2.9.1 <https://mvnrepository.com/artifact/org.opencord/mcast/2.9.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/mcast-api/2.9.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/mcast-app/2.9.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/mcast/2.9.1>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/mcast/+/refs/tags/2.9.1>`__
     - `X <https://github.com/opencord/mcast/releases/tag/2.9.1>`__, `T <https://github.com/opencord/mcast/tree/2.9.1>`__
     -
   * - `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`__
     - `5.2.5 <https://mvnrepository.com/artifact/org.opencord/olt/5.2.5>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olt-api/5.2.5>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olt-app/5.2.5>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olt/5.2.5>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/olt/+/refs/tags/5.2.5>`__
     - `X <https://github.com/opencord/olt/releases/tag/5.2.5>`__
     -
   * - `olttopology <https://gerrit.opencord.org/plugins/gitiles/olttopology/>`__
     - `1.3.1 <https://mvnrepository.com/artifact/org.opencord/olttopology/1.3.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olttopology-api/1.3.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olttopology-app/1.3.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olttopology>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/olttopology/+/refs/tags/1.3.1>`__
     - `X <https://github.com/opencord/olttopology/releases/tag/1.3.1>`__, `tags <https://github.com/opencord/olttopology/tags>`__, `1.3.0 <https://github.com/opencord/olttopology/releases/tag/1.3.0>`_
     - ``N``
   * - `pppoeagent <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/>`__
     - `1.3.0 <https://mvnrepository.com/artifact/org.opencord/pppoeagent/1.3.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/pppoeagent-api/1.3.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/pppoeagent-app/1.3.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/pppoeagent>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/+/refs/tags/1.3.0>`__
     - `X <https://github.com/opencord/pppoeagent/releases/tag/1.3.0>`__
     - Y
   * - `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`__
     - `5.12.2 <https://mvnrepository.com/artifact/org.opencord/sadis/5.12.2>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/sadis-api/5.12.2>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/sadis-app/5.12.2>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/sadis>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/sadis/+/refs/tags/5.12.2>`__
     - `X <https://github.com/opencord/sadis/releases/tag/5.12.2>`__
     - Y

- `Docker Images: opencord <https://hub.docker.com/search?q=opencord>`_

VOLTHA Components
+++++++++++++++++

.. list-table:: VOLTHA Components
   :widths: 30, 5, 5, 5, 5, 5, 5, 5, 5, 5
   :header-rows: 2

   * - Component
     - VOLTHA
     - Component
     -
     - Gerrit
     - Github
     - `Docker <https://hub.docker.com/search?q=voltha>`_
     - go
     - pypi
     -
   * - Name
     - Ver
     - Ver
     - `with Chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_
     - ULR
     - URL
     - URL
     -
     -
     - status
   * -
     -
     -
     -
     -
     -
     -
     -
     -
     -
   * - `Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree>`_
     - ``3.2.2-dev1``
     -
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master>`__
     - `X <https://github.com/opencord/voltha-helm-charts/tree/3.2.0>`__
     -
     -
     -
     -
   * - `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`__
     - ``1.14.4``
     - ``4.8.6``
     - `chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_
     -
     - `X <https://github.com/opencord/bbsim/tree/v1.14.4>`__
     - `X <https://hub.docker.com/layers/voltha/bbsim/1.14.4/images/sha256-c23de193c1d7cf8d32c48edfbec4bfa6c47dbeecd4b31d040da0255eeab2ec58?context=explore>`__
     -
     -
     - ``N``
   * - `Bbsim-sadis-server <https://gerrit.opencord.org/gitweb?p=bbsim-sadis-server.git;a=tree>`_
     -
     - ``0.3.4``
     - `0.3.2 <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/bbsim-sadis-server/Chart.yaml>`_
     - `X <https://gerrit.opencord.org/plugins/gitiles/bbsim-sadis-server/+/refs/tags/v0.3.4>`__
     - `X <https://github.com/opencord/bbsim-sadis-server/releases/tag/v0.3.4>`__
     -
     -
     -
     - ``N``
   * - `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree>`_
     - ``2.2.1``
     - ``2.2.1``
     - ``?``
     - `X <https://gerrit.opencord.org/plugins/gitiles/ofagent-go/+/refs/tags/v2.2.1>`__
     - `X <https://github.com/opencord/ofagent-go/releases/tag/v2.2.1>`__
     - `1.1.4(stale) <https://hub.docker.com/layers/voltha/ofagent-go/1.1.4/images/sha256-8231111b69c8643c4981d64abff0a85d71f80763bb98632bb101e92b89882647?context=explore>`_
     - `1.6.5(stale) <https://pkg.go.dev/github.com/opencord/ofagent-go/cmd/ofagent>`_
     -
     - Y
   * - `openolt agent <https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree>`_
     -
     - ``4.2.12``
     -
     -
     - `X <https://github.com/opencord/openolt>`__
     -
     -
     -
     - ``N``
   * - `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_
     - ``1.8.3``
     -
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltctl/+/refs/tags/v1.8.3>`__
     - `X <https://github.com/opencord/voltctl/tree/v1.8.3>`__
     -
     -
     -
     - ``N``
   * - `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree>`_
     - ``3.1.8``
     - docker
     - ``2.11.3``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-go/+/refs/tags/v3.1.8>`__
     - `X <https://github.com/opencord/voltha-go/tree/v3.1.8>`__
     -
     - `v7 <https://pkg.go.dev/github.com/opencord/voltha-lib-go/v7>`_
       `v5 <https://pkg.go.dev/github.com/opencord/voltha-lib-go/v5>`_
     -
     - ``N``
   * - `voltha-lib-go <https://gerrit.opencord.org/plugins/gitiles/voltha-lib-go>`_
     - ``7.5.3``
     -
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-lib-go/+/refs/tags/v7.5.3>`__
     - `X <https://github.com/opencord/voltha-lib-go/releases/tag/v7.5.3>`__
     - `stale <https://hub.docker.com/r/voltha/voltha-protos>`__
     - `v7 <https://pkg.go.dev/github.com/opencord/voltha-lib-go/v7@v7.5.3>`__
     - `5.5.0(stale) <https://pypi.org/project/voltha-protos>`__
     - ``N``
   * - `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree>`_
     -
     - ``5.1.2``
     - ``0.1.27``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-onos/+/refs/tags/5.1.3>`__
     - `X <https://github.com/opencord/voltha-onos/tree/5.1.3>`__
     - `X <https://hub.docker.com/layers/voltha/voltha-onos/5.1.3/images/sha256-d9c686acf177ed823ff359dc43ba59aab05ae067be27c92e48c08b72f94b9ca3?context=explore>`__
     -
     -
     - ``N``
   * - `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree>`_
     -
     - ``2.7.3``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-openonu-adapter-go/+/refs/tags/v2.7.3>`__
     - `X <https://github.com/opencord/voltha-openonu-adapter-go/tree/v2.7.3>`__
     - `X <https://hub.docker.com/layers/voltha/voltha-openonu-adapter-go/2.7.3/images/sha256-e9484a8963d08748af5766a6a8ce7f7485efb384488bcf93840ecc1142d7ad74?context=explore>`__
     -
     -
     - ``N``
   * - `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree>`_
     - ``v4.2.12``
     - ``4.2.6``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-openolt-adapter/+/refs/tags/v4.2.12>`__
     - `X <https://github.com/opencord/voltha-openolt-adapter/tree/v4.2.12>`__
     - `X <https://hub.docker.com/layers/voltha/voltha-openolt-adapter/4.2.12/images/sha256-844eac272323dc8bca10880a111957a95839578b3210dd777be5ac9370aaa52e?context=explore>`__
     -
     -
     - ``N``
   * - `voltha-protos <https://gerrit.opencord.org/plugins/gitiles/voltha-protos>`_
     -
     - `5.4.11 <https://pypi.org/project/voltha-protos/5.4.11>`__
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/tags/v5.4.11>`__
     - `X <https://github.com/opencord/voltha-protos/releases/tag/v5.4.11>`__, `T <https://github.com/opencord/voltha-protos/tree/v5.4.11>`__
     - `1.7.0.1+(stale) <https://hub.docker.com/r/voltha/voltha-protos/tags>`_
     - `1.0.3(stale) <https://pkg.go.dev/github.com/opencord/voltha-protos>`_
     - `5.4.11 <https://pypi.org/project/voltha-protos/5.4.11>`__
     - ``N``
   * - `voltha-system-tests <https://github.com/opencord/voltha-system-tests/releases/tag/2.9.0>`__
     - ``2.11.10``
     -
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-system-tests/+/refs/tags/2.11.10>`__
     - `X <https://github.com/opencord/voltha-system-tests/tree/2.11.10>`__
     - `stale <https://hub.docker.com/r/voltha/voltha-protos>`_
     -
     -
     - ``N``
   * - ppoeagent
     - ``1.2.1``
     -
     -
     -
     -
     -
     -
     -
     - ``N``
   * - segmentrouting
     - ``3.0.0``
     -
     -
     -
     -
     -
     -
     -
     - ``N``

- `Docker Images: Voltha <https://docs.voltha.org/master/resources/docker.html>`_


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

Helm Chart Versions
+++++++++++++++++++
This section refers to the macro charts to deploy the required infrastructure and a (or many) VOLTHA stacks:

BAL Version
+++++++++++

|

Get Involved
------------
<We'd love to accept your patches and contributions to the VOLTHA project, join the community!

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

Slack
+++++

  - `voltha-dev <https://app.slack.com/client/T095Z193Q/C01D229FP2A>`_
  - `community <https://app.slack.com/client/T095Z193Q/C0184DT7116>`_
  - `general <https://app.slack.com/client/T095Z193Q/C095YQBLL>`_

Mailing List
++++++++++++

  - `voltha-discuss@opennetworking.org <https://groups.google.com/a/opennetworking.org/g/voltha-discuss>`_.

Weekly TST Meetings
+++++++++++++++++++

  - `Zoom Meeting <https://www.google.com/url?q=https://onf.zoom.us/j/978447356?pwd%3DdS9WajNLam9ZeFExOHV3SXB2Nk1VZz09&sa=D&source=calendar&ust=1686087684256971&usg=AOvVaw3dMQpIMYLlyjTTmkvW_edp>`_.
  - `Rolling Agenda <https://www.google.com/url?q=https://docs.google.com/document/d/1mNqronCip_-tDjFI-ZoudNteC3AnOcVONPHz7HuW8Eg/edit?usp%3Dsharing&sa=D&source=calendar&ust=1686087684256971&usg=AOvVaw3km2VVU2j1qa6JCGI0iSBx>`_.

Website(s)
++++++++++

  - `onf/VOLTHA <https://opennetworking.org/voltha/>`_
  - `docs.voltha.org <https://docs.voltha.org>`_
  - `Wiki <https://wiki.opencord.org>`_

|
