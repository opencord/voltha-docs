Repository: ci-management
=========================

Release tasks for the volth-protos repository

Preparation
-----------
- Create a jira ticket for tracking
- Triage build for problems
- Change VERSION string to be a ``*.1-dev`` developer release


repo:ci-management jjb/
-----------------------
- Clone and branch test pipelines for testing

Final prep and submit
---------------------

.. code-block:: shell-session
   :caption: Final Prep

   make lint
