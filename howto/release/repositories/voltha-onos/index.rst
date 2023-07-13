Repository: voltha-onos
=======================

- make sterile distclean
- find . ! -path './vendor/*' -name '*.go' -print0 | xargs -0 gofmt -s -w
- make mod-update
- make lint
- make help

Charts
------
  o voltha-helm-charts/voltha-infra/values.yaml
