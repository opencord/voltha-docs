Release Preparation
===================

Jira Tickets
------------
As release date approaches and development slows visit the `jira versions dashboard <https://lf-broadband.atlassian.net/projects/VOL?selectedItem=com.atlassian.jira.jira-projects-plugin%3Arelease-page&status=unreleased>`_.

- Create a new/empty dashboard for the future release candidate.

  - Click in the ``Version name`` box and type in VOLTHA-(X.Y)++ for the next release.
  - Enter start/end dates if known, they should overlap with the last release.

- Visit the current released candidate version and move all unresolved tickets into the future desktop.

  - TSTs may want to review unresolved tickets for release notes content for partially completed work.

- On release day click the [Release] button to close out the desktop.

Release-less tickets
^^^^^^^^^^^^^^^^^^^^

- `docs.voltha.org::Fix Version/s <https://docs.voltha.org/master/overview/contributing/jira_tickets.html>`_

  - VOLTHA enhancements, features, etc are considered for release notes based
    on the "Fix Version/s" field of a jira ticket.  Ticket owner and target
    release will need to be specified for each.
  - Use the query below to identify problems and fix or ask people to review
    during the weekly TST meeting.
  - Query for `release-less v2.12 <https://lf-broadband.atlassian.net/browse/VOL-5105?jql=(%20project%20IN%20(SEBA%2CVOL)%20)%20AND%20(Resolved%20%3E%3D%202022-12-31)%20AND%20(Resolved%20%3C%3D%202024-02-01)%20AND%20(resolution%20NOT%20IN%20(%22Duplicate%22%2C%22Won%27t%20Do%22%2C%22Won%27t%20Fix%22))%20AND%20(resolved%20IS%20NOT%20EMPTY)%20AND%20(fixversion%20IS%20EMPTY)>_ tickets.  These are tickets opened between 2022-12-01 and 2024-02-01.
    - Adjust query release dates and insert url ``ctrl-K`` into the `Weekly TST Meeting Agenda Page <https://www.google.com/url?q=https://docs.google.com/document/d/1mNqronCip_-tDjFI-ZoudNteC3AnOcVONPHz7HuW8Eg/edit?usp%3Dsharing&sa=D&source=calendar&ust=1704724031747005&usg=AOvVaw1fRxjG_mEhovC-cPGZ4F_c>`_

Confluence
----------
Create a `release tracking page <https://wiki.opencord.org>`_ in confluence, there are a lot of details

- Jira tickets related to release and VOLTHA builds.
- Jenkins jobs: state, failures and tickets.
- Versions and build state of dependent apps and packages (also merged into release notes).

docs.voltha.org
---------------
- Create a stub `release notes <https://docs.voltha.org/master/release_notes/voltha_2.12.html>`_ page beneath `docs.voltha.org/release_notes <https://docs.voltha.org/master/release_notes/index.html>`_ (`HOWTO <https://docs.voltha.org/master/howto/release/release-notes.html>`_)

golang repositories
-------------------

- Upgrade go.mod (voltha-proto version at a minimum) early.
- Force a build to triage potential problems.
- Another go.mod update will be needed after voltha-protos
  is published but screen early for a set of known problems.
