Jira tickets for code changes
=============================

Please open a `jira ticket <https://jira.opencord.org/projects/VOL>`_ describing the issue/feature.

- For large or multi-part features create a containing ticket with several
  sub-tickets tracking individual features or problems.
- Descripton - include relevant information

  - Error messages
  - Reproduction step(s) for problems
  - Web URLs, links to jenkins job logs are very helpful.

    - Note: Jenkins job logs will age out and disappear over time.
    - To prevent this view the job history panel in jenkins UI

      - Two links are available in history, colored icon on the left and #job on the right.
      - Click the #job link to view job.
      - Top right corner will contain a clickable button "Keep this build forever".
      - Just remember to clear this attribute after the jira ticket is closed.

- Assign field ``Fix Version/s:`` VOLTHA-X.Y

     - This will enables searching for feature by release.
     - Leveraged during release to document fixes and enhancements in release notes.
- While viewing a jira ticket, the 'More' navigation pulldown menu at the top
  is useful for creating sub tickets or creating links to external resources.

See Also
--------

- https://jira.opencord.org
- `jira :: VOLTHA <https://jira.opencord.org/projects/VOL/issues/VOL-4470?filter=allopenissuse>`_
