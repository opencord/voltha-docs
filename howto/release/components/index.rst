VOLTHA Components (wip)
=======================

- `Jenkins Release Job <https://jenkins.opencord.org/job/onos-app-release/>`_

    - Initiate a build for the target component, specify appVersion & apiVersion.
    - Job will modify pom.xml and create pull requests based on version strings.
    - Approve and merge the pom.xml changes.
    - Next a jenkins job will publish changes to maven central.

       - A user login is required.
       - `Wait until artifacts are published <https://search.maven.org/search?q=g:org.opencord>`_
       - Verify status then manually initiate.
    - `Visit <https://oss.sonatype.org>`_
       - Select app to release.
       - Click Show all versions.
       - TODO: Girish to provide remaining steps.
