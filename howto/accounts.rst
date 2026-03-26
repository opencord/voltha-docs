.. _my-reference-label:
.. _gerrit-user-account:

Getting Started
###############

- Register with LF BB
- gerrit user account
- github user account

Register with LF BB
=================

Begin by registering with LF BB, this will create a
user account for you to access resources: gerrit, jenkins, wiki, etc.

- https://lfbroadband.org/join/


Gerrit user account
===================

Next navigate to gerrit.lfbroadband.org, login and configure your user account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- `Gerrit Login <https://gerrit.lfbroadband.org/login>`_

- `User Settings <https://gerrit.lfbroadband.org/settings/>`_
   - Verify full name and display name fields are populated.
   - Verify your email address is correct.

- Generate and deploy an ssh key to interact with the repository:
   - `Public SSH key <https://gerrit.lfbroadband.org/settings>`_ (#SSHKeys)

- Verify your ssh access

.. sourcecode:: shell

   # Generate a new ssh key
   $ cd .ssh
   $ ssh-keygen -t ed25519 -f id_gerrit -C 'tux@yourdomain.org'

   # Connect passing -T, -p(ort), -i(dentity)
   $ ssh -T -p 29418 -i ~/.ssh/id_gerrit 'tux@yourdomain.org'

   $ ssh-add ~/.ssh/id_gerrit
   $ ssh -T -p 29418 'tux@yourdomain.org'



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
   $ git config --global user.email 'tux@yourdomain.org'

   ## Config required by gerrit:
   $ git config --global gitreview.username 'tux@yourdomain.org'

   ## Convenience:
   $ git config --global alias.br    branch
   $ git config --global alias.ci    commit
   $ git config --global alias.co    checkout
   $ git config --global alias.st    status

   ## Optional configs:
   $ git config --global color.ui    auto
   $ git config --global pater.diff  false
