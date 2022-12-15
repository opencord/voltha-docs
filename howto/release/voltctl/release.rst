VOLTHA Release: voltctl
=======================

Release Builds howto:
---------------------
- Increment the VERSION file to a major or minor point release.
- Initiate a jenkins job to build components (WIP: searching).
- Verify a `tag <https://github.com/opencord/voltctl/tags>`_ named for the version was created.
- `Released version <https://api.github.com/repos/opencord/voltctl/releases/latest>`_ consumed by jenkins installer  vars/installVoltctl.groovy.

|

Create an official voltctl release
----------------------------------
- `installVoltctl.groovy <https://gerrit.opencord.org/plugins/gitiles/ci-management/+/refs/heads/master/vars/installVoltctl.groovy#53>`_
  depends on `releases/latest <https://api.github.com/repos/opencord/voltctl/releases/latest>`_ for versioned release information.

   - To generate a release visit `github <https://github.com/opencord/voltctl>`_.
   - Click `Releases <https://github.com/opencord/voltctl/releases>`_ in the right margin.

     - Click "Draft a new release"
     - Select a tag name to base the release on.
     - Title the relese and enter a description (release notes).
     - Select the checkbox "Set as the latest release".
     - Verify release information in the right margin upon return to the main repository screen.

- Verify the release version contains a checksum file:

   - checksum.SHA256
   - voltctl-1.7.6-darwin-amd64
   - voltctl-1.7.6-linux-amd64
   - voltctl-1.7.6-linux-arm64
   - voltctl-1.7.6-windows-amd64
   - Source code (zip)
   - Source code (tar.gz)

:ref:`voltctl-see-also`
