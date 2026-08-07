RELEASE: voltha-helm-charts
===========================

- Repository `voltha-helm-charts <https://github.com/opencord/voltha-helm-charts/tree/master>`_.
- Modify `VERSION file <https://github.com/opencord/voltha-helm-charts/blob/master/VERSION>`_.

  - For release remove all version decorations: -dev, -SNAPSHOT

- Release job will publish to `cord-charts-repo <https://gerrit.lfbroadband.org/plugins/gitiles/cord-charts-repo/+/refs/heads/master>`_.

- lint/syntax checking

  - make test
    - make lint-chart
    - make lint-helm

onos
----

- Update ONOS components `voltha-infra/values.yaml <https://github.com/opencord/voltha-helm-charts/blob/master/voltha-infra/values.yaml>`_
