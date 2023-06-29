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

voltha-infra
^^^^^^^^^^^^

Once dependent packages are built update helm charts:  charts/index
- Verify by `installation <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts>`_

.. code:: bash

   helm upgrade --install --create-namespace -n infra --version 2.8.0 voltha-infra onf/voltha-infra

voltha-stack
^^^^^^^^^^^^

.. code:: bash

   helm upgrade --install --create-namespace \
       -n voltha voltha onf/voltha-stack \
       --set global.stack_name=voltha \
       --set global.voltha_infra_name=voltha-infra \
       --set global.voltha_infra_namespace=infra

Verify DT & TT
^^^^^^^^^^^^^^

`deploying-a-different-workflow <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts#deploying-a-different-workflow>`_

Update
https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-stack/Chart.yaml


Misc
^^^^

.. code:: bash

   helm upgrade --install -n voltha bbsim0 onf/bbsim --set olt_id=10

   # https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts#deploying-a-different-workflow
   kubectl get pods --all-namespaces


Voltha with golang source
-------------------------

Review all repositories that contain golang sources.
Version(s) of external packages in the vendor/ directory may need to be updated.

.. code-block: shell-session
   :linenos:
   :hilight: 2, 4

   # Clone repo:voltha-go
   git clone ssh://gerrit.opencord.org:29418/voltha-go.git

   cd voltha-go
   make help

.. list-table:: make targets
   :header-rows: 1
   :widths: 20,50

   * - Command
     - Description
   * - make lint
     - syntax check sources
   * - make lint-dockerfile
     - syntax check docker config
   * - make lint-mod
     - syntax check golang dependencies

.. list-table:: build & test targets
   :header-rows: 1
   :widths: 20,50

   * - Command
     - Description
   * - make build
     - Build core docker image
   * - make test
     - Requires docker, test local build
   * - make sca
     - Generate a static code analysis report

.. list-table:: Developer targets
   :header-rows: 1
   :widths: 20,50

   * - Command
     - Description
   * - make local-lib-go
     - Create a local version of voltha-lib-go beneath vendor/
   * - make local-protos
     - Create a local version of voltha-protos beneath vendor/
   * - make fmt
     - Run gofmt on sources
   * - make mod-update
     - Update go mod files

Review `voltha-helm-charts <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts>`_

Release voltha-protos & friends in order
----------------------------------------
https://docs.voltha.org/master/overview/release_process.html?highlight=charts%20yaml
