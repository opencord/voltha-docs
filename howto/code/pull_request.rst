.. _pull-request-see-also:

VOLTHA project repositories
===========================

Development and code reviews:
-----------------------------

:ref:`Commit message syntax <pull-request--commit-message>`
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

- `Working url (branch=master fallback) <https://docs.voltha.org/master/howto/code/commit-message.html#pull-request-commit-message>`_

Re-running CI checks
---------------------

If a CI check did not launch or failed and you believe the issue is
unrelated to your patch/changeset you can re-trigger it.

- With write access to the repository:

  - Visit your pull request, e.g. https://github.com/opencord/bbsim/pulls
  - Open the "Checks" tab (or click a failed check at the bottom of "Conversation").
  - Click "Re-run jobs" (or "Re-run failed jobs") in the top right.

- Without write access:

  - Push an empty commit to your branch to re-trigger the checks:
    ``git commit --allow-empty -m "Trigger CI"`` then ``git push``.

It may take a little while to run dependent on queue size but this will
initiate re-running job phases for a patch.

Code Review Request
--------------------

A code review can be requested in two ways: interactively when a pull request is
created, or afterwards from the GitHub UI. GitHub may also automatically suggest
reviewers based on volume of commits to an individual repository, so you may
have reviewers suggested without explicitly requesting one.

Interactively using git
-------------------------

- Create a branch, commit and push your changes.
- Open the pull request either from the "Compare & pull request" prompt GitHub
  shows after a push, or by visiting
  ``https://github.com/opencord/{repo}/pull/new/{your-branch}``.
- On the "Open a pull request" screen, use the "Reviewers" panel on the right
  to select reviewers before submitting.
- Reviewers will be notified via GitHub (and email, if they have it enabled).

Manually add reviewers at a later date
----------------------------------------

- `Navigate to your pull request on GitHub <https://github.com/opencord/bbsim/pulls>`_
- Click the gear icon next to "Reviewers" in the right-hand sidebar.
- Add community members to request a review.
