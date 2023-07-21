.. _pull-request-see-also:

VOLTHA project repositories
===========================

Development and code reviews:
-----------------------------

:ref:`Commit message syntax <pull-request--commit-message>`
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Job directives: recheck
-----------------------

If the CI check did not launch or failed and you believe the issue is
unrelated to your patch/changeset you can re-trigger the job by commenting
on the patch with *recheck*.

- Visit gerrit:  https://gerrit.opencord.org/c/bbsim/+/34384
- Click the pencil icon in the top left by reviewers.
- Comment/description text: recheck

It may take a little while to run dependent on queue size but this token will
initiate re-running job phases for a patch.
