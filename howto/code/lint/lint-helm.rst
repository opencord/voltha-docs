.. _Makefile Target lint-helm:

LINT: lint-helm
===============

Helm Charts
===========

Command(s):
- `helmlint.sh <https://gerrit.lfbroadband.org/plugins/gitiles/helm-repo-tools/+/refs/heads/master/helmlint.sh>`_

.. code:: bash

    make clean
    make lint-helm 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.lfbroadband.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/makefiles/lint/>`__
- `makefiles/lint/helm/include.mk <https://gerrit.lfbroadband.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/makefiles/lint/helm/include.mk>`_
- [`master <https://gerrit.lfbroadband.org/plugins/gitiles/helm-repo-tools/+/refs/heads/master>`__] `helm-repo-tools <https://gerrit.lfbroadband.org/plugins/gitiles/helm-repo-tools>`_

|
