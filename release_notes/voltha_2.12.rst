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
   * - `VOL-4949 <|jira-opencord|/VOL-4949>`_
     - Introduce DEVICE_BUSY reason in the UploadDebugInfoStatus DMI message
   * - `VOL-4783 <|jira-opencord|/VOL-4783>`_
     - Introduce UploadDebugInformation RPC in DMI
   * - `VOL-4788 <|jira-opencord|/VOL-4788>`_
     - Create package in voltha-libs-go for support of prometheus counters in voltha
   * - `VOL-4782 <|jira-opencord|/VOL-4782>`_
     - Enchance DMI to include DataValueType in Events and also clarification for Transceiver Events
   * - `VOL-4878 <|jira-opencord|/VOL-4878>`_
     - Improve the voltha-protos extensions interface to get the Rx Power levels from an OLT
   * - `VOL-4877 <|jira-opencord|/VOL-4877>`_
     - Enhance DMI interface to be able to retrieve the Tx Power on the Transceivers
   * - `VOL-4958 <|jira-opencord|/VOL-4958>`_
     - Introduce protobuf dependencies in DMI for the python testing framework
   * - `VOL-4952 <|jira-opencord|/VOL-4952>`_
     - Add retry client options to the grpc library in voltha-lib-go
   * - `VOL-4983 <|jira-opencord|/VOL-4983>`_
     - voltctl list device meters with traffic shaping info
   * - `VOL-5043 <|jira-opencord|/VOL-5043>`_
     - Enhance DMI interface to have CPU/Mem/Disk usage alarms and also NTP synch alarms
   * - `VOL-4444 <|jira-opencord|/VOL-4444>`_
     - VOL-4340 Create API for profile in voltha rw-core for profile operations
   * - `VOL-4436 <|jira-opencord|/VOL-4436>`_
     - VOL-4340 Create proto files for sip profile and voip service
   * - `VOL-5046 <|jira-opencord|/VOL-5046>`_
     - Reuse grpc clinet connection in grpc clinet lib
   * - `VOL-4972 <|jira-opencord|/VOL-4972>`_
     - Changes in openolt adapter to reconcile onu device and pon states
   * - `VOL-4953 <|jira-opencord|/VOL-4953>`_
     - Retry for grpc towards core in openolt adapter
   * - `VOL-5216 <|jira-opencord|/VOL-5216>`_
     - Handle transition in core during device reboot
   * - `VOL-5197 <|jira-opencord|/VOL-5197>`_
     - In DMI add QSFP-DD as a form factor for the TransceiverAttributes
   * - `VOL-4950 <|jira-opencord|/VOL-4950>`_
     - Move the component_uuid from EventsConfigurationRequest to EventCfg of DMI interface
   * - `VOL-5241 <|jira-opencord|/VOL-5241>`_
     - Add Zyxel to ONU Vendor list
   * - `VOL-5233 <|jira-opencord|/VOL-5233>`_
     - VOL-5206 Change "ONU_DYING_GASP_EVENT" check to "ONU_DYING_GASP_RAISE_EVENT" in Alarm tests

Bug Fixes
---------

.. list-table:: Bug Fixes
   :widths: 10, 60
   :header-rows: 1

   * - Jira
     - Description
   * -
     -
   * - `VOL-4926 <|jira-opencord|/VOL-4926>`_
     - VOL-4836 kail - godownloader.sh no longer available: alternative needed
   * - `VOL-4934 <|jira-opencord|/VOL-4934>`_
     - omci-lib-go: MIC (AES-128) calculation does not properly support the Extended Message Set
   * - `VOL-4927 <|jira-opencord|/VOL-4927>`_
     - omci-lib-go: ONT-G ME alarms are not supposed
   * - `VOL-4929 <|jira-opencord|/VOL-4929>`_
     - openonuAdapterGo - memory leak seen in long term tests
   * - `VOL-4931 <|jira-opencord|/VOL-4931>`_
     - openoltAdapter: memory leak seen in long term tests
   * - `VOL-4984 <|jira-opencord|/VOL-4984>`_
     - voltctl log level list does not display the component open-flow-agent
   * - `VOL-5105 <|jira-opencord|/VOL-5105>`_
     - cli label missing for pon ports in BBSIM
   * - `VOL-5193 <|jira-opencord|/VOL-5193>`_
     - OpenOnuAdapterGo: MIB sync handling fails , when the MIB template has NULL terminated strings.
   * - `VOL-5187 <|jira-opencord|/VOL-5187>`_
     - openolt adaptor should not set discovery in progress for a given onu in case the particular discovery request fails
   * - `VOL-5165 <|jira-opencord|/VOL-5165>`_
     - Openoltagent getting crashed when ONT is rebooted
   * - `VOL-5172 <|jira-opencord|/VOL-5172>`_
     - Olt adaptor trying to add flows to the devices even when the parent olt is not up
   * - `VOL-5104 <|jira-opencord|/VOL-5104>`_
     - BBSIM crashed when adding flows
   * - `VOL-4993 <|jira-opencord|/VOL-4993>`_
     - Upon OLT reboot, OLT's OPERSTATUS is observed as "rebooted" and no ONTs are discovered
   * - `VOL-4798 <|jira-opencord|/VOL-4798>`_
     - voltctl - log configuration for multiple stacks doesn't work
   * - `VOL-5212 <|jira-opencord|/VOL-5212>`_
     - Unable to fetch PON RX power for all the ONTs on a PON port.
   * - `VOL-5215 <|jira-opencord|/VOL-5215>`_
     - After rebooting ONUs the BBSIM OLT is crashing
   * - `VOL-5208 <|jira-opencord|/VOL-5208>`_
     - onu adapter will go into race and crash if delete-device and delete gemport from olt adapter happens at once
   * - `VOL-5210 <|jira-opencord|/VOL-5210>`_
     - Open onu adapter crashes when processing requests and device is deleted
   * - `VOL-5107 <|jira-opencord|/VOL-5107>`_
     - forced crash during child device detected may result in duplicate device
   * - `VOL-5219 <|jira-opencord|/VOL-5219>`_
     - in case voltha core goes down before it gets a chance to fire reconcile to the adaptors it should retrigger the reconcile process once it comes back up
   * - `VOL-5175 <|jira-opencord|/VOL-5175>`_
     - OLT device ports list in ONOS is empty after rebooting the OLT
   * - `VOL-5195 <|jira-opencord|/VOL-5195>`_
     - Missing ANI-G Signal Fail and Signal Degrade alarm notification
   * - `VOL-5209 <|jira-opencord|/VOL-5209>`_
     - Open onu adapter crashes during delete device
   * - `VOL-5249 <|jira-opencord|/VOL-5249>`_
     - error loading onos image in voltha-onos-sanity_test
   * - `VOL-5236 <|jira-opencord|/VOL-5236>`_
     - onu adapter should gracefully reset vlan config fsm on onu down
   * - `VOL-5223 <|jira-opencord|/VOL-5223>`_
     - OpenOnuAdapterGo: Alarm Mgr has to handle unconfigured MEs responses from ONT during Alarm Audit.


Test
----

.. list-table:: Test
   :widths: 10, 60
   :header-rows: 1

   * - Jira
     - Description
   * - `VOL-4829 <|jira-opencord|/VOL-4829>`_
     - openonuAdapterGo: Robustness - Test of reconciling openonu-adapter with continuous traffic at real HW


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
     - `X <|mvn-aaa|-api/2.11.0>`__
     - `X <|mvn-api|-api/2.11.0>`__
     - `X <|mvn-api|/2.11.0>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/aaa/+/refs/tags/2.11.0>`__
     - `X <https://github.com/opencord/aaa/releases/tag/2.11.0>`__
     -
   * - `bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`__
     - `2.5.1 <https://mvnrepository.com/artifact/org.opencord/bng/2.5.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/bng-api/2.5.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/bng-app/2.5.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/bng/2.5.1>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/bng/+/refs/tags/2.5.1>`__
     - `X <https://github.com/opencord/bng/releases/tag/2.5.1>`__
     -
   * - `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`__
     - `2.11.0 <https://mvnrepository.com/artifact/org.opencord/dhcpl2relay/2.11.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/dhcpl2relay-api/2.11.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/dhcpl2relay-app/2.11.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/dhcpl2relay>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/dhcpl2relay/+/refs/tags/2.11.0>`__
     - `X <https://github.com/opencord/dhcpl2relay/releases/tag/2.11.0>`__
     -
   * - `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`__
     - `2.9.0 <https://mvnrepository.com/artifact/org.opencord/onos-app-igmpproxy/2.9.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/onos-app-igmpproxy-api/2.9.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/onos-app-igmpproxy-app/2.9.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/onos-app-igmpproxy/2.9.0>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/igmpproxy/+/refs/tags/2.9.0>`__
     - `X <https://github.com/opencord/igmpproxy/releases/tag/2.9.0>`__
     -
   * - `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`__
     - `2.13.2 <https://mvnrepository.com/artifact/org.opencord/kafka/2.13.2>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/kafka-api/2.13.2>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/kafka-app/2.13.2>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/kafka/2.13.2>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/kafka-onos/+/refs/tags/2.13.2>`__
     - `X <https://github.com/opencord/kafka-onos/releases/tag/2.13.2>`__
     - ``N``
   * - `maclearner <https://gerrit.opencord.org/plugins/gitiles/mac-learning>`__
     - `1.2.3 <https://mvnrepository.com/artifact/org.opencord/maclearner/1.2.3>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/maclearner-api/1.2.3>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/maclearner-app/1.2.3>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/maclearner>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/mac-learning/+/refs/tags/1.2.3>`__
     - `X <https://github.com/opencord/mac-learning/releases/tag/1.2.3>`__, `T <https://github.com/opencord/mac-learning/tree/1.2.3>`__
     -
   * - `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`__
     - `2.9.1 <https://mvnrepository.com/artifact/org.opencord/mcast/2.9.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/mcast-api/2.9.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/mcast-app/2.9.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/mcast/2.9.1>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/mcast/+/refs/tags/2.9.1>`__
     - `X <https://github.com/opencord/mcast/releases/tag/2.9.1>`__, `T <https://github.com/opencord/mcast/tree/2.9.1>`__
     -
   * - `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`__
     - `5.2.6 <https://mvnrepository.com/artifact/org.opencord/olt/5.2.6>`__
     - `X <|mvn-olt|-api/5.2.6>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olt-app/5.2.6>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olt/5.2.6>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/olt/+/refs/tags/5.2.6>`__
     - `X <https://github.com/opencord/olt/releases/tag/5.2.6>`__
     -
   * - `olttopology <https://gerrit.opencord.org/plugins/gitiles/olttopology/>`__
     - `1.3.1 <https://mvnrepository.com/artifact/org.opencord/olttopology/1.3.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olttopology-api/1.3.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olttopology-app/1.3.1>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/olttopology>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/olttopology/+/refs/tags/1.3.1>`__
     - `X <https://github.com/opencord/olttopology/releases/tag/1.3.1>`__
     -
   * - `pppoeagent <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/>`__
     - `1.3.0 <https://mvnrepository.com/artifact/org.opencord/pppoeagent/1.3.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/pppoeagent-api/1.3.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/pppoeagent-app/1.3.0>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/pppoeagent>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/pppoeagent/+/refs/tags/1.3.0>`__
     - `X <https://github.com/opencord/pppoeagent/releases/tag/1.3.0>`__
     -
   * - `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`__
     - `5.12.2 <https://mvnrepository.com/artifact/org.opencord/sadis/5.12.2>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/sadis-api/5.12.2>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/sadis-app/5.12.2>`__
     - `X <https://mvnrepository.com/artifact/org.opencord/sadis>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/sadis/+/refs/tags/5.12.2>`__
     - `X <https://github.com/opencord/sadis/releases/tag/5.12.2>`__
     -

- See Also

  - :ref:`Release Notes Legend for ONOS Components`
  - `Docker Images: opencord <https://hub.docker.com/search?q=opencord>`_


VOLTHA Components
+++++++++++++++++

.. list-table:: VOLTHA Components
   :widths: 30, 5, 5, 5, 5, 5, 5, 5, 5
   :header-rows: 2

   * - Component
     - VOLTHA
     - `Chart.yaml <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master>`_
     - `Gerrit <https://gerrit.opencord.org/admin/repos>`_
     - `Github <https://github.com/opencord>`_
     - `Docker <https://hub.docker.com/search?q=voltha>`_
     - `Golang <https://pkg.go.dev>`_
     - `Pypi <https://pypi.org>`_
     - Repository
   * - Name
     - Version
     - Version
     - ULR
     - URL
     - URL
     - URL
     - URL
     - Released
   * -
     -
     -
     -
     -
     -
     -
     -
     -
   * - `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree>`_
     - `2.2.1 <https://gerrit.opencord.org/plugins/gitiles/ofagent-go/+/refs/heads/voltha-2.12/VERSION>`_
     - ``N/A``
     - `X <https://gerrit.opencord.org/plugins/gitiles/ofagent-go/+/refs/tags/v2.2.1>`__
     - `X <https://github.com/opencord/ofagent-go/releases/tag/v2.2.1>`__
     - `1.1.4(stale) <https://hub.docker.com/layers/voltha/ofagent-go/1.1.4/images/sha256-8231111b69c8643c4981d64abff0a85d71f80763bb98632bb101e92b89882647?context=explore>`_
     - `1.6.5(stale) <https://pkg.go.dev/github.com/opencord/ofagent-go/cmd/ofagent>`_
     -
     -
   * - `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree>`_
     - `3.5.4 <https://gerrit.opencord.org/plugins/gitiles/voltha-go/+/refs/heads/voltha-2.12/VERSION>`_
     - ``N/A``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-go/+/refs/tags/v3.5.4>`__
     - `X <https://github.com/opencord/voltha-go/releases/tag/v3.5.4>`__
     - ``N/A``
     - ``v7:?``
     -
     -
   * - `voltha-lib-go <https://gerrit.opencord.org/plugins/gitiles/voltha-lib-go>`_
     - `7.5.3 <https://gerrit.opencord.org/plugins/gitiles/voltha-lib-go/+/refs/heads/master/VERSION>`_
     - ``N/A``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-lib-go/+/refs/tags/v7.5.3>`__
     - `X <https://github.com/opencord/voltha-lib-go/releases/tag/v7.5.3>`__
     - ``?``
     - `v7 <https://pkg.go.dev/github.com/opencord/voltha-lib-go/v7@v7.5.3>`__
     - ``?``
     -
   * - `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree>`_
     - ``5.1.10``
     - ``0.1.27``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-onos/+/refs/tags/5.1.10>`__
     - `X <https://github.com/opencord/voltha-onos/releases/tag/5.1.10>`__
     - `X <https://hub.docker.com/layers/voltha/voltha-onos/5.1.10/images/sha256-d2498af38194a1cd01a1b9072a58af8647ed50fea2dbc9bd3ac4d4e4b583d72a?context=explore>`__
     -
     -
     - ``N``
   * - `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree>`_
     - `4.4.11 <https://gerrit.opencord.org/plugins/gitiles/voltha-openolt-adapter/+/refs/heads/voltha-2.12/VERSION>`_
     - `2.12.6 <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-adapter-openolt/Chart.yaml#20>`_
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-openolt-adapter/+/refs/tags/v4.4.11>`__
     - `X <https://github.com/opencord/voltha-openolt-adapter/releases/tag/v4.4.11>`__
     - `X <https://hub.docker.com/layers/voltha/voltha-openolt-adapter/4.4.11/images/sha256-eed64f687f6029f4cbf531162a10d5e496ea454878987ec0212cd5dbf4c6d9cf?context=explore>`__
     - ``N/A``
     - ``N/A``
     -
   * - `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree>`_
     - `2.11.12 <https://gerrit.opencord.org/plugins/gitiles/voltha-openonu-adapter-go/+/refs/heads/voltha-2.12/VERSION>`_
     - `2.12.2 <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-adapter-openonu/Chart.yaml#17>`__
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-openonu-adapter-go/+/refs/tags/v2.11.12>`__
     - `X <https://github.com/opencord/voltha-openonu-adapter-go/releases/tag/v2.11.12>`__
     - `X <https://hub.docker.com/layers/voltha/voltha-openonu-adapter-go/2.11.12/images/sha256-e9484a8963d08748af5766a6a8ce7f7485efb384488bcf93840ecc1142d7ad74?context=explore>`__
     - `stale <https://pkg.go.dev/github.com/opencord/voltha-openonu-adapter-go>`_
     - ``N/A``
     -
   * - `voltha-protos <https://gerrit.opencord.org/plugins/gitiles/voltha-protos>`_
     - `5.4.11 <https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/heads/voltha-2.12/VERSION>`_
     - ``N/A``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/tags/v5.4.11>`__
     - `X <https://github.com/opencord/voltha-protos/releases/tag/v5.4.11>`__
     - `stale <https://hub.docker.com/r/voltha/voltha-protos/tags>`__
     - `stale <https://pkg.go.dev/github.com/opencord/voltha-protos>`__
     - `5.4.11 <https://pypi.org/project/voltha-protos/5.4.11>`__
     -
   * - `voltha-system-tests <https://github.com/opencord/voltha-system-tests/releases/tag/2.9.0>`__
     - ``2.12.13``
     -
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-system-tests/+/refs/tags/2.12.13>`__
     - `X <https://github.com/opencord/voltha-system-tests/tree/2.12.13>`__
     -
     -
     -
     - ``verify`` `VOL-5064 <https://jira.opencord.org/browse/VOL-5064>`_
   * - segmentrouting
     - ``3.0.0``
     -
     -
     -
     -
     -
     -
     - ``N``

- See Also

  - :ref:`Release Notes Legend for VOLTHA Components`
  - `Docker Images: Voltha <https://docs.voltha.org/master/resources/docker.html>`_


VOLTHA Tools
++++++++++++

.. list-table:: VOLTHA Components
   :widths: 30, 5, 5, 5, 5, 5, 5, 5, 5
   :header-rows: 2

   * - Component
     - VOLTHA
     - `Chart.yaml <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master>`_
     - `Gerrit <https://gerrit.opencord.org/admin/repos>`_
     - `Github <https://github.com/opencord>`_
     - `Docker <https://hub.docker.com/search?q=voltha>`_
     - `Golang <https://pkg.go.dev>`_
     - `Pypi <https://pypi.org>`_
     - Repository
   * - Name
     - Version
     - Version
     - ULR
     - URL
     - URL
     - URL
     - URL
     - Released
   * -
     -
     -
     -
     -
     -
     -
     -
     -
   * - `voltha-docs <https://gerrit.opencord.org/plugins/gitiles/voltha-docs>`_ , `docs.voltha.org <https://docs.voltha.org>`_
     - ``2.12.25``
     - ``N/A``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/tags/2.12.25>`__
     - `X <https://github.com/opencord/voltha-docs/releases/tag/2.12.25>`__
     -
     -
     -
     - ``N``
   * - `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`__
     - ``1.16.3+``
     - ``4.8.6`` `chart <https://gerrit.opencord.org/gitwe44b?p=helm-charts.git;a=tree;f=bbsim>`_
     - `X <https://gerrit.opencord.org/plugins/gitiles/bbsim>`__
     - `X <https://github.com/opencord/bbsim/tree/v1.14.4>`__
     - `X <https://hub.docker.com/layers/voltha/bbsim/1.14.4/images/sha256-c23de193c1d7cf8d32c48edfbec4bfa6c47dbeecd4b31d040da0255eeab2ec58?context=explore>`__
     - ``?``
     - ``?``
     - ``N``
   * - `Bbsim-sadis-server <https://gerrit.opencord.org/gitweb?p=bbsim-sadis-server.git;a=tree>`__
     - `0.3.6 <https://gerrit.opencord.org/plugins/gitiles/bbsim-sadis-server/+/refs/heads/voltha-2.12/VERSION>`_
     - `0.3.3 <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/voltha-2.12/voltha-infra/Chart.yaml#45>`_
     - `X <https://gerrit.opencord.org/plugins/gitiles/bbsim-sadis-server/+/refs/tags/v0.3.6/VERSION>`__
     - `X <https://github.com/opencord/bbsim-sadis-server/releases/tag/v0.3.6>`__
     - `X <https://hub.docker.com/layers/voltha/bbsim-sadis-server/0.3.6/images/sha256-0ea9df1be13f8b1d0a8314cbf0e0800e4a4b7e2920ae3ce5e119abddb9359350?context=explore>`__
     -
     -
     - ``N``
   * - `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_
     - `1.10.2 <https://gerrit.opencord.org/plugins/gitiles/voltctl/+/refs/heads/voltha-2.12/VERSION>`_
     - ``N/A``
     - `X <https://gerrit.opencord.org/plugins/gitiles/voltctl/+/refs/tags/v1.10.2>`__
     - `? <https://github.com/opencord/voltctl/releases/tag/v1.10.2>`_
     - ``N/A``
     - `X <https://pkg.go.dev/github.com/opencord/voltctl@v1.10.2>`__
     - ``N/A``
     - ``N``


Helm Chart Versions
+++++++++++++++++++
This section refers to the macro charts to deploy the required infrastructure and a (or many) VOLTHA stacks:

.. list-table:: Helm Chart Versions
   :widths: 30, 30
   :header-rows: 2

   * - Component
     - VOLTHA
   * - Name
     - Version
   * -
     -
   * - Helm Charts (voltha-helm-charts)
     - `3.3.0 <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/voltha-2.12/VERSION>`_
   * - Voltha
     - `2.12.17 <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha/Chart.yaml#20>`_
   * - Voltha-infra
     - `2.12.6 <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-infra/Chart.yaml#37>`__
   * - Voltha-stack
     - `2.12.9 <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-stack/Chart.yaml#37>`_

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

.. |jira-opencord|  replace:: replacement https://jira.opencord.org/browse
.. |mvn-artifact|   replace:: replacement https://mvnrepository.com/artifact/org.opencord
.. |mvn-aaa|        replace:: replacement https://mvnrepository.com/artifact/org.opencord/aaa
.. |mvn-olt|        replace:: replacement |mvn-artifact|/olt
