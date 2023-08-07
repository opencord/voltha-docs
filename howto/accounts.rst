.. _my-reference-label:
.. _gerrit-user-account:

Getting Started
###############

- Register with ONF
- gerrit user account
- github user account

Register with ONF
=================

Begin by registering with OpenNetworkingFoundation, this will create a
user account for you to access resources: gerrit, jenkins, wiki, etc.

- https://opennetworking.org/register/


Gerrit user account
===================

Next navigate to gerrit.opencord.org, login and configure your user account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- `Gerrit Login <https://gerrit.opencord.org/login/%2Fq%2Fstatus%3Aopen%2B-is%3Awip>`_

- `User Settings <https://gerrit.opencord.org/settings/>`_
   - Verify full name and display name fields are populated.
   - Verify your email address is correct.

- Generate and deploy an ssh key to interact with the repository:
   - `Public SSH key <https://gerrit.opencord.org/settings>`_ (#SSHKeys)

- Verify your ssh access

.. sourcecode:: shell

   # Generate a new ssh key
   $ cd .ssh
   $ ssh-keygen -t ed25519 -f id_gerrit -C 'tux@opennetworking.org'

   # Connect passing -T, -p(ort), -i(dentity)
   $ ssh -T -p 29418 -i ~/.ssh/id_gerrit 'tux@opennetworking.org@gerrit.opencord.org'

   $ ssh-add ~/.ssh/id_gerrit
   $ ssh -T -p 29418 'tux@opennetworking.org@gerrit.opencord.org'



Github user account
===================

Enable two-factor authentication
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
- https://github.com/settings/security

Generate and upload a public ssh key to interact with the repository:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
- https://github.com/settings/keys



Git config settings
===================

.. sourcecode:: shell

   ## Config required by git:
   $ git config --global user.name  'Tux Penguin'
   $ git config --global user.email 'tux@opennetworking.org'

   ## Config required by gerrit:
   $ git config --global gitreview.username 'tux@opennetworking.org'

   ## Convenience:
   $ git config --global alias.br    branch
   $ git config --global alias.ci    commit
   $ git config --global alias.co    checkout
   $ git config --global alias.st    status

   ## Optional configs:
   $ git config --global color.ui    auto
   $ git config --global pater.diff  false
