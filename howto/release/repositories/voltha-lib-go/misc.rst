Misc Todo Items
===============

- Update copyright notices
- find . ! -path './vendor/\*' -print | xargs -n1 gofmt -s -e -w
- go.mod

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
