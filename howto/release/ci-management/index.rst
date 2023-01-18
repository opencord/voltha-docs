repo:ci-management
==================

General
-------

For an LTS release (v2.11, v2.8) tests on the master branch will need
to be copied into a named voltha-version folder and updated to checkout
and exercise tests and source on that branch.

`Jenkins Views <https://jenkins.opencord.org/>`_
------------------------------------------------
Begin by creating voltha-{LST} views for the new pipeline jobs.

jjb/software-upgrades.yaml
--------------------------

- Create a new software-upgrades-test-0211 branch from the old.
- Update released component versions mentioned in the configs.
- Update master branch released versions as well.
- Tricky part, SNAPSHOT versions are not visible to navigation browsing:

  - `org/opencord <https://oss.sonatype.org/content/groups/public/org/opencord>`_

- Instead obtain snapshot version from pom.xml and type in the explicit URL path:

  - `aaa-app/2.9.0-SNAPSHOT <https://oss.sonatype.org/content/groups/public/org/opencord/aaa-app/2.9.0-SNAPSHOT/>`_
