.. _Makefile Target lint-chart:

LINT: lint-chart
================

Helm Charts
===========

### Command(s):

- `chart_version_check.sh <https://github.com/opencord/helm-repo-tools/blob/master/chart_version_check.sh>`_

.. code:: bash

    make clean
    make lint-chart 2>&1 | tee log

Sources:

- `makefiles/lint <https://github.com/opencord/voltha-helm-charts/tree/master/makefiles/lint>`__
- `makefiles/lint/helm/include.mk <https://github.com/opencord/voltha-helm-charts/blob/master/makefiles/lint/helm/include.mk>`_
- [`master <https://github.com/opencord/helm-repo-tools/tree/master>`__] `helm-repo-tools <https://github.com/opencord/helm-repo-tools>`_

|
