.. _pull-request-see-also:

VOLTHA project repositories
===========================

Development and code reviews:
-----------------------------

:ref:`Commit message syntax <pull-request--commit-message>`
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

- `Working url (branch=master fallback) <https://docs.voltha.org/master/howto/code/commit-message.html#pull-request-commit-message>`_

Job directives: recheck
-----------------------

If the CI check did not launch or failed and you believe the issue is
unrelated to your patch/changeset you can re-trigger the job by commenting
on the patch with *recheck*.

- Visit gerrit:  https://gerrit.opencord.org/c/bbsim/+/34384
- Click the pencil icon in the top left by reviewers.
- Comment/description text: ``recheck``

It may take a little while to run dependent on queue size but this token will
initiate re-running job phases for a patch.

Code Review Request
-------------------

A code review can be requested in two ways, interactively when a patch is
created or from the gerrit UI.  Item of note, gerrit will also automatically
assign reviewers based on volume of commits to an individual repository so
you may have reviewers w/o explicitly requesting one.

Interactively using git
-----------------------

- Create a patch, rebase/merge as needed.
- git review to create a pull request.

  - From the command line, include argument --reviewers
  - git review --reviewers tux@onf.org foo@onf.org bar@onf.org
  - People will be notified via email about the review request.

Manually add reviewers at a later date
--------------------------------------

- `Naviagate to your patch in gerrit <https://gerrit.opencord.org/c/bbsim/+/34384>`_
- Click the pencil icon in the top left by reviewers.
- Add community members to request a review.


