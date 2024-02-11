.. _Makefile Target lint-robot:

LINT: lint-robot
================

Robot Testing Framework (python)
================================

Command: rflint `robotframework-lint <https://pypi.org/project/robotframework-lint/>`_

.. code:: bash

    make clean
    make lint           2>&1 | tee log
    make lint-robot-all 2>&1 | tee log
    make lint-robot-mod 2>&1 | tee log
    make lint-robot-src 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__
- `makefiles/lint/robot/*.mk <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/robot>`_

.. seealso:

`robotframework.org <https://robotframework.org>`_
