Development & Source Code
=========================

.. toctree::
   :maxdepth: 1

   lint-chart
   lint-helm
   lint-robot
   fix-errors/index
   pre-commit


======================================
Makefile Lint Targets: Syntax Checking
======================================

Targets
=======

.. code:: bash

    git clone ssh://gerrit.opencord.org:29418/voltha-helm-charts.git
    cd voltha-helm-charts
    make help | grep lint
    lint-chart                    chart_version_check.sh
    lint-doc8                     Syntax check *.rst documentation files.
    lint-helm                     Syntax check helm configs
    lint-json                     Syntax check json sources
    lint-license                  Verify sources contain a license block.
    lint-robot                    Syntax check robot sources using rflint
    lint-shell                    Syntax check bash,bourne,etc sources
    lint-yaml                     Syntax check yaml source using yamllint
    UNSTABLE=                     Build targets prone to failure (lint-helm)

    [PYTHON]
    lint-python                   Syntax check using available python tools
    lint-flake8                   Syntax check using tool flake8
    lint-pylint                   Syntax check using tool pylint

|

.. seealso::

   - :ref:`Makefile Target lint-chart`
   - :ref:`Makefile Target lint-helm`
   - :ref:`Makefile Target lint-robot`
   - :ref:`Makefile Target lint-pre-commit`
