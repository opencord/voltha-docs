jjb/software-upgrades.yaml
--------------------------

- Create a new software-upgrades-test-voltha-x.yy branch from master or existing
  jjb definitions in the yaml config file.
- Update released component version strings mentioned in the configs.
- Update master branch released versions as well.
- Tricky part, SNAPSHOT versions are not visible to navigation browsing:

  - `org/opencord <https://oss.sonatype.org/content/groups/public/org/opencord>`_

- Instead obtain snapshot version from pom.xml and type in the explicit URL path:

  - `aaa-app/2.9.0-SNAPSHOT <https://oss.sonatype.org/content/groups/public/org/opencord/aaa-app/>`_

  - `aaa.index <https://oss.sonatype.org/content/groups/public/org/opencord/aaa-app>`_

