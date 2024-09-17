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
   * - :jira-browse:`VOL-4949`
     - Introduce DEVICE_BUSY reason in the UploadDebugInfoStatus DMI message
   * - :jira-browse:`VOL-4783 <VOL-4783>`
     - Introduce UploadDebugInformation RPC in DMI
   * - :jira-browse:`VOL-4788 <VOL-4788>`
     - Create package in voltha-libs-go for support of prometheus counters in voltha
   * - :jira-browse:`VOL-4782 <VOL-4782>`
     - Enchance DMI to include DataValueType in Events and also clarification for Transceiver Events
   * - :jira-browse:`VOL-4878 <VOL-4878>`
     - Improve the voltha-protos extensions interface to get the Rx Power levels from an OLT
   * - :jira-browse:`VOL-4877 <VOL-4877>`
     - Enhance DMI interface to be able to retrieve the Tx Power on the Transceivers
   * - :jira-browse:`VOL-4958 <VOL-4958>`
     - Introduce protobuf dependencies in DMI for the python testing framework
   * - :jira-browse:`VOL-4952 <VOL-4952>`
     - Add retry client options to the grpc library in voltha-lib-go
   * - :jira-browse:`VOL-4983 <VOL-4983>`
     - voltctl list device meters with traffic shaping info
   * - :jira-browse:`VOL-5043 <VOL-5043>`
     - Enhance DMI interface to have CPU/Mem/Disk usage alarms and also NTP synch alarms
   * - :jira-browse:`VOL-4444 <VOL-4444>`
     - VOL-4340 Create API for profile in voltha rw-core for profile operations
   * - :jira-browse:`VOL-4436 <VOL-4436>`
     - VOL-4340 Create proto files for sip profile and voip service
   * - :jira-browse:`VOL-5046 <VOL-5046>`
     - Reuse grpc clinet connection in grpc clinet lib
   * - :jira-browse:`VOL-4972 <VOL-4972>`
     - Changes in openolt adapter to reconcile onu device and pon states
   * - :jira-browse:`VOL-4953 <VOL-4953>`
     - Retry for grpc towards core in openolt adapter
   * - :jira-browse:`VOL-5216 <VOL-5216>`
     - Handle transition in core during device reboot
   * - :jira-browse:`VOL-5197 <VOL-5197>`
     - In DMI add QSFP-DD as a form factor for the TransceiverAttributes
   * - :jira-browse:`VOL-4950 <VOL-4950>`
     - Move the component_uuid from EventsConfigurationRequest to EventCfg of DMI interface
   * - :jira-browse:`VOL-5241 <VOL-5241>`
     - Add Zyxel to ONU Vendor list
   * - :jira-browse:`VOL-5233 <VOL-5233>`
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
   * - :jira-browse:`VOL-4926 <VOL-4926>`
     - VOL-4836 kail - godownloader.sh no longer available: alternative needed
   * - :jira-browse:`VOL-4934 <VOL-4934>`
     - omci-lib-go: MIC (AES-128) calculation does not properly support the Extended Message Set
   * - :jira-browse:`VOL-4927 <VOL-4927>`
     - omci-lib-go: ONT-G ME alarms are not supposed
   * - :jira-browse:`VOL-4929 <VOL-4929>`
     - openonuAdapterGo - memory leak seen in long term tests
   * - :jira-browse:`VOL-4931 <VOL-4931>`
     - openoltAdapter: memory leak seen in long term tests
   * - :jira-browse:`VOL-4984 <VOL-4984>`
     - voltctl log level list does not display the component open-flow-agent
   * - :jira-browse:`VOL-5105 <VOL-5105>`
     - cli label missing for pon ports in BBSIM
   * - :jira-browse:`VOL-5193 <VOL-5193>`
     - OpenOnuAdapterGo: MIB sync handling fails , when the MIB template has NULL terminated strings.
   * - :jira-browse:`VOL-5187 <VOL-5187>`
     - openolt adaptor should not set discovery in progress for a given onu in case the particular discovery request fails
   * - :jira-browse:`VOL-5165 <VOL-5165>`
     - Openoltagent getting crashed when ONT is rebooted
   * - :jira-browse:`VOL-5172 <VOL-5172>`
     - Olt adaptor trying to add flows to the devices even when the parent olt is not up
   * - :jira-browse:`VOL-5104 <VOL-5104>`
     - BBSIM crashed when adding flows
   * - :jira-browse:`VOL-4993 <VOL-4993>`
     - Upon OLT reboot, OLT's OPERSTATUS is observed as "rebooted" and no ONTs are discovered
   * - :jira-browse:`VOL-4798 <VOL-4798>`
     - voltctl - log configuration for multiple stacks doesn't work
   * - :jira-browse:`VOL-5212 <VOL-5212>`
     - Unable to fetch PON RX power for all the ONTs on a PON port.
   * - :jira-browse:`VOL-5215 <VOL-5215>`
     - After rebooting ONUs the BBSIM OLT is crashing
   * - :jira-browse:`VOL-5208 <VOL-5208>`
     - onu adapter will go into race and crash if delete-device and delete gemport from olt adapter happens at once
   * - :jira-browse:`VOL-5210 <VOL-5210>`
     - Open onu adapter crashes when processing requests and device is deleted
   * - :jira-browse:`VOL-5107 <VOL-5107>`
     - forced crash during child device detected may result in duplicate device
   * - :jira-browse:`VOL-5219 <VOL-5219>`
     - in case voltha core goes down before it gets a chance to fire reconcile to the adaptors it should retrigger the reconcile process once it comes back up
   * - :jira-browse:`VOL-5175 <VOL-5175>`
     - OLT device ports list in ONOS is empty after rebooting the OLT
   * - :jira-browse:`VOL-5195 <VOL-5195>`
     - Missing ANI-G Signal Fail and Signal Degrade alarm notification
   * - :jira-browse:`VOL-5209 <VOL-5209>`
     - Open onu adapter crashes during delete device
   * - :jira-browse:`VOL-5249 <VOL-5249>`
     - error loading onos image in voltha-onos-sanity_test
   * - :jira-browse:`VOL-5236 <VOL-5236>`_
     - onu adapter should gracefully reset vlan config fsm on onu down
   * - :jira-browse:`VOL-5223 <VOL-5223>`
     - OpenOnuAdapterGo: Alarm Mgr has to handle unconfigured MEs responses from ONT during Alarm Audit.


Test
----

.. list-table:: Test
   :widths: 10, 60
   :header-rows: 1

   * - Jira
     - Description
   * - :jira-browse:`VOL-4829 <VOL-4829>`
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
     - :mvn-cord:`2.11.0 <aaai/2.11.0>`_
     - :mvn-cord:`X <aaa-api/2.11.0>`_
     - :mvn-cord:`X <aaa-app/2.11.0>`_
     - :mvn-cord:`X <aaa/2.11.0>`_
     - :vol-ger:`X </aaa/+/refs/tags/2.11.0>`_
     - :vol-git:`X </aaa/releases/tag/2.11.0>`_
     -
   * - `bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`__
     - :mvn-cord:`2.5.1 </bng/2.5.1>`_
     - :mvn-cord:`X </bng-api/2.5.1>`_
     - :mvn-cord:`X </bng-app/2.5.1>`_
     - :mvn-cord:`X </bng/2.5.1>`_
     - :vol-ger:`X </bng/+/refs/tags/2.5.1>`_
     - :vol-git:`X </bng/releases/tag/2.5.1>`_
     -
   * - `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`__
     - :mvn-cord:`2.11.0 </dhcpl2relay/2.11.0>`_
     - :mvn-cord:`X </dhcpl2relay-api/2.11.0>`_
     - :mvn-cord:`X </dhcpl2relay-app/2.11.0>`_
     - :mvn-cord:`X </dhcpl2relay>`_
     - :vol-ger:`X </dhcpl2relay/+/refs/tags/2.11.0>`_
     - :vol-git:`X </dhcpl2relay/releases/tag/2.11.0>`_
     -
   * - `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`__
     - :mvn-cord:`2.9.0 </onos-app-igmpproxy/2.9.0>`_
     - :mvn-cord:`X </onos-app-igmpproxy-api/2.9.0>`_
     - :mvn-cord:`X </onos-app-igmpproxy-app/2.9.0>`_
     - :mvn-cord:`X </onos-app-igmpproxy/2.9.0>`_
     - :vol-ger:`X </igmpproxy/+/refs/tags/2.9.0>`_
     - :vol-git:`X </igmpproxy/releases/tag/2.9.0>`_
     -
   * - `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`__
     - :mvn-cord:`2.13.2 </kafka/2.13.2>`_
     - :mvn-cord:`X </kafka-api/2.13.2>`_
     - :mvn-cord:`X </kafka-app/2.13.2>`_
     - :mvn-cord:`X </kafka/2.13.2>`_
     - :vol-ger:`X </kafka-onos/+/refs/tags/2.13.2>`_
     - :vol-git:`X </kafka-onos/releases/tag/2.13.2>`_
     - ``N``
   * - :vol-ger:`maclearner </mac-learning>`_
     - :mvn-cord:`1.2.3 </maclearner/1.2.3>`_
     - :mvn-cord:`X </maclearner-api/1.2.3>`_
     - :mvn-cord:`X </maclearner-app/1.2.3>`_
     - :mvn-cord:`X </maclearner>`_
     - :vol-ger:`X </mac-learning/+/refs/tags/1.2.3>`_
     - :vol-git:`X </mac-learning/releases/tag/1.2.3>`__, :vol-git:`T </mac-learning/tree/1.2.3>`_
     -
   * - `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`__
     - :mvn-cord:`2.9.1 </mcast/2.9.1>`_
     - :mvn-cord:`X </mcast-api/2.9.1>`_
     - :mvn-cord:`X </mcast-app/2.9.1>`_
     - :mvn-cord:`X </mcast/2.9.1>`_
     - :vol-ger:`X </mcast/+/refs/tags/2.9.1>`_
     - :vol-git:`X </mcast/releases/tag/2.9.1>`__, :vol-git:`T </mcast/tree/2.9.1>`_
     -
   * - `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`__
     - :mvn-cord:`5.2.6 </olt/5.2.6>`_
     - :mvn-cord:`X </olt-api/5.2.6>`_
     - :mvn-cord:`X </olt-app/5.2.6>`_
     - :mvn-cord:`X </olt/5.2.6>`_
     - :vol-ger:`X </olt/+/refs/tags/5.2.6>`_
     - :vol-git:`X </olt/releases/tag/5.2.6>`_
     -
   * - :vol-ger:`olttopology </olttopology/>`_
     - :mvn-cord:`1.3.1 </olttopology/1.3.1>`_
     - :mvn-cord:`X </olttopology-api/1.3.1>`_
     - :mvn-cord:`X </olttopology-app/1.3.1>`_
     - :mvn-cord:`X </olttopology>`_
     - :vol-ger:`X </olttopology/+/refs/tags/1.3.1>`_
     - :vol-git:`X </olttopology/releases/tag/1.3.1>`_
     -
   * - :vol-ger:`pppoeagent </pppoeagent/>`_
     - :mvn-cord:`1.3.0 </pppoeagent/1.3.0>`_
     - :mvn-cord:`X </pppoeagent-api/1.3.0>`_
     - :mvn-cord:`X </pppoeagent-app/1.3.0>`_
     - :mvn-cord:`X </pppoeagent>`_
     - :vol-ger:`X </pppoeagent/+/refs/tags/1.3.0>`_
     - :vol-git:`X </pppoeagent/releases/tag/1.3.0>`_
     -
   * - `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`__
     - :mvn-cord:`5.12.2 </sadis/5.12.2>`_
     - :mvn-cord:`X </sadis-api/5.12.2>`_
     - :mvn-cord:`X </sadis-app/5.12.2>`_
     - :mvn-cord:`X </sadis>`_
     - :vol-ger:`X </sadis/+/refs/tags/5.12.2>`_
     - :vol-git:`X </sadis/releases/tag/5.12.2>`_
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
     - :vol-ger:`Chart.yaml </voltha-helm-charts/+/refs/heads/master>`
     - `Gerrit <https://gerrit.opencord.org/admin/repos>`_
     - :vol-git:`Github`
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
     - :vol-ger:`2.2.1 </ofagent-go/+/refs/heads/voltha-2.12/VERSION>`
     - ``N/A``
     - :vol-ger:`X </ofagent-go/+/refs/tags/v2.2.1>`_
     - :vol-git:`X </ofagent-go/releases/tag/v2.2.1>`_
     - `1.1.4(stale) <https://hub.docker.com/layers/voltha/ofagent-go/1.1.4/images/sha256-8231111b69c8643c4981d64abff0a85d71f80763bb98632bb101e92b89882647?context=explore>`_
     - `1.6.5(stale) <https://pkg.go.dev/github.com/opencord/ofagent-go/cmd/ofagent>`_
     -
     -
   * - `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree>`_
     - :vol-ger:`3.5.4 </voltha-go/+/refs/heads/voltha-2.12/VERSION>`
     - ``N/A``
     - :vol-ger:`X </voltha-go/+/refs/tags/v3.5.4>`_
     - :vol-git:`X </voltha-go/releases/tag/v3.5.4>`_
     - ``N/A``
     - ``v7:?``
     -
     -
   * - :vol-ger:`voltha-lib-go </voltha-lib-go>`
     - :vol-ger:`7.5.3 </voltha-lib-go/+/refs/heads/master/VERSION>`
     - ``N/A``
     - :vol-ger:`X </voltha-lib-go/+/refs/tags/v7.5.3>`_
     - :vol-git:`X </voltha-lib-go/releases/tag/v7.5.3>`_
     - ``?``
     - `v7 <https://pkg.go.dev/github.com/opencord/voltha-lib-go/v7@v7.5.3>`__
     - ``?``
     -
   * - `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree>`_
     - ``5.1.10``
     - ``0.1.27``
     - :vol-ger:`X </voltha-onos/+/refs/tags/5.1.10>`_
     - :vol-git:`X </voltha-onos/releases/tag/5.1.10>`_
     - `X <https://hub.docker.com/layers/voltha/voltha-onos/5.1.10/images/sha256-d2498af38194a1cd01a1b9072a58af8647ed50fea2dbc9bd3ac4d4e4b583d72a?context=explore>`__
     -
     -
     - ``N``
   * - `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree>`_
     - :vol-ger:`4.4.11 </voltha-openolt-adapter/+/refs/heads/voltha-2.12/VERSION>`
     - :vol-ger:`2.12.6 </voltha-helm-charts/+/refs/heads/master/voltha-adapter-openolt/Chart.yaml#20>`
     - :vol-ger:`X </voltha-openolt-adapter/+/refs/tags/v4.4.11>`_
     - :vol-git:`X </voltha-openolt-adapter/releases/tag/v4.4.11>`_
     - `X <https://hub.docker.com/layers/voltha/voltha-openolt-adapter/4.4.11/images/sha256-eed64f687f6029f4cbf531162a10d5e496ea454878987ec0212cd5dbf4c6d9cf?context=explore>`__
     - ``N/A``
     - ``N/A``
     -
   * - `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree>`_
     - :vol-ger:`2.11.12 </voltha-openonu-adapter-go/+/refs/heads/voltha-2.12/VERSION>`
     - :vol-ger:`2.12.2 </voltha-helm-charts/+/refs/heads/master/voltha-adapter-openonu/Chart.yaml#17>`_
     - :vol-ger:`X </voltha-openonu-adapter-go/+/refs/tags/v2.11.12>`_
     - :vol-git:`X </voltha-openonu-adapter-go/releases/tag/v2.11.12>`_
     - `X <https://hub.docker.com/layers/voltha/voltha-openonu-adapter-go/2.11.12/images/sha256-e9484a8963d08748af5766a6a8ce7f7485efb384488bcf93840ecc1142d7ad74?context=explore>`__
     - `stale <https://pkg.go.dev/github.com/opencord/voltha-openonu-adapter-go>`_
     - ``N/A``
     -
   * - :vol-ger:`voltha-protos </voltha-protos>`
     - :vol-ger:`5.4.11 </voltha-protos/+/refs/heads/voltha-2.12/VERSION>`
     - ``N/A``
     - :vol-ger:`X </voltha-protos/+/refs/tags/v5.4.11>`_
     - :vol-git:`X </voltha-protos/releases/tag/v5.4.11>`_
     - `stale <https://hub.docker.com/r/voltha/voltha-protos/tags>`__
     - `stale <https://pkg.go.dev/github.com/opencord/voltha-protos>`__
     - `5.4.11 <https://pypi.org/project/voltha-protos/5.4.11>`__
     -
   * - :vol-git:`voltha-system-tests </voltha-system-tests/releases/tag/2.9.0>`_
     - ``2.12.13``
     -
     - :vol-ger:`X </voltha-system-tests/+/refs/tags/2.12.13>`_
     - :vol-git:`X </voltha-system-tests/tree/2.12.13>`_
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
     - :vol-ger:`Chart.yaml </voltha-helm-charts/+/refs/heads/master>`
     - `Gerrit <https://gerrit.opencord.org/admin/repos>`_
     - `Github <:vol-git:>`_
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
   * - :vol-ger:`voltha-docs </voltha-docs>`_ , `docs.voltha.org <https://docs.voltha.org>`
     - ``2.12.25``
     - ``N/A``
     - :vol-ger:`X </voltha-docs/+/refs/tags/2.12.25>`_
     - :vol-git:`X </voltha-docs/releases/tag/2.12.25>`_
     -
     -
     -
     - ``N``
   * - `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`__
     - ``1.16.3+``
     - ``4.8.6`` :vol-ger:`chart </voltha-helm-charts/+/refs/heads/voltha-2.12/bbsim/Chart.yaml>`_
     - :vol-ger:`X </bbsim>`_
     - :vol-git:`X </bbsim/tree/v1.14.4>`_
     - `X <https://hub.docker.com/layers/voltha/bbsim/1.14.4/images/sha256-c23de193c1d7cf8d32c48edfbec4bfa6c47dbeecd4b31d040da0255eeab2ec58?context=explore>`__
     - ``?``
     - ``?``
     - ``N``
   * - `Bbsim-sadis-server <https://gerrit.opencord.org/gitweb?p=bbsim-sadis-server.git;a=tree>`__
     - :vol-ger:`0.3.6 </bbsim-sadis-server/+/refs/heads/voltha-2.12/VERSION>`
     - :vol-ger:`0.3.3 </voltha-helm-charts/+/refs/heads/voltha-2.12/voltha-infra/Chart.yaml#45>`
     - :vol-ger:`X </bbsim-sadis-server/+/refs/tags/v0.3.6/VERSION>`_
     - :vol-git:`X </bbsim-sadis-server/releases/tag/v0.3.6>`_
     - `X <https://hub.docker.com/layers/voltha/bbsim-sadis-server/0.3.6/images/sha256-0ea9df1be13f8b1d0a8314cbf0e0800e4a4b7e2920ae3ce5e119abddb9359350?context=explore>`__
     -
     -
     - ``N``
   * - `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_
     - :vol-ger:`1.10.2 </voltctl/+/refs/heads/voltha-2.12/VERSION>`
     - ``N/A``
     - :vol-ger:`X </voltctl/+/refs/tags/v1.10.2>`_
     - `? <:vol-git:/voltctl/releases/tag/v1.10.2>`_
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
     - :vol-ger:`3.3.0 </voltha-helm-charts/+/refs/heads/voltha-2.12/VERSION>`
   * - Voltha
     - :vol-ger:`2.12.17 </voltha-helm-charts/+/refs/heads/master/voltha/Chart.yaml#20>`
   * - Voltha-infra
     - :vol-ger:`2.12.6 </voltha-helm-charts/+/refs/heads/master/voltha-infra/Chart.yaml#37>`_
   * - Voltha-stack
     - :vol-ger:`2.12.9 </voltha-helm-charts/+/refs/heads/master/voltha-stack/Chart.yaml#37>`

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
