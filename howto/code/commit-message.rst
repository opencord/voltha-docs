.. _pull-request--commit-message:

Repository commit message
=========================

- First line in a commit message is special.
- 50 cpl max to avoid complaints about length.
- Mention a jira ticket (VOL-xxxx) and the ticket will receive status updates from jenkins.

.. code:: bash

   [VOL-5048] - Build and deploy for VOLTHA v2.12 release.

   api/pom.xml
   app/pom.xml
   pom.xml
   -----------
     o Update copyright notice to span CCYY.
     o Update maven plugins spotbugs and findsecbugs.
     o Update sadis component to vX.Y.Z

   pkg/*
   Makefile
   ----------
     o Update copyright notice.
     o Run gofmt -s -w on all golang sources.

   VERSION
   -------
     o Increment version string to non-dev for release.

   Job Directives
   --------------
   verify_{project}_licensed
   verify_{project}_tag-collision
   verify_{project}_unit-test
   verify_{project}_sanity-test

   hardware test functional tests
   voltha test openonu multiolt
   voltha 2.8 test openonu multiolt

git commit ...
--------------

- A commit message can be constructed using either

  - -F <file>
  - --message="inlined text"

.. code:: bash

   $ vi commit.txt
   $ git add *stuff*
   $ git commit --F ./commit.txt
   # appropriate git rebase command
   $ git review --reviewers tux@onf.org foo@onf.org bar@onf.org

Commit Message: extra credit
++++++++++++++++++++++++++++

Additional commit message directives are available that will augment tasks
performed by a job.  Additional test suites can be requested for a job run
by including tokens found here.

`Tokens
<https://docs.voltha.org/master/testing/voltha_test_automation.html#per-patchset-verification-jobs>`_ can be embedded within a commit message to enable running additional test suites as part of jenkins validation.

Troubleshooting:
++++++++++++++++

There have been a few reports of additional testing not beeing initiated
by a commit.  If you encounter this behavior visit the
`VOLTHA jira site <https://jira.opencord.org/secure/Dashboard.jspa>`_
and open a trouble ticket detailing the changeset URL or a repository
and commit message text.

Commit hooks can be repository specific and may need to be
deployed/enabled/updated to support requestd functionality.
