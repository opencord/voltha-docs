.. _Makefile Target lint-pre-commit:

Tool: pre-commit
================

The `pre-commit tool <https://pre-commit.com/>`__ can also be used to:

- Scan for a variety of problems: syntax, licensing, etc.
- Perform some code cleanups

  - Remove whitespace
  - re-indent files
  - etc

## Install

.. code:: bash

    % git clone ssh://gerrit.opencord.org:29418/bbsim.git
    % cd bbsim

    % make help

    # Install python virtualenv w/modules from requirements.txt
    % make venv
    % source .venv/bin/activate

    # Scan for problems
    % pre-commit

    % make clean

## Configuration

- Each repository contains a yaml config file that controls hooks and linting behavior:

  - repo:bbsim/`.pre-commit-config.yaml <https://gerrit.opencord.org/plugins/gitiles/bbsim/+/refs/heads/master/.pre-commit-config.yaml>`__

- A skeleton config is currently being used.
- Make changes as needed but be sure to propogate them out to all voltha repositories.
- Long term a central repository can be maintained for pre-commit hooks that can be
  included as a git submodule to remove duplication and potential for linting variations.

.. seealso:

| URL | Description |
| pre-commit | A framework for managing and maintaining multi-language pre-commit hooks |
