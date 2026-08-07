.. _Makefile Target lint-helm:

LINT: lint-helm
===============

Helm Charts
===========

Command(s):
- `helmlint.sh <https://github.com/opencord/helm-repo-tools/blob/master/helmlint.sh>`_

.. code:: bash

    make clean
    make lint-helm 2>&1 | tee log

Sources:

- `makefiles/lint <https://github.com/opencord/voltha-helm-charts/tree/master/makefiles/lint>`__
- `makefiles/lint/helm/include.mk <https://github.com/opencord/voltha-helm-charts/blob/master/makefiles/lint/helm/include.mk>`_
- [`master <https://github.com/opencord/helm-repo-tools/tree/master>`__] `helm-repo-tools <https://github.com/opencord/helm-repo-tools>`_

|
