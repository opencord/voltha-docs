Jira tickets for code changes
=============================

Please open a `jira ticket <https://lf-broadband.atlassian.net/projects/VOL>`_ describing the issue/feature.

- For large or multi-part features create a containing ticket with several
  sub-tickets tracking individual features or problems.

.. list-table:: Multi-part ticket with subtask
   :widths: 10, 10, 40
   :header-rows: 1

   * - Jira
     - Type
     - Problem
   * - `VOL-5125 <https://lf-broadband.atlassian.net/browse/VOL-5125>`_
     - Epic
     - Tracking ticket for bbsim failures in jenkins vip job view.
   * - `VOL-5024 <https://lf-broadband.atlassian.net/browse/VOL-5024>`_
     - sub-task
     - bbsim unit test job reporting status=UNSTABLE
   * - `VOL-5157 <https://lf-broadband.atlassian.net/browse/VOL-5157>`_
     - sub-task
     - verify_bbsim_unit-test failures in history
   * - `VOL-5154 <https://lf-broadband.atlassian.net/browse/VOL-5154>`_
     - sub-task
     - Triage test failure in periodic-voltha-unitag-subscriber-tt-test-bbsim

- Description - include relevant information

  - Error messages

    - Use preformatting to improve readability (else message becomes a run-on sentence).
    - In ticket description click plus icon on the right side.
    - Select preformatted
    - Copy and patest text into the preformatted box to retain structure.

  - Reproduction step(s) for problems
  - Web URLs, links to jenkins job logs are very helpful.

    - Note: Jenkins job logs will age out and disappear over time.
    - To prevent this view the job history panel in jenkins UI

      - `View a jenkins job page <https://jenkins.opencord.org/view/vip/job/verify_bbsim_unit-test>`_
      - Two links are available in history (lower left corner), colored icon on the left and #job on the right.
      - Click the #job link to view job.
      - Top right corner will contain a clickable button "Keep this build forever".
      - At some point in the future after a ticket has been resolved
        remember to revisit the job log and unfreeze it (click button:
        Do not keep this build forever)

- Assign field ``Fix Version/s:`` VOLTHA-X.Y

     - This will enables searching for feature by release.
     - Leveraged during release to document fixes and enhancements in release notes.
- While viewing a jira ticket, the 'More' navigation pulldown menu at the top
  is useful for creating sub tickets or creating links to external resources.


Suggestions: Additional ticket documentation
--------------------------------------------

.. list-table:: Persistent resources for reproduction
   :widths: 20,80
   :header-rows: 1

   * - Resource
     - Notes
   * - `VOL-5214 <https://lf-broadband.atlassian.net/browse/VOL-5214>`__
     - Jira ticket
   * - `jenkins <https://jenkins.opencord.org/view/VOLTHA-2.X-Tests/job/periodic-voltha-etcd-test/>`_
     - Capture job URLs to document errors and log messages.
   * - `gerrit:34854 <https://gerrit.opencord.org/c/ci-management/+/34854>`_
     - Capture gerrit patch URLs for state and job reconstruction.

- NOTE: Jenkins logs become unavailable due to aging

  - Jenkins job logs become inaccessible over time after growing old or
    due to volume job runs.  To avoid lost problem reproduction steps always
    include a gerrit patch link which can be used to reproduce state or job
    results when original job logs disappear.

- Document as links VS textual comments.

  - Visit jira `VOL-5214 <https://lf-broadband.atlassian.net/browse/VOL-5214>`__
  - Select [M]ore from the menu above Description and Details.
  - Select [L]ink
  - Select Web Link in the left margin
  - Paste a gerrit or jenkins URL into the URL text box.
  - Enter a summry in the link text box -- job number or gerrit ID.
  - Click the [Link] butotn.

- Example `VOL-5009 <https://lf-broadband.atlassian.net/browse/VOL-5009>`_

  - Items added as linked URLs will appear in the "Issue Links" section
    beneath the description where they are easily found.

See Also
--------

- https://lf-broadband.atlassian.net
- `jira :: VOLTHA <https://lf-broadband.atlassian.net/projects/VOL/issues/VOL-4470?filter=allopenissuse>`_
