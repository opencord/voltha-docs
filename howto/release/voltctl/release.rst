VOLTHA Release: voltctl
=======================

Release Builds howto:
---------------------
- Increment the VERSION file to a major or minor point release.
- Initiate a jenkins job to build components (WIP: searching).

  - `repo::voltctl <https://gerrit.opencord.org/plugins/gitiles/voltctl/+/refs/heads/master>`__, Gerrit example: `33551 <https://gerrit.opencord.org/c/voltctl/+/33551>`_.
  - At least two jenkins jobs need to run:

    - version-tag_wildcard
    - github-release_voltctl

- Verify `git tags <https://github.com/opencord/voltctl/tags>`_

  - A SemVer tag was created (vee prefix v{semver} signifies a golang package).
  - Verify the `package(v1.8.0) <https://github.com/opencord/voltctl/releases/tag/v1.8.0>`_ contains more than just source archives (gz, zip):
    - The `tags page <https://github.com/opencord/voltctl/tags>`_ index lacks ``Notes`` and ``Downloads`` links.

  - A valid package(v1.7.6) _ will include:

    - The `tags page <https://github.com/opencord/voltctl/tags>`_ index contains ``Notes`` and ``Downloads`` links.
    - A checksum file
    - Versioned voltctl binaries for several platforms.
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

:ref:`voltctl-see-also`
