VOLTHA Release: voltctl
=======================

Source
------

.. list-table:: Release resources
   :widths: 10, 60
   :header-rows: 1

   * - Source
     - Description
   * - `VERSION file <https://gerrit.opencord.org/plugins/gitiles/voltctl/+/refs/heads/master/VERSION>`__
     - Contains the tool version to build and/or release.
   * - `jjb/shell/github-release.sh <https://gerrit.opencord.org/plugins/gitiles/ci-management/+/refs/heads/master/jjb/shell/github-release.sh>`__
     - Shell script used to publish release candidates to github.

Development
-----------

.. code-block:: shell-session
   :caption: Build and test volctl locally

   % git clone ssh://gerrit.opencord.org:29418/voltctl.git
   % cd voltctl

   % make help
   % make lint      # [optional] lint-sanity lint-style lint-mod sca
   % make build
   % make check     # [optional] test

   % make release   # compile release binaries
   % make install


Release Builds howto:
---------------------

- Increment the `VERSION file <https://gerrit.opencord.org/plugins/gitiles/voltctl/+/refs/heads/master/VERSION>`__ to a major or minor point release.

.. list-table:: VERSION file, Symantec version strings
   :widths: 10, 10, 60
   :header-rows: 1

   * - Version
     - Artifact
     - Description
   * - 1.2.3
     - docker
     - Publish artifacts
   * - 1.2.3-dev
     -
     - Dev patch, build and test w/o external publishing.

- Merging the patch will initiate a jenkins job to build components

  - `repo::voltctl <https://gerrit.opencord.org/plugins/gitiles/voltctl/+/refs/heads/master>`__, Gerrit example: `33551 <https://gerrit.opencord.org/c/voltctl/+/33551>`_.
  - At least two jenkins jobs need to run:

    - `version-tag_wildcard <https://jenkins.opencord.org/job/version-tag_wildcard/>`__

      - Verify VERSION file string is sane.

    - `github-release_voltctl <https://jenkins.opencord.org/job/github-release_voltctl/>`__

      - Publish tool to github.


- Verify `git tags <https://github.com/opencord/voltctl/tags>`_

  - A SemVer tag was created (vee prefix v{semver} signifies a golang package).
  - Verify the latest `package(v1.8.45) <https://github.com/opencord/voltctl/releases>`_ contains more than just source archives (gz, zip):
    - The `tags page <https://github.com/opencord/voltctl/tags>`_ index lacks ``Notes`` and ``Downloads`` links.

  - A valid package(v1.7.6) _ will include:

    - The `tags page <https://github.com/opencord/voltctl/tags>`_ index contains ``Notes`` and ``Downloads`` links.
    - A checksum file
    - Versioned voltctl binaries for several platforms (darwin, linux, windows)
    - Source code bundles (tar.gz and zip).

- `Released version <https://api.github.com/repos/opencord/voltctl/releases/latest>`_ will be consumed by jenkins installer vars/installVoltctl.groovy.


Create an official voltctl release
----------------------------------
- `installVoltctl.groovy <https://gerrit.opencord.org/plugins/gitiles/ci-management/+/refs/heads/master/vars/installVoltctl.groovy#53>`_
  depends on `github/releases/latest <https://api.github.com/repos/opencord/voltctl/releases/latest>`_ for versioned release information.

- To generate a release commit changes to `repo::voltctl <https://gerrit.opencord.org/plugins/gitiles/voltctl>`__:

  - Modify VERSION file major/minor numbers for the upcoming release.
  - Remove any -dev or patch modifiers.
  - Create a pull request for review.
  - Changes will be published when the jenkins job github-release-voltctl is run.

- Verify the release version contains a checksum file:

   - checksum.SHA256
   - voltctl-1.7.6-darwin-amd64
   - voltctl-1.7.6-linux-amd64
   - voltctl-1.7.6-linux-arm64
   - voltctl-1.7.6-windows-amd64
   - Source code (zip)
   - Source code (tar.gz)

Manual release
--------------

Avoid this answer whenever possible but when peripheral breakage or volume
prevents publishing a new version of voltctl, a the tool can be published
manually.  The user will need repository publishing permissions on github
and creation of a github api key for their account.

Under the hood the `github gh command <https://cli.github.com/>`__ will handle all the heavy lifting.

TODO
^^^^

- Document key creation.
- Document github-release.sh command line and use.

:ref:`voltctl-see-also`
