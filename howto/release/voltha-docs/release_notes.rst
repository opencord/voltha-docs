docs.voltha.org release notes
=============================

Intent
------

Update release notes to capture details and version information for a given release.

Update Instructions
-------------------

- This action should be performed after all build and component releases.
- Clone `repo:voltha-docs <https://gerrit.opencord.org/plugins/gitiles/voltha-docs>`_
- Naviagate to the `release_notes <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/release_notes/>`_ folder.
- Copy the last voltha_X.Y.rst document name name it for the upcoming release.
- Update `index.rst <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/release_notes/index.rst>`_ so documents are displayed in order.

Release Notes
-------------

- Sections at the top Hilights, Features, Bug Fixes are normally written by TSTs with help from community members.
- Now search for the "Component Versions in VOLTHA" section.

  - All of the pkg/api/app version strings will need to be captured in a grid.
  - If an upgrade wiki page was maintained during release builds the task
    is easy, just copy build status info from the wiki.
  - If information was not tracked while packages were built, this step will become all manual lookup activity.

Component Versions in VOLTHA 2.12 release

See Also
--------

- Release tracking

  - `jira tickets <https://lf-broadband.atlassian.net/browse/VOL-5019>`_
  - `Wiki(s) <https://wiki.opencord.org>`_

    - `Published artifact and versions <https://wiki.opencord.org>`_

- Release notes template

  - Rendered html `docs.voltha.org <https://docs.voltha.org/master/release_notes/template.html>`_
  - Markup source `rst <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/release_notes/template.rst>`_
