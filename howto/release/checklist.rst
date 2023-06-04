Release: Checklist
==================

docs.voltha.org (repo: voltha-docs)
-----------------------------------

- Create release notes
- Review core contributors

VOLTHA Repositories
-------------------

- Create release branch voltha-X.YY in each repository.
- Update .gitreview, assign `defaultbranch=voltha-2.12 <https://gerrit.opencord.org/c/pod-configs/+/33941/2/.gitreview>`_.

Release Builds
--------------

- components/onos_components
- Build and record version for all external VOLTHA dependencies.
- `VOL-4925 <https://jira.opencord.org/browse/VOL-4925>`_.
- Upgrade Maven Plugins listed in pom.xml

Packages
--------

- Package `aaa <https://gerrit.opencord.org/c/aaa/+/33599>`_

  - Versions

    - New 2.10.3
    - Old 2.9.0

  - DEPS: sadis

- Package `sadis <https://gerrit.opencord.org/plugins/gitiles/sadis/>`_

  - Versions

    - `New: 5.11.1-SNAPSHOT <https://gerrit.opencord.org/plugins/gitiles/sadis/+/refs/heads/master/pom.xml#30>`_
    - `Old: (5.10.0) <https://central.sonatype.com/artifact/org.opencord/sadis/5.10.0?smo=true>`_

  - VCS

    - `gerrit <https://gerrit.opencord.org/plugins/gitiles/sadis/+/refs/tags/5.11.0>`_
    - `github <https://github.com/opencord/sadis/tree/5.10.0>`_

  - DEPS:

Release Notes
-------------

- Capture version information and packages for all builds.

Helm Charts
-----------

Once dependent packages are built update helm charts:  charts/index
