VOLTHA project repositories
===========================

Development and code reviews:
-----------------------------

Commit decorations:
+++++++++++++++++++

`Tokens
<https://docs.voltha.org/master/testing/voltha_test_automation.html#per-patchset-verification-jobs>`_ can be embedded within a commit message to enable running additional test suites as part of jenkins validation.

NOTE:
+++++
There have been a few reports of testing not being triggered by a commit.
If you encounter this behavior visit the VOLTHA jira site and open a ticket.
Commit hooks can be repository specific and may need to be deployed/enabled to support functionality.

- :vol-jira:``
- Include gerrit URL for your changeset.
- Target repository name/url.
- What tests or suites were expected that were not exercised.

