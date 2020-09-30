VOLTHA 2.5 Release Notes
========================

Highlights
----------

After the successful completion of MVP 1.0 requirements in the last release (VOLTHA 2.4 -  July end),
this release of VOLTHA 2.5 together with ONOS 2.2.6 features several bug fixes as well as progress
towards meeting MVP 2.0 requirements. In particular, BAL software was upgraded to v3.4.7.5 which fixed
a critical bug in downstream bandwidth limiting, and the logging infrastructure was enhanced by employing
Jaeger for log-correlation, while also including the capability to import the logs in a deployed EFK
(Elasticsearch, Fluentd and Kibana) stack for persistence and analysis. In parallel, the Device Management
Interface brigade made its first release of the interface, and the GoLang based ONU adapter continued to
make progress with preliminary support for the DT and ATT workflows, showing remarkable performance
improvements over the python version. Significant progress was also made by incorporating the Turk Telekom
(TT) workflow in BBSim so that the latter can be used for development and deployed in scale tests similar to the ones
for AT&T and DT workflows. Additionally, preliminary support was added for soak testing and server-sizing. As part of a
multi-release effort to increase security of the system we introduced the capability to encrypt the OMCC GEM channel
and added static code checks to many of the services. Finally, while not part of the release, design discussions were
completed on a number of issues that are part of the MVP 2.0 requirements. We expect the implementation of such design
decisions will be completed in the next release.

Features & Improvements
-----------------------

- Across service Log correlation through Jaeger
- EFK (Elasticsearch, Fluentd and Kibana) log exporter stack integration including openolt logs
- OpenOnu Go implemented support for DT and ATT workflows and container restart.
- Device management interface release
- OFagent improvement to send packet ins only to the controller master instance, support for smaller flow chunks due to
  “heavier” flows in the TT workflow
- ONOS and ONOS apps improvements, including meter store fixes, support for multiple DHCP allocations, trap flows
modifications
- Encryption of the OMCC GEM channel
- BAL 3.4.7.5 including the downstream bandwidth limiting bugfix

Development/Deployment process
------------------------------

- ONOS helm chart improvements with app based liveliness and openflow ports exposure outside of the cluster
- Static code analysis (SCA) checks for the different services’ repo.

Test
----

- OLT Disable/enable test, ONOS HA test and some more
- BBSim Turk Telekom workflow support
- Turk Telekom scale job with 1 OLT 512 ONUs
- Initial Soak testing
- Initial Load measurement
- Openolt-scale-tester enhancements to provision up to 64 subscribers in parallel

Design Discussions
------------------

- Design discussions for error handling within the VOLTHA stack
- VOLTHA software upgrade, including ONOS
- Distinction between OLT reboot and openolt agent disconnect
- Security/ encryption through certs on gRPC channels (e.g. openolt agent-adapter)
- Initial evaluation of kafka to gRPC swap
- Moving flow replication down to the openolt agent
- LAG support
- OLT Software upgrade through DMI and standby/active partition
- Mac-learning as HostLocationProvider with security

Documentation
-------------

- Updated documentation with workflow specific orientation and published on https://docs.voltha.org

Known Issues
------------

- VOL-3377: The in-band interface on the OLT does not get IP sometimes. The workaround is to reboot the OLT through
  a watchdog script after a timeout waiting to get the IP.

Component Versions in VOLTHA 2.5 release
----------------------------------------

ONOS Apps:
++++++++++

- `aaa <https://gerrit.opencord.org/gitweb?p=aaa.git;a=summary>`_: ``2.1.0``
- `dhcpl2relay <https://gerrit.opencord.org/gitweb?p=dhcpl2relay.git;a=summary>`_: ``2.2.2``
- `igmpproxy <https://gerrit.opencord.org/gitweb?p=igmpproxy.git;a=summary>`_: ``2.1.2``
- `kafka <https://gerrit.opencord.org/gitweb?p=kafka-onos.git;a=summary>`_: ``2.4.0``
- `mcast <https://gerrit.opencord.org/gitweb?p=mcast.git;a=summary>`_: ``2.1.0``
- `olt <https://gerrit.opencord.org/gitweb?p=olt.git;a=summary>`_: ``4.2.1``
- `sadis <https://gerrit.opencord.org/gitweb?p=sadis.git;a=summary>`_: ``5.1.0``

VOLTHA Components:
++++++++++++++++++

`kind-voltha <https://gerrit.opencord.org/gitweb?p=kind-voltha.git>`_ -  ``5.1.6``

`Helm Charts (voltha-helm-charts) <https://gerrit.opencord.org/gitweb?p=voltha-helm-charts.git;a=tree;h=refs/heads/voltha-2.5>`_ - ``2.5.2``

- `bbsim <https://gerrit.opencord.org/gitweb?p=bbsim.git;a=tree>`_- ``1.1.1`` with `chart <https://gerrit.opencord.org/gitweb?p=helm-charts.git;a=tree;f=bbsim>`_ ``4.0.2``
- `voltha-go <https://gerrit.opencord.org/gitweb?p=voltha-go.git;a=tree;h=refs/heads/voltha-2.5>`_ - ``2.5.4`` with chart ``2.6.4``
- `ofagent-go <https://gerrit.opencord.org/gitweb?p=ofagent-go.git;a=tree;h=refs/heads/voltha-2.5>`_ - ``1.3.2``  with chart ``2.6.4``
- `voltctl <https://gerrit.opencord.org/gitweb?p=voltctl.git;a=tree>`_ - ``1.2.1``
- `voltha-openolt-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openolt-adapter.git;a=tree;h=refs/heads/voltha-2.5>`_ - ``2.5.6`` with chart ``2.6.4``
- `voltha-openonu-adapter <https://gerrit.opencord.org/gitweb?p=voltha-openonu-adapter.git;a=tree;h=refs/heads/voltha-2.5>`_ - ``2.5.0`` with chart ``2.5.0``
- `voltha-onos <https://gerrit.opencord.org/gitweb?p=voltha-onos.git;a=tree;h=refs/heads/voltha-2.5>`_ -  ``4.1.8`` with chart ``0.1.8``
- `openolt agent <https://gerrit.opencord.org/gitweb?p=openolt.git;a=tree;h=refs/heads/voltha-2.5>`_ - ``2.5.1``
