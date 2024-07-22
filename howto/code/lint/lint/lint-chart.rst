.. _Makefile Target lint-chart:

LINT: lint-chart
================

Helm Charts
===========

### Command(s):

- `chart_version_check.sh <https://gerrit.opencord.org/plugins/gitiles/helm-repo-tools/+/refs/heads/master/chart_version_check.sh>`_

.. code:: bash

    make clean
    make lint-chart 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/makefiles/lint/>`__
- `makefiles/lint/helm/include.mk <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/makefiles/lint/helm/include.mk>`_
- [`master <https://gerrit.opencord.org/plugins/gitiles/helm-repo-tools/+/refs/heads/master>`__] `helm-repo-tools <https://gerrit.opencord.org/plugins/gitiles/helm-repo-tools>`_

|
