Modifying repository voltha-protos
==================================

#. Clone repository `voltha-protos <https://gerrit.opencord.org/plugins/gitiles/voltha-protos/+/refs/heads/master>`_
#. Modify structures, sources & makefiles as needed.
#. Build, test and lint locally to validate sources.
#. Commit changes, code review, jenins build and deploy.
#. Update external dependent repositories to use the new version.

Clone, edit, build & test
-------------------------

.. code:: bash

    git clone ssh://gerrit.opencord.org:29418/voltha-protos.git
    cd voltha-protos
    vi ...

    make build
    make test
    make lint

.. list-table:: Build & Test locally
   :widths: 30, 80
   :header-rows: 1

   * - Command
     - Description
   * - make sterile
     - Remove previously generated targets
   * - make protos
     - Generate prototypes for go, java & python (dependency for target:build)
   * - make build
     - make protos; compile: go, java & python
   * - make test
     - Validate proto changes
   * - make lint
     - Syntax check sources prior to commit.

Update all external repositories to consume the new repo:voltha-protos version
------------------------------------------------------------------------------

- Each external VOLTHA repository will need to have dependencies mentioned in
  the file go.mod updated.
- Rebuild each repository in hierarchial order also updating external libs as
  they are rebuilt.

External repositories to modify
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- bbsim
- bbsim-sadis-server
- ofagent-go
- voltctl
- voltha-api-server
- voltha-go
- voltha-helm-charts
- voltha-lib-go
- voltha-openolt-adapter
- voltha-openonu-adapter-go
- voltha-system-tests

.. list-table:: Foreach external repository
   :widths: 30, 80
   :header-rows: 1

   * - Command
     - Description
   * - vi {repo}/go.mod
     - Bump version of repo:voltha-proto to latest published
   * - vi {repo}/go.mod
     - Bump external module version(s) during hierarcical build.
   * - go mod edit -replace [...]
     - Use the go mod tool to update version of voltha-protos and friends.
   * - go mod tidy
     - Cleanup syntax issues in golang source that will fail your pending commit
   * - go mod vendor
     - | Update sources and dependencies beneath the vendor/ directory.
       | See also `go-mod-vendor <https://go.dev/ref/mod#go-mod-vendor>`_, `Packages & Modules <https://golangbyexample.com/packages-modules-go-second/>`_
   * - make build
     - Compile with updated module dependencies.
   * - make test
     - Sanity check everything is still working.
   * - make lint LOCAL_FIX_PERMS=1
     - | Syntax check sources for problems prior to checkin.
       | LOCAL_FIX_PERMS=1 (optional) can workaround docker related permission problems.

