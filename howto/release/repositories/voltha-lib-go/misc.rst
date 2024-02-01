Misc Todo Items
===============

- Baseline build

  - Update copyright notices :ref:`Release Task Copyright`
  - Golang syntax formatting :ref:`Release Task Golang Syntax`

- Pre-branch build

  - Update module versions for voltha/onos components
  - make mod-update

- Build

  - make help
  - make LOCAL_FIX_PERMS=1 lint
  - make distclean
  - make LOCAL_FIX_PERMS=1 mod-update
  - make LOCAL_FIX_PERMS=1 build
  - make LOCAL_FIX_PERMS=1 test

    - Cannot test locally: cannot access data directory: mkdir volthalib.db.kvstore

- Chart.yaml

  - Update version string(s) for voltha-lib-go.
