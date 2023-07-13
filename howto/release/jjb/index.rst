repo:ci-management jjb/
=======================

- grep -r 'voltha-2.11' jjb/

  - Gather a complete list of pipeline files ot modify for release.

- jjb/pipeline/voltha/master

  - Add new release branch names

- jjb/pipeline/voltha/

  - jjb/pipeline/voltha/voltha-2.12/bbsim-tests.groovy
  - jjb/pipeline/voltha/voltha-2.12/physical-build.groovy

    - Clone master branch scripts into a release subdirectory:

      - mkdir -p voltha-2.12
      - rsync -rv --checksum master/. voltha-2.12/.

    - Compare clone with an older release to augment master logic

      - diff voltha-2.11 voltha-2.12
      - Compare against the last release
      - Update scripts to remove dependencies on master.

- jjb/software-upgrades.yaml

  - Clone ``*-master`` record into ``*-(release-branch)``
  - Update version strings and nexus oar paths with deployed artifact versions.
  - Update lingering `base-tag versions <https://jira.opencord.org/browse/VOL-5082>`_

- See `VOL-5082 <https://jira.opencord.org/browse/VOL-5082>`_
- jjb/verify/bbsim-sadis-server.yaml
- jjb/verify/bbsim.yaml
-
  - Clone records for the new v.x release.
  - Comment out deprecated releases beyond LTS (For 2.12: voltha-2.8, etc)
