.. _howto_release_components_onos_components:

VOLTHA Components: ONOS
=======================

A few different processes exist for releasing the VOLTHA project and componets.
Some are released through github using branches/tags/downloads.
Others are released as packages on maven central.

A jenkins job exists for releasing ONOS app

- Maven central based release
- Release process requires some manual steps.

- `Jenkins Release Job <https://jenkins.opencord.org/job/onos-app-release/>`_

  - `MVN Plugin Upgrade <https://gerrit.opencord.org/c/sadis/+/34230>`_
  - `5.11.0 (deploy) <https://gerrit.opencord.org/c/sadis/+/34231>`_
  - `5.12.0-SNAPSHOT (dev) <https://gerrit.opencord.org/c/sadis/+/34232>`_

  - Initiate a build with parameters for the target component.

    - Use repository name not name of the app itself.
    - Specify appVersion and apiVersion stored in the pom.xml file.

      - Files modified by jenkins: pom.xml, app/pom.xml, api/pom.xml

.. list-table:: Job paramters
   :widths: 10, 40
   :header-rows: 1

   * - Field
     - Value
   * - appRepo
     - sadis
   * - appName
     - sadis
   * - apiVersion
     - 5.11.0 (pom.xml: 5.11.0-SNAPSHOT)
   * - nextApiVersion
     - 5.12.0
   * - version
     - 5.11.0
   * - nextVersion
     - 5.12.0
   * - branch
     - master (?)


Jenkins Jobs
^^^^^^^^^^^^

- Jenkins jobs from `release matrix: v2.12 <https://wiki.opencord.org>`_

    - `changeset approval for job merge <https://gerrit.opencord.org/q/owner:do-not-reply%2540opennetworking.org>`_
    - pom.xml non-SNAPSHOT (first approved changeset)

      - `licensed <https://jenkins.opencord.org/job/verify_sadis_licensed/>`_
      - `verify <https://jenkins.opencord.org/job/verify_sadis_maven-test/>`_

    - pom.xml non-SNAPSHOT (second approved changeset)

      - `publish <https://jenkins.opencord.org/job/maven-publish_sadis/>`_

   - Job will modify pom.xml and create pull requests based on version strings.

    - NOTE: Two pull requests are created to modify pom.xml

      - One for release (x.y.z)
      - The second to revert to non-release version (x.(y+1).z-SNAPSHOT)
      - Approve and merge the release version while performing the release.
      - Once published approve the 2nd version change to re-attach the -SNAPSHOT suffix.

    - Version x.y.z-SNAPSHOT is the default non-release version.
    - Jenkins job will morph x.y.z-SNAPSHOT into x.y.z for the release.
    - A gerrit pull request will be created under the release requestor(s) name.

  - Approve the pom.xml pull request and merge.
  - Merge will trigger (https://jenkins.opencord.org/job/maven-publish_sadis/ for sadis app, similar link for olt and other apps) that publish the artifact in the staging repo on oss.sonatype.org, you need to release it.
  - Wait for build to complete
  - Merge the patches here https://gerrit.opencord.org/q/owner:do-not-reply%2540opennetworking.org

- Artifact staging on sonatype, published to maven central:

  - Visit `https://oss.sonatype.org <https://oss.sonatype.org>`_
  - Login with ONF credentials

    - In the Artifact Search box

      - Search for org.opencord
      - Find the package of interest (pkg, app, api)
      - Click 'Show All Versions'
      - Verify the released version exists

    - Click on "Staging repositories" (in the left side navigation)
    - In the top right search for last part of the app name (eg: olt)
    - Enable checkbox for the versioned package (status: closed).
    - Click release (top left bar, small button)
    - `Wait until artifacts are published <https://search.maven.org/search?q=g:org.opencord>`_

- Release all other apps/components (dependency hierarch):

  - Iterate over individual components in order of increasing dependency volume.

    - For ex olt depends on sadis
    - Begin by releasing sadis first
    - Once publishing has completed then olt can be released.

  - Verify expected dependent version has been released.
  - Modify pom.xml, update dep version(s) from x.z.y-SNAPSHOT to x.y.z
  - Commit and submit.

