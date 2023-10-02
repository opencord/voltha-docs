Source code syntax checking
===========================

Getting Started
---------------

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


All Sources
+++++++++++

The generic lint target can be used to invoke all defined lint targets.

.. code:: bash

    make clean
    make lint 2>&1 | tee log

|


Makefile help
~~~~~~~~~~~~~

Individual Makefiles support a help target that will display a list of
targets and functionality supported.

.. code:: bash

    make help
    make help-verbose
    make help VERBOSE=1

|


doc8 / RST files
++++++++++++++++

Command: `doc8 <https://pypi.org/project/doc8/>`_

.. code:: bash

    make clean
    make lint                2>&1 | tee log
    make lint-doc8-all      2>&1 | tee log
    make lint-doc8-modified 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__
- makefiles/lint/doc8.mk

Notes:

- lint-doc8-all target dependency will create a `python virtual env <https://wiki.opennetworking.org/display/JOEY/PythonVenv>`_
- python 3.10+ requires `virtual env patching <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/patches/>`_ (dynamic, applied when needed).
- `makefiles/patches/include.mk <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/makefiles-orig/patches/>`__

|


python: flake8
++++++++++++++

Command: `flake8 <https://flake8.pycqa.org/en/latest>`_

.. code:: bash

    make clean
    make lint                 2>&1 | tee log
    make lint-flake8-all      2>&1 | tee log
    make lint-flake8-modified 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__
- makefiles/lint/flake8.mk

Notes:

- lint-flake8-all target dependency will create a `python virtual env <https://wiki.opennetworking.org/display/JOEY/PythonVenv>`_
- python 3.10+ requires `virtual env patching <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/patches/>`_ (dynamic, applied when needed).
- `makefiles/patches/include.mk <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/makefiles-orig/patches/>`__

|

Helm Charts
+++++++++++

Command(s):
- `helmlint.sh <https://gerrit.opencord.org/plugins/gitiles/helm-repo-tools/+/refs/heads/master/helmlint.sh>`_

.. code:: bash

    make clean
    make lint-chart lint-helm 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/makefiles/lint/>`__
- `makefiles/lint/helm/include.mk <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master/makefiles/lint/helm/include.mk>`_
- [`master <https://gerrit.opencord.org/plugins/gitiles/helm-repo-tools/+/refs/heads/master>`__] `helm-repo-tools <https://gerrit.opencord.org/plugins/gitiles/helm-repo-tools>`_

|


Golang
++++++

Command:

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__

|


JSON
++++

Command: `json.tool <https://docs.python.org/3/library/json.html>`_

.. code:: bash

    make clean
    make lint               2>&1 | tee log
    make lint-json-all      2>&1 | tee log
    make lint-json-modified 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__
- `makefiles/lint/json.mk <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/json.mk>`_

|


License / Copyright notice
++++++++++++++++++++++++++

Command:

.. code:: bash

    make clean
    make lint-license 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/voltha-system-tests/+/refs/heads/master/makefiles/lint>`__
- `makefiles/lint/license.mk <https://gerrit.opencord.org/plugins/gitiles/voltha-system-tests/+/refs/heads/master/makefiles/lint/license/include.mk>`_

|


python: pylint
++++++++++++++

Command: `pylint <https://www.pylint.org/>`_

.. code:: bash

    make clean
    make lint                 2>&1 | tee log
    make lint-pylint-all      2>&1 | tee log
    make lint-pylint-modified 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__
- makefiles/lint/pylint.mk
- `makefiles/patches/include.mk <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/makefiles-orig/patches/>`__

Notes:

- pylint the --py3k option is no longer supported by v3.10+
- lint-pylint-all target dependency will create a `python virtual env <https://wiki.opennetworking.org/display/JOEY/PythonVenv>`_
- python 3.10+ requires `virtual env patching <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/patches/>`_ (dynamic, applied when needed).

|


Robot
+++++

Command: rflint `robotframework-lint <https://pypi.org/project/robotframework-lint/>`_

.. code:: bash

    make clean
    make lint                2>&1 | tee log
    make lint-robot-all      2>&1 | tee log
    make lint-robot-modified 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__
- `makefiles/lint/robot.mk <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/robot.mk>`_

|


reStructedTextFile (rst)
++++++++++++++++++++++++

Command: `doc8 <https://pypi.org/project/doc8/>`_

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__
- `Makefiles::doc8 <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/Makefile#98>`_

|


Shell
+++++

Command: `shellcheck <https://github.com/koalaman/shellcheck>`_

.. code:: bash

    make clean
    make lint                2>&1 | tee log
    make lint-shell-all      2>&1 | tee log
    make lint-shell-modified 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__
- `makefiles/lint/shell.mk <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/shell.mk>`_

|


Yaml
++++

Command: `yamllint <https://yamllint.readthedocs.io/en/stable/>`_

.. code:: bash

    make clean
    make lint           2>&1 | tee log
    make lint-yaml-all  2>&1 | tee log
    make lint--modified 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__
- `makefiles/lint/yaml.mk <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/yaml.mk>`_

|


Bugs
~~~~

- `jira::VOLTHA <https://jira.opencord.org/projects/VOL>`-
- Include repository URL
- Include gerrit/github changeset if available.
- A logfile snippet of the error and surrounding context.

|


Repositories
++++++++++++

- [`master <https://gerrit.opencord.org/plugins/gitiles/bbsim/+/refs/heads/master>`__] `bbsim <https://gerrit.opencord.org/plugins/gitiles/bbsim>`_
- [`master <https://gerrit.opencord.org/plugins/gitiles/pod-configs/+/refs/heads/master>`__] `pod-configs <https://gerrit.opencord.org/plugins/gitiles/pod-configs>`_
- [`master <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master>`__] `voltha-docs <https://gerrit.opencord.org/plugins/gitiles/voltha-docs>`_
- [`master <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master>`__] `voltha-helm-charts <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts>`_
- [`master <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master>`__] `voltha-docs <https://gerrit.opencord.org/plugins/gitiles/voltha-docs>`_

|


Notes
~~~~~

- Volume problem reports require cleanup before linting can become a default.

  - After bulk linting problems for a language source have been cleaned up
    default linting can be enabled by modifing {project-root}/config.mk.

- Lint target support is globally available across repositories, given time
  it will be.  Submit patches as needed or open a jira ticket to request
  linting support in specific repositories.
- Makefile refactoring: yes absolutely! Baby steps are needed in the interim...

|
