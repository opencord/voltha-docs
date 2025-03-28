.. _code--makefile-lint-targets:

======================================
Makefile Lint Targets: Syntax Checking
======================================

Makefile Linting: By language
-----------------------------

.. code:: bash

    % git clone ssh://gerrit.opencord.org:29418/onf-make.git
    % cd onf-make

    % make help | grep lint
    lint-chart                    chart_version_check.sh
    lint-doc8                     Syntax check *.rst documentation files.
    lint-helm                     Syntax check helm configs
    lint-json                     Syntax check json sources
    lint-license                  Verify sources contain a license block.
    lint-robot                    Syntax check robot sources using rflint
    lint-shell                    Syntax check bash,bourne,etc sources
    lint-yaml                     Syntax check yaml source using yamllint

    [PYTHON]
    lint-python                   Syntax check using available python tools
    lint-flake8                   Syntax check using tool flake8
    lint-pylint                   Syntax check using tool pylint

|

Makefile Linting: By language target
------------------------------------

.. list-table:: Bulk sandbox linting
   :widths: 20, 60
   :header-rows: 1

   * - Make Target
     - Description
   * - help | grpe lint
     - Display available help for lint targets and flags.
   * - make lint
     - Invoke all source linters, linting is conditional by language.

.. list-table:: Language and tool specific linting targets
   :widths: 20, 60
   :header-rows: 1

   * - lint-{topic}-help
     - Display extended help for a topic, supported targets and flags, etc.
   * - lint-{topic}-all
     - Lint everything available by file extension.
   * - lint-{topic}-mod
     - Lint locally modified files (git ls-files -m | lint)
   * - lint-{topic}-src
     - Lint a list of files passed in  (make lint-{topic}-src VAR=list-of-files)

.. seealso::

   - :ref:`Makefile Target lint-chart`
   - :ref:`Makefile Target lint-helm`
   - :ref:`Makefile Target lint-robot`

|

All Sources
===========

The generic lint target can be used to invoke all defined lint targets.

.. code:: bash

    make clean
    make lint 2>&1 | tee log

|

Makefile help
=============

Individual Makefiles support a help target that will display a list of
targets and functionality supported.

.. code:: bash

    make help
    make help | grep {topic}

.. list-table:: help
   :widths: 20, 60
   :header-rows: 1

   * - Make Target
     - Description
   * - help
     - Display available help for targets and flags
   * - make help | lint-{topic}
     - Display summary usage for lint-doc8, lint-license, lint-make
   * - lint-{topic}-help
     - Display extended help for a topic, supported makefile targets, etc

Legacy Help Usage
-----------------

.. code:: bash

    make help
    make help-verbose
    make help VERBOSE=1

|


doc8 / restructuredText (rst)
=============================

Command: `doc8 <https://pypi.org/project/doc8/>`_

.. list-table:: Makefile Targets
   :widths: 20, 60
   :header-rows: 1

   * - Target
     - Description
   * - help
     - Display item ``lint-doc8`` as a summary help topic item.
   * - lint-doc8-help
     - Display extended help for ``lint-doc8`` targets
   * -
     -
   * - lint-doc8
     - Build system lint target used to syntax check restructuredText sources.
   * - lint-doc8-all
     - Filesystem traversal, check all ``*.rst`` sources.
   * - lint-doc8-mod
     - Syntax check locally modified files (~git status)
   * - lint-doc8-src
     - Syntax check a list of files passed in as an argument.
   * -
     -
   * - lint-doc8-install
     - Dependency driven installation of the doc8 tool.

.. code:: bash

    make clean
    make lint-doc8 2>&1 | tee log

    make lint   # supported by repositories that define lint-doc8 as a default target.

.. list-table:: Sources
   :widths: 20, 60
   :header-rows: 1

   * - Source
     - Description
   * - `makefiles/lint/doc8/include.mk <http://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/doc8/include.mk>`_
     - Main makefile logic for syntax checking RST sources.
   * - `makefiles/lint/doc8/install.mk <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/doc8/install.mk>`_
     - Dependency logic to install the doc8 tool when needed.
   * - `makefiles/lint/doc8/excl.mk <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/doc8/install.mk>`_
     - Common doc8 exclusion patterns for all repositories.

See Also
--------

- lint-doc8-all target dependency will create a `python virtual env <https://wiki.opencord.org>`_

|


python: flake8
==============

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

- lint-flake8-all target dependency will create a `python virtual env <https://wiki.opencord.org>`_

|

Golang
======

Command:

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__

|


JSON
====

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
==========================

Command:

.. code:: bash

    make clean
    make lint-license 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/voltha-system-tests/+/refs/heads/master/makefiles/lint>`__
- `makefiles/lint/license.mk <http://gerrit.opencord.org/plugins/gitiles/voltha-system-tests/+/refs/heads/master/makefiles/lint/license/include.mk>`_

|


python: pylint
==============

Command: `pylint <http://github.com/pylint-dev/pylint>`_, `pypi.org <https://pypi.org/project/pylint/>`_

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
- lint-pylint-all target dependency will create a `python virtual env <https://wiki.opencord.org>`_

|


Shell / Command Line Scripts
============================

Command: `shellcheck <https://github.com/koalaman/shellcheck>`_

.. code:: bash

    make clean
    make lint                2>&1 | tee log
    make lint-shell-all      2>&1 | tee log
    make lint-shell-modified 2>&1 | tee log

Sources:

- `makefiles/lint <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/>`__
- `makefiles/lint/shell.mk <https://gerrit.opencord.org/plugins/gitiles/onf-make/+/refs/heads/master/makefiles/lint/shell/include.mk>`_

|


Yaml
====

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
====

- `jira::VOLTHA <https://lf-broadband.atlassian.net/projects/VOL>`-
- Include repository URL
- Include gerrit/github changeset if available.
- A logfile snippet of the error and surrounding context.

|


Repositories
============

- [`master <https://gerrit.opencord.org/plugins/gitiles/bbsim/+/refs/heads/master>`__] `bbsim <https://gerrit.opencord.org/plugins/gitiles/bbsim>`_
- [`master <https://gerrit.opencord.org/plugins/gitiles/pod-configs/+/refs/heads/master>`__] `pod-configs <https://gerrit.opencord.org/plugins/gitiles/pod-configs>`_
- [`master <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master>`__] `voltha-docs <https://gerrit.opencord.org/plugins/gitiles/voltha-docs>`_
- [`master <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts/+/refs/heads/master>`__] `voltha-helm-charts <https://gerrit.opencord.org/plugins/gitiles/voltha-helm-charts>`_
- [`master <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master>`__] `voltha-docs <https://gerrit.opencord.org/plugins/gitiles/voltha-docs>`_

|


Notes
=====

- Volume problem reports require cleanup before linting can become a default.

  - After bulk linting problems for a language source have been cleaned up
    default linting can be enabled by modifing {project-root}/config.mk.

- Lint target support is globally available across repositories, given time
  it will be.  Submit patches as needed or open a jira ticket to request
  linting support in specific repositories.
- Makefile refactoring: yes absolutely! Baby steps are needed in the interim...

|
