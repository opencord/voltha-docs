Misc Todo Items
===============

- Baseline build

  - Update copyright notice.
  - find . ! -path './vendor/\*' -name '*.go' -print0 | xargs -0 -n1 gofmt -s -e -w

- Pre-branch build
  - Update module versions for voltha/onos components
  - make mod-update

- Chart.yaml

  - Update version string(s) for voltha-lib-go.
