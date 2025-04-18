# Update Helm Chart for repo:votlha-openonu-adapter

## HOWTO: Helm Chart Update

- Update copyright notices :ref:`Release Task Copyright`
- Update VOLTHA artifact and chart versions :ref:`Release Task Helm Charts`

- Increment repository `VERSION file <https://gerrit.opencord.org/plugins/gitiles/voltha-openonu-adapter/+/refs/heads/master/VERSION>`_.  Build, test and deploy.
- Modify repo:voltha-helm-charts

  - Update component version in the component chart file.
  - Update chart version for all charts dependent on the component chart.
  - Run ``make lint-chart lint-helm`` to validate chart changes.
  - chart:voltha, chart:voltha-infra and chart:voltha-stack can be confusing
    due to a layer of indirection:

    - chart:voltha-{infra,stack} are not not named for code repositories,
      they are a container chart used to capture a list of dependencies
      and versions.
    - chart:voltha depends on these two charts which in turn depend on
      sets of voltha components & versions.
    - When ``make lint-chart`` report this error

      - [ERROR] Chart modified but version unchanged: voltha/Chart.yaml (2.12.11)
      - It will imply that a component like openonu-adapter has been updated
        but chart:voltha and chart:voltha-{infra,stack} have not.

.. list-table:: repo:voltha-helm-charts edits
   :widths: 10, 20, 60
   :header-rows: 1

   * - Repository Path
     - Key
     - Description
   * - `voltha-adapter-openonu/Chart.yaml <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-adapter-openonu/Chart.yaml>`_
     - Chart.yaml : appVersion
     - Assign `repo:voltha-openonu-adapter::VERSION <https://gerrit.opencord.org/plugins/gitiles/voltha-openonu-adapter/+/refs/heads/master/VERSION>`_ to `Chart.yaml::appVersion <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-adapter-openonu/Chart.yaml#35>`_
   * - `voltha-adapter-openonu/Chart.yaml <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-adapter-openonu/Chart.yaml>`_
     - Chart.yaml : version
     - Increment `ONU chart version <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-adapter-openonu/Chart.yaml#17>`_

   * - voltha-infra/Chart.yaml
     -
     -
   * - voltha-stack/Chart.yaml
     - dependencies : name=voltha-adapter-openonu :  version
     - Component openonu-adapter modified so update `dependencies : name='voltha-adapter-onu' : version="2.12.2" <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-stack/Chart.yaml#38>`_
   * - voltha-stack/Chart.yaml
     - Chart.yaml : version
     - voltha-adapter-openonu/Chart.yaml modified so notify voltha-stack. Update `version="2.12.2" <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-stack/Chart.yaml#30>`_.
   * - voltha-stack/Chart.yaml
     - dependency : name=voltha : version
     - voltha-stack/Chart.yaml modified so notify chart voltha.  Update `dependencies : name=voltha : version="2.12.14" <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha-stack/Chart.yaml#34>`_
   * - voltha/Chart.yaml
     - Chart.yaml : version
     - voltha/Chart.yaml updated so modify chart `Chart.yaml : version='"2.12.14"' <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha/Chart.yaml#17>`_
   * - voltha/Chart.yaml
     - Chart.yaml : version
     - Update `voltha/Chart.yaml : version='"2.12.14"' <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha/Chart.yaml#17>`_ to match `voltha-stack:dependencies : name=voltha : version='"2.12.14"' <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/voltha/Chart.yaml#17>`_.

### Extra Credit

- Update copyright notices :ref:`Release Task Copyright`
- make lint # lint everything

.. seealso::

   `voltha-docs::charts <../charts/index>`
