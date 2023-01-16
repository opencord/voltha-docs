VOLTHA Components: ONOS Dependencies
====================================

ONOS components are maintained by a series of maven projects.
Releasing individual components will require:

- Build and release dependencies:

  - Three jenkins jobs

    - modify version in pom.xml for release (remove -SNAPSHOT)
    - publish artifact to maven central.
    - modify version in pom.xml for release (append -SNAPSHOT)

  - Three manual operations:

    - Review and approve pull request to create a pom.xml release version.
    - Release artifact to maven central.
    - Review and approve pull request to create a pom.xml non-release version.

  - Long idle window(s)

First submit nop jobs to verify the packages can build and test cleanly.
Bulk update copyright notice dates or modify comments within sources and submit.

Search pom.xml for package version string
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

component sadis

Package version strings should contain the suffix -SNAPSHOT.

.. code:: bash

   aaa/pom.xml
   aaa/api/pom.xml
   aaa/app/pom.xml

.. code:: XML

   <artifactId>sadis</artifactId>
   <version>5.10.0-SNAPSHOT</version>
   <packaging>pom</packaging>

   <properties>
      <sadis.api.version>5.10.0-SNAPSHOT</sadis.api.version>
   </properties>


Next search pom.xml for dependent packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

component: aaa

Dependent package version strings will be a released (non-SNAPSHOT) version.

.. code:: XML

   <properties>
      <sadis.api.version>5.10.0</sadis.api.version>
      <aaa.api.version>2.8.0-SNAPSHOT</aaa.api.version>
   </properties>


Dependency Hierarchy
--------------------

Components are built and released in version hiearchy order.

sadis
^^^^^

- Verify -SNAPSHOT version string is present.
- Dependent components: none
- Scan pom.xml for version dependencies:

.. code:: XML

   <sadis.api.version>5.10.0-SNAPSHOT</sadis.api.version>


aaa
^^^

- Verify -SNAPSHOT version string is present.
- Dependent components: sadis
- Modify pom.xml, update released version strings

.. code:: XML

   <sadis.api.version>5.10.0</sadis.api.version>


dhcpl2relay
^^^^^^^^^^^

- Verify -SNAPSHOT version string is present.
- Dependent components: sadis
- Modify pom.xml, update released version strings

.. code:: XML

   <sadis.api.version>5.10.0</sadis.api.version>

igmpproxy
^^^^^^^^^

- Verify -SNAPSHOT version string is present.
- Dependent components: sadis
- Modify pom.xml, update released version strings

.. code:: XML

   <sadis.api.version>5.10.0</sadis.api.version>

kafka
^^^^^

- Verify -SNAPSHOT version string is present.
- Dependent components: aaa, bng, dhcpl2relay, igmp, mcast, olt, sadis
- Modify pom.xml, update released version strings

.. code:: XML

   <aaa.api.version>x.x.x</aaa.api.version>
   <bng.api.version>x.x.x</bng.api.version>
   <dhcpl2relay.api.version>x.x.x</dhcpl2relay.api.version>
   <igmp.api.version>x.x.x</igmp.api.version>
   <mcast.api.version>x.x.x</mcast.api.version>
   <olt.api.version>x.x.x</olt.api.version>
   <sadis.api.version>5.10.0</sadis.api.version>

mcast
^^^^^

- Verify -SNAPSHOT version string is present.
- Dependent components: sadis
- Modify pom.xml, update released version strings

.. code:: XML

   <sadis.api.version>5.10.0</sadis.api.version>

olt
^^^

- Verify -SNAPSHOT version string is present.
- Dependent components: sadis
- Modify pom.xml, update released version strings

.. code:: XML

   <sadis.api.version>5.10.0</sadis.api.version>

maclearner
^^^^^^^^^^

pppoeagent
^^^^^^^^^^

segmentrouting
^^^^^^^^^^^^^^
