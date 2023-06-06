VOLTHA Components: ONOS Dependencies
====================================

ONOS components are maintained by a series of maven projects.
Releasing individual components will require:

- Build and release dependencies:

  - Three jenkins jobs

    - modify version in pom.xml for release (remove -SNAPSHOT) for release.
    - publish artifact to Maven Central.
    - modify version in pom.xml for release (append -SNAPSHOT) for development.

  - Four manual operations:

    - Review and approve pull request to create a pom.xml release version.
    - Stage Maven Central deployment on a Nexus server.
    - Release artifact to maven central.
    - Review and approve pull request to create a pom.xml non-release version.

  - Long idle window(s): some 10 hours or more.

First submit nop jobs to verify the packages can build and test cleanly.
Bulk update copyright notice dates or modify comments within sources and submit.
Once pakges build and test clenaly initiate a release job.

Search pom.xml for package version string
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table:: Semantic Version Strings
   :header-rows: 1
   :widths: 20,5,50

   * - Version
     - Published
     - Description
   * - 5.11.0-SNAPSHOT
     - No
     - Development version string
   * - 5.11.0
     - Yes
     - Production version string

Component: pom.xml
------------------

Verify package and package.api version string state
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Prior to release suffix-SNAPSHOT will be visible.

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


Update dependent components, apis, ...
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

component: aaa
dependency: sadis

Dependent package version strings will be a released (non-SNAPSHOT) version.

.. code:: XML

   <properties>
      <sadis.api.version>5.10.0</sadis.api.version>
      <aaa.api.version>2.8.0-SNAPSHOT</aaa.api.version>
   </properties>

Update Maven plugin versions for security, bugs, logs, etc
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code:: XML

   <!-- SpotBugs Static Analysis -->
   <plugin>
       <groupId>com.github.spotbugs</groupId>
       <artifactId>spotbugs-maven-plugin</artifactId>
       <version>4.7.3.4</version>
   </plugin>

   <plugin>
       <groupId>com.h3xstream.findsecbugs</groupId>
       <artifactId>findsecbugs-plugin</artifactId>
       <version>1.12.0</version>
   </plugin>

Update copyright notice to be inclusive of the year last modified
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Copyright notice syntax <https://github.com/joey-onf/copyright>`_

.. code:: XML

   <?xml version="1.0" encoding="UTF-8"?>
   <!--
     ~ Copyright 2017-2023 Open Networking Foundation (ONF) and the ONF Contributors
     ~
     ~ Licensed under the Apache License, Version 2.0 (the "License");
   -->


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


Validate release(d) version information
---------------------------------------

- Visit Maven Central.
- Sanity check deployed pom.xml files contain correct

  - Package and api versions.
  - ONOS package version
  - Dependent package version.

- Yes an automation script should be created for this task.
- A jenkins job can be run post deployment to perform validation.

  - Input would be a config file containing expected versions.
  - For complete coverage the job could be run:

    - pre-release: validate incoming SNAPSHOT version(s).
    - post-release: verify deployed artifact and pom.xml versions.
    - post-validation: jenkins would increment expected versions.

- TODO: Start by creating a config file populated with version strings.

  - Static text can be used to maintain docs.voltha.org/release_notes/
  - Config would also be used as input to voltha-release (hardcoded values).
