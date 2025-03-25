.. figure:: images/voltha.svg
   :alt: voltha- Release Notes
   :width: 40%
   :align: center


VOLTHA 2.13 Release Notes
=========================

Highlights
----------
With this release Voltha Go Controller (VGC) is introduced as a new Controller
instead of ONOS. VGC and ONOS both will still be available in this release.
Several bug resolutions and improvements are also done in this release.


New Features
-----------------------

- Added interfaces to protos to to be able to offload PPPoEIA and DHCP RA apps onto the OLT.

- Voltctl implementation to fetch  stats of offloaded Apps.

- New Controller (Voltha Go Controller) introduced.

- Added the ability to avoid reconciling the MEs with ONT after openonu-adapter restart.

- Implentation of getOnudistance in voltctl to fetch onu distance.


Test
----

- Improvement in openolt-adapter’s high memory and high CPU utilization during the reconcilation.

- Improvement in openonu-adapter’s memory consumption.


Bug Fixes
---------
Several bug fixes for reconciliation, ONU sw upgrade and device delete, reboot cases.
For a full list of resolved issues, see the `full release notes on Confluence <https://lf-broadband.atlassian.net/wiki/spaces/HOME/pages/135331843/Release+Notes+for+VOLTHA+Release+2.13>`_


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
   * - `VOL-5427 <https://lf-broadband.atlassian.net/browse/VOL-5427>`_
     - Multicast does not work for GPON TT test pipeline
   * - `VOL-5426 <https://lf-broadband.atlassian.net/browse/VOL-5426>`_
     - ONUs not in the state expected by the tests


Jira stories
------------
A full list of stories and bugs completed can be found under the
`VOLTHA 2.13 <https://lf-broadband.atlassian.net/projects/VOL/versions/10010>`_ release page in Jira.


Component Versions in VOLTHA 2.13 release
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
     - :mvn-cord:`2.11.2 <aaai/2.11.2>`
     - :mvn-cord:`X <aaa-api/2.11.2>`
     - :mvn-cord:`X <aaa-app/2.11.2>`
     - :mvn-cord:`X <aaa/2.11.2>`
     - :vol-ger:`X <aaa/+/refs/tags/2.11.2>`
     - :vol-git:`X <aaa/releases/tag/2.11.2>`
     -
   * - `bng <https://gerrit.opencord.org/gitweb?p=bng.git;a=summary>`__
     - :mvn-cord:`2.5.3 <bng/2.5.3>`
     - :mvn-cord:`X <bng-api/2.5.3>`
     - :mvn-cord:`X <bng-app/2.5.3>`
     - :mvn-cord:`X <bng/2.5.3>`
     - :vol-ger:`X <bng/+/refs/tags/2.5.3>`
     - :vol-git:`X <bng/releases/tag/2.5.3>`
     -
   * - `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`__
     - :mvn-cord:`2.11.2 <dhcpl2relay/2.11.2>`
     - :mvn-cord:`X <dhcpl2relay-api/2.11.2>`
     - :mvn-cord:`X <dhcpl2relay-app/2.11.2>`
     - :mvn-cord:`X <dhcpl2relay>`
     - :vol-ger:`X <dhcpl2relay/+/refs/tags/2.11.2>`
     - :vol-git:`X <dhcpl2relay/releases/tag/2.11.2>`
     -
   * - `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`__
     - :mvn-cord:`2.9.1 <onos-app-igmpproxy/2.9.1>`
     - :mvn-cord:`X <onos-app-igmpproxy-api/2.9.1>`
     - :mvn-cord:`X <onos-app-igmpproxy-app/2.9.1>`
     - :mvn-cord:`X <onos-app-igmpproxy/2.9.1>`
     - :vol-ger:`X <igmpproxy/+/refs/tags/2.9.1>`
     - :vol-git:`X <igmpproxy/releases/tag/2.9.1>`
     -
   * - `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`__
     - :mvn-cord:`2.13.3 <kafka/2.13.3>`
     - :mvn-cord:`X <kafka-api/2.13.3>`
     - :mvn-cord:`X <kafka-app/2.13.3>`
     - :mvn-cord:`X <kafka/2.13.3>`
     - :vol-ger:`X <kafka-onos/+/refs/tags/2.13.3>`
     - :vol-git:`X <kafka-onos/releases/tag/2.13.3>`
     - ``N``
   * - :vol-ger:`maclearner <mac-learning>`
     - :mvn-cord:`1.2.4 <maclearner/1.2.4>`
     - :mvn-cord:`X <maclearner-api/1.2.4>`
     - :mvn-cord:`X <maclearner-app/1.2.4>`
     - :mvn-cord:`X <maclearner>`
     - :vol-ger:`X <mac-learning/+/refs/tags/1.2.4>`
     - :vol-git:`X </mac-learning/releases/tag/1.2.4>`, :vol-git:`T <mac-learning/tree/1.2.4>`
     -
   * - `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`__
     - :mvn-cord:`2.9.3 <mcast/2.9.3>`
     - :mvn-cord:`X <mcast-api/2.9.3>`
     - :mvn-cord:`X <mcast-app/2.9.3>`
     - :mvn-cord:`X <mcast/2.9.3>`
     - :vol-ger:`X <mcast/+/refs/tags/2.9.3>`
     - :vol-git:`X </mcast/releases/tag/2.9.3>`, :vol-git:`T <mcast/tree/2.9.3>`
     -
   * - `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`__
     - :mvn-cord:`5.2.8 <olt/5.2.8>`
     - :mvn-cord:`X <olt-api/5.2.8>`
     - :mvn-cord:`X <olt-app/5.2.8>`
     - :mvn-cord:`X <olt/5.2.8>`
     - :vol-ger:`X <olt/+/refs/tags/5.2.8>`
     - :vol-git:`X <olt/releases/tag/5.2.8>`
     -
   * - :vol-ger:`olttopology <olttopology/>`
     - :mvn-cord:`1.3.1 <olttopology/1.3.1>`
     - :mvn-cord:`X <olttopology-api/1.3.1>`
     - :mvn-cord:`X <olttopology-app/1.3.1>`
     - :mvn-cord:`X <olttopology>`
     - :vol-ger:`X <olttopology/+/refs/tags/1.3.1>`
     - :vol-git:`X <olttopology/releases/tag/1.3.1>`
     -
   * - :vol-ger:`pppoeagent <pppoeagent/>`
     - :mvn-cord:`1.3.2 <pppoeagent/1.3.2>`
     - :mvn-cord:`X <pppoeagent-api/1.3.2>`
     - :mvn-cord:`X <pppoeagent-app/1.3.2>`
     - :mvn-cord:`X <pppoeagent>`
     - :vol-ger:`X <pppoeagent/+/refs/tags/1.3.2>`
     - :vol-git:`X <pppoeagent/releases/tag/1.3.2>`
     -
   * - `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`__
     - :mvn-cord:`5.12.3 <sadis/5.12.3>`
     - :mvn-cord:`X <sadis-api/5.12.3>`
     - :mvn-cord:`X <sadis-app/5.12.3>`
     - :mvn-cord:`X <sadis>`
     - :vol-ger:`X <sadis/+/refs/tags/5.12.3>`
     - :vol-git:`X <sadis/releases/tag/5.12.3>`
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
     - :vol-ger:`Chart.yaml <voltha-helm-charts/+/refs/heads/master>`
     - `Gerrit <https://gerrit.opencord.org/admin/repos>`_
     - :vol-git:`Github<>`
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
     - :vol-ger:`2.3.2 <ofagent-go/+/refs/heads/voltha-2.13/VERSION>`
     - ``N/A``
     - :vol-ger:`X <ofagent-go/+/refs/tags/v2.3.2>`
     - :vol-git:`X <ofagent-go/releases/tag/v2.3.2>`
     - `1.1.4(stale) <https://hub.docker.com/layers/voltha/ofagent-go/1.1.4/images/sha256-8231111b69c8643c4981d64abff0a85d71f80763bb98632bb101e92b89882647?context=explore>`_
     - `1.6.5(stale) <https://pkg.go.dev/github.com/opencord/ofagent-go/cmd/ofagent>`_
     -
     -
   * - `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree>`_
     - :vol-ger:`3.6.6 <voltha-go/+/refs/heads/voltha-2.13/VERSION>`
     - ``N/A``
     - :vol-ger:`X <voltha-go/+/refs/tags/v3.6.6>`
     - :vol-git:`X <voltha-go/releases/tag/v3.6.6>`
     - ``N/A``
     - ``v7:?``
     -
     -
   * - :vol-ger:`voltha-lib-go <voltha-lib-go>`
     - :vol-ger:`7.6.6 <voltha-lib-go/+/refs/heads/master/VERSION>`
     - ``N/A``
     - :vol-ger:`X <voltha-lib-go/+/refs/tags/v7.6.6>`
     - :vol-git:`X <voltha-lib-go/releases/tag/v7.6.6>`
     - ``?``
     - `v7 <https://pkg.go.dev/github.com/opencord/voltha-lib-go/v7@v7.6.6>`__
     - ``?``
     -
   * - `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree>`_
     - ``5.1.10``
     - ``0.1.27``
     - :vol-ger:`X <voltha-onos/+/refs/tags/5.1.10>`
     - :vol-git:`X <voltha-onos/releases/tag/5.1.10>`
     - `X <https://hub.docker.com/layers/voltha/voltha-onos/5.1.10/images/sha256-d2498af38194a1cd01a1b9072a58af8647ed50fea2dbc9bd3ac4d4e4b583d72a?context=explore>`__
     -
     -
     - ``N``
   * - `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree>`_
     - :vol-ger:`4.5.6 <voltha-openolt-adapter/+/refs/heads/voltha-2.13/VERSION>`
     - :vol-ger:`2.13.0 <voltha-helm-charts/+/refs/heads/master/voltha-adapter-openolt/Chart.yaml#20>`
     - :vol-ger:`X <voltha-openolt-adapter/+/refs/tags/v4.5.6>`
     - :vol-git:`X <voltha-openolt-adapter/releases/tag/v4.5.6>`
     - `X <https://hub.docker.com/layers/voltha/voltha-openolt-adapter/4.5.6/images/sha256-eed64f687f6029f4cbf531162a10d5e496ea454878987ec0212cd5dbf4c6d9cf?context=explore>`__
     - ``N/A``
     - ``N/A``
     -
   * - `voltha-openonu-adapter-go <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter-go.git;a=tree>`_
     - :vol-ger:`2.12.14 <voltha-openonu-adapter-go/+/refs/heads/voltha-2.13/VERSION>`
     - :vol-ger:`2.13.0 <voltha-helm-charts/+/refs/heads/master/voltha-adapter-openonu/Chart.yaml#17>`
     - :vol-ger:`X <voltha-openonu-adapter-go/+/refs/tags/v2.12.14>`
     - :vol-git:`X <voltha-openonu-adapter-go/releases/tag/v2.12.14>`
     - `X <https://hub.docker.com/layers/voltha/voltha-openonu-adapter-go/2.12.14/images/sha256-e9484a8963d08748af5766a6a8ce7f7485efb384488bcf93840ecc1142d7ad74?context=explore>`__
     - `stale <https://pkg.go.dev/github.com/opencord/voltha-openonu-adapter-go>`_
     - ``N/A``
     -
   * - :vol-ger:`voltha-protos <voltha-protos>`
     - :vol-ger:`5.6.2 <voltha-protos/+/refs/heads/voltha-2.13/VERSION>`
     - ``N/A``
     - :vol-ger:`X <voltha-protos/+/refs/tags/v5.6.2>`
     - :vol-git:`X <voltha-protos/releases/tag/v5.6.2>`
     - `stale <https://hub.docker.com/r/voltha/voltha-protos/tags>`__
     - `stale <https://pkg.go.dev/github.com/opencord/voltha-protos>`__
     - `5.6.2 <https://pypi.org/project/voltha-protos/5.6.2>`__
     -
   * - :vol-git:`voltha-system-tests <voltha-system-tests/releases/tag/v2.13.0>`
     - ``v2.13.0``
     -
     - :vol-ger:`X <voltha-system-tests/+/refs/tags/v2.13.0>`
     - :vol-git:`X <voltha-system-tests/tree/v2.13.0>`
     -
     -
     -
     - ``verify`` `VOL-5064 <https://lf-broadband.atlassian.net/browse/VOL-5064>`_
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
     - :vol-ger:`Chart.yaml <voltha-helm-charts/+/refs/heads/master>`
     - `Gerrit <https://gerrit.opencord.org/admin/repos>`_
     - :vol-git:`Github<>`
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
   * - :vol-ger:`voltha-docs <voltha-docs>` , `docs.voltha.org <https://docs.voltha.org>`
     - ``2.13.0``
     - ``N/A``
     - :vol-ger:`X <voltha-docs/+/refs/tags/2.13.0>`
     - :vol-git:`X <voltha-docs/releases/tag/2.13.0>`
     -
     -
     -
     - ``N``
   * - `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`__
     - ``1.16.7``
     - ``4.8.11`` :vol-ger:`chart <voltha-helm-charts/+/refs/heads/voltha-2.13/bbsim/Chart.yaml>`
     - :vol-ger:`X <bbsim>`
     - :vol-git:`X <bbsim/tree/v1.16.7>`
     - `X <https://hub.docker.com/layers/voltha/bbsim/1.16.7/images/sha256-c23de193c1d7cf8d32c48edfbec4bfa6c47dbeecd4b31d040da0255eeab2ec58?context=explore>`__
     - ``?``
     - ``?``
     - ``N``
   * - `Bbsim-sadis-server <https://gerrit.opencord.org/gitweb?p=bbsim-sadis-server.git;a=tree>`__
     - :vol-ger:`0.4.0 <bbsim-sadis-server/+/refs/heads/voltha-2.13/VERSION>`
     - :vol-ger:`0.3.5 <voltha-helm-charts/+/refs/heads/voltha-2.13/voltha-infra/Chart.yaml#45>`
     - :vol-ger:`X <bbsim-sadis-server/+/refs/tags/v0.4.0/VERSION>`
     - :vol-git:`X <bbsim-sadis-server/releases/tag/v0.4.0>`
     - `X <https://hub.docker.com/layers/voltha/bbsim-sadis-server/0.4.0/images/sha256-0ea9df1be13f8b1d0a8314cbf0e0800e4a4b7e2920ae3ce5e119abddb9359350?context=explore>`__
     -
     -
     - ``N``
   * - `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_
     - :vol-ger:`1.11.8 <voltctl/+/refs/heads/voltha-2.13/VERSION>`
     - ``N/A``
     - :vol-ger:`X <voltctl/+/refs/tags/v1.11.8>`
     - :vol-git:`? <voltctl/releases/tag/v1.11.8>`
     - ``N/A``
     - `X <https://pkg.go.dev/github.com/opencord/voltctl@v1.11.8>`__
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
     - :vol-ger:`3.5.0 <voltha-helm-charts/+/refs/heads/voltha-2.13/VERSION>`
   * - Voltha
     - :vol-ger:`2.13.0 <voltha-helm-charts/+/refs/heads/master/voltha/Chart.yaml#20>`
   * - Voltha-infra
     - :vol-ger:`2.13.0 <voltha-helm-charts/+/refs/heads/master/voltha-infra/Chart.yaml#37>`
   * - Voltha-stack
     - :vol-ger:`2.13.0 <voltha-helm-charts/+/refs/heads/master/voltha-stack/Chart.yaml#37>`

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
