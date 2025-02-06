ONOS Component: kafka-onos
==========================

- `repository:kafka-onos <https://gerrit.opencord.org/plugins/gitiles/kafka-onos>`_

Dependencies (pom.xml)
----------------------

- `pom.xml <https://gerrit.opencord.org/plugins/gitiles/kafka-onos/+/refs/heads/master/pom.xml>`_

  - `onos-dependencies <https://gerrit.opencord.org/plugins/gitiles/kafka-onos/+/refs/heads/master/pom.xml#24>`_
  - `properties <https://gerrit.opencord.org/plugins/gitiles/kafka-onos/+/refs/heads/master/pom.xml#35>`_

- `app.xml <https://gerrit.opencord.org/plugins/gitiles/kafka-onos/+/refs/heads/master/app.xml#30>`_

  - Contains packages and versions (onos versions detailed elsewhere)
  - artifact: kafka-clients

- `features.xml <https://gerrit.opencord.org/plugins/gitiles/kafka-onos/+/refs/heads/master/features.xml>`_

Dependencies: Maven Plugins
---------------------------

- spotbugs-maven-plugin
- findsecbugs-plugin

Dependencies: Components
------------------------

.. code:: XML

   <properties>
     <onos.app.name>org.opencord.kafka</onos.app.name>
     <onos.app.title>Kafka integration</onos.app.title>
     <onos.app.url>http://opencord.org</onos.app.url>
     <onos.app.readme>Integration with Kafka event bus</onos.app.readme>
     <aaa.api.version>2.10.3</aaa.api.version>
     <olt.api.version>5.2.4</olt.api.version>
     <dhcpl2relay.api.version>2.10.0</dhcpl2relay.api.version>
     <bng.api.version>2.5.0</bng.api.version>
     <sadis.api.version>5.11.1</sadis.api.version>
     <igmp.api.version>2.7.0</igmp.api.version>    <<---- ?!?!?!?!
     <mcast.api.version>2.9.0</mcast.api.version>
   </properties>

Artifacts: Maven Central
------------------------

- `Maven Central Index <https://repo.maven.apache.org/maven2/>`_
- pkg (?)
- app (?)
- api (?)

See Also
--------

- `VOL-5072 <https://lf-broadband.atlassian.net/browse/VOL-5072>`_
- `VOL-5073 <https://lf-broadband.atlassian.net/browse/VOL-5073>`_
