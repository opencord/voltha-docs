Release Preparation
===================

Jira Tickets
------------
As release date approaches and development slows visit the `jira versions dashboard <https://jira.opencord.org/projects/VOL?selectedItem=com.atlassian.jira.jira-projects-plugin%3Arelease-page&status=unreleased>`_.

- Create a new dashboard for the future release candidate.
- Visit the current released candidate version and move all unresolved tickets into the future desktop.
- On release day click the [Release] button to close out the desktop.

Confluence
----------
Create a `release tracking page` <https://wiki.opennetworking.org/display/VOLTHA/v2.12>`_ in confluence, there are a lot of details

- Jira tickets related to release and VOLTHA builds.
- Jenkins jobs: state, failures and tickets.
- Versions and build state of dependent apps and packages (also merged into release notes).

docs.voltha.org
---------------
- Create a stub `release notes <https://docs.voltha.org/master/release_notes/voltha_2.12.html>`_ page beneath `docs.voltha.org/release_notes <https://docs.voltha.org/master/release_notes/index.html>`_ (`HOWTO <https://docs.voltha.org/master/howto/release/release-notes.html>`_
