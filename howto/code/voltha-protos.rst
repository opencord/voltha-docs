.. howto_code_voltha-protos:

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

    % make lint
    % make build
    % make test

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

.. list-table:: External repositories to modify
   :widths: 30, 80
   :header-rows: 1

   * - Repository
     - File(s) to edit
   * - bbsim
     - `go.mod <https://gerrit.opencord.org/plugins/gitiles/bbsim/+/refs/heads/master/go.mod>`_
   * - ofagent-go
     - `go.mod <https://gerrit.opencord.org/plugins/gitiles/ofagent-go/+/refs/heads/master/go.mod>`__
   * - voltctl
     - `go.mod <https://gerrit.opencord.org/plugins/gitiles/voltctl/+/refs/heads/master/go.mod>`__
   * - voltha-go
     - `go.mod <https://gerrit.opencord.org/plugins/gitiles/voltha-go/+/refs/heads/master/go.mod>`__
   * - voltha-go-controller
     - `go.mod <https://gerrit.opencord.org/plugins/gitiles/voltha-go-controller/+/refs/heads/master/go.mod>`__
   * - voltha-lib-go
     - `go.mod <https://gerrit.opencord.org/plugins/gitiles/voltha-lib-go/+/refs/heads/master/go.mod>`__
   * - voltha-openolt-adapter
     - `go.mod <https://gerrit.opencord.org/plugins/gitiles/voltha-openolt-adapter/+/refs/heads/master/go.mod>`__
   * - voltha-openonu-adapter-go
     - `go.mod <https://gerrit.opencord.org/plugins/gitiles/voltha-openonu-adapter-go/+/refs/heads/master/go.mod>`__
   * - voltha-system-tests
     - `requirements.txt <https://gerrit.opencord.org/plugins/gitiles/voltha-system-tests/+/refs/heads/master/requirements.txt>`_ (virtualenv/testing)

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

Problems with pip install
-------------------------

- grpcio `VOL-5348 <https://jira.opencord.org/browse/VOL-5348>`__

  - Clone repo.
  - Create a skeleton pytyon virtualenv.
  - From requirements.txt file entries, pip install failing versioned package.

.. code:: bash

   :caption: Pip install debugging

   # Debug using virtualenv
   % virtualenv -p python3 .venv
   % source .venv/bin/activate
   % pip install grpcio==1.39.0

   # Debug using makefile target 'venv'
   % echo > requirements.txt
   % make venv
   % git checkout requirements.txt
   % pip install -r requirements.txt

longintrepr.h
^^^^^^^^^^^^^

.. code:: bash

   :caption: Include missing header

   mkdir -p include
   pusdh include
   find /usr/include -name 'longintrepr.h' -print0 | xargs -0 -I'{}' ln -s {} .
   popd include
   export CFLAGS='-I./include'
