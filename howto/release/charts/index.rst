RELEASE: voltha-helm-charts
===========================

- Repository `voltha-helm-charts <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master>`_.
- Modify `VERSION file <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/VERSION>`_.

  - For release remove all version decorations: -dev, -SNAPSHOT

- Release job will `publish to <https://gerrit.opencord.org/plugins/gitiles/cord-charts-repo/+/refs/heads/master>`_.

- lint/syntax checking

  - make test
    - make lint-chart
    - make lint-helm
