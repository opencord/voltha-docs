Development
###########

- `Gerrit Login <https://gerrit.opencord.org/login/%2Fq%2Fstatus%3Aopen%2B-is%3Awip>`_

Locate a VOLTHA :ref:`SSH Key <gerrit-user-account>` of interest
================================================================

- Clone repository `repo:voltha-docs <https://gerrit.opencord.org/plugins/gitiles/voltha-docs>`_

.. sourcecode:: shell

   $ mkdir -p ~/sandbox
   $ cd ~/sandbox
   $ git clone ssh://gerrit.opencord.org:29418/voltha-docs
   $ cd voltha-docs

- TODO
  - HOWTO: edit branch=main or create branch=dev-user
  - HOWTO: Commit changes
  - HOWTO: gerrit review
  - HOWTO: jenkins - check job status from review screen history.
  - HOWTO: gerrit review screen, react to feedback, augment patch.
  - HOWTO: commit --amend
  - HOWTO: request merge
  - HOWTO: include reference to `System Test Development <https://wiki.onosproject.org/display/ONOS/Gerrit+Workflow+for+System+Test+Development>`
