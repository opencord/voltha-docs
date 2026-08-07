Pull request followup
=====================

Once a pull request has been opened, GitHub can be used to track progress.

Find your pull request
-----------------------

| Begin by viewing the pull request you opened, or search for it.
| A pull request can be accessed in a few different ways.

Capture pull request URL output
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After ``git push`` of a new branch, GitHub prints a direct link to open a pull request.

.. code-block:: shell-session
   :linenos:
   :emphasize-lines: 10

   % git push origin VOL-5100-fix-something

   remote:
   remote: Create a pull request for 'VOL-5100-fix-something' on GitHub by visiting:
   remote:      https://github.com/opencord/ci-management/pull/new/VOL-5100-fix-something
   remote:
   To github.com:opencord/ci-management.git
    * [new branch]      VOL-5100-fix-something -> VOL-5100-fix-something

Once the pull request is opened, GitHub assigns it a number and URL, e.g.
``https://github.com/opencord/ci-management/pull/1234``.

Search by branch, author or keyword
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- Visit ``https://github.com/opencord/{repo}/pulls``
- Use the search box to filter, e.g. ``is:pr author:@me`` or ``is:pr is:open``.
- Or search across the whole organization: ``https://github.com/search?q=org%3Aopencord+is%3Apr+author%3A%40me``

Search by Jira ticket
^^^^^^^^^^^^^^^^^^^^^^

Since commit messages and pull request titles are prefixed with a Jira ticket
(e.g. ``[VOL-5100]``), you can search for a ticket number the same way:

- ``https://github.com/search?q=org%3Aopencord+is%3Apr+VOL-5100``

Git log
^^^^^^^

``git log`` can also be used locally to find your commit, and the PR opened from it.

.. code-block:: shell-session
   :linenos:

   % git log --author="joey" | less

   commit 23ce887c4cb3f98506536e00c58ffc8c2af16afe
   Author: Joey Armstrong <joey@lfbroadband.org>
   Date:   Thu Aug 24 09:46:22 2026 -0400

      [VOL-5100] - Update release notes

      release_notes/voltha_2.12.rst
      -----------------------------
        o Import Mahir(s) word doc containing tickets and descriptions.
        o Reformat using a grid layout so tickets and description are aligned.

      Signed-off-by: Joey Armstrong <joey@lfbroadband.org>

Pull request status and checks
-------------------------------

While viewing a pull request, scroll down to see:

- **Conversation** tab: review comments and discussion.
- **Checks** tab (or the checks list at the bottom of Conversation): GitHub Actions CI status
  for each configured workflow (unit tests, lint, licensing, etc).
- A green check mark means the job succeeded; a red X means it failed; a yellow dot means
  it is still running.

Click any individual check to view its job log directly, the same way you would view a
Jenkins job log.

- Example: `a pull request in voltha-go <https://github.com/opencord/voltha-go/pulls>`_

If a check needs to be re-run and you believe the failure is unrelated to your change:

- Push an empty commit: ``git commit --allow-empty -m "Trigger CI"``.
- Or, if you have write access to the repository, open the "Actions" tab, select the
  failed workflow run, and click "Re-run jobs".
