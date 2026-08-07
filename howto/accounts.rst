.. _my-reference-label:
.. _github-user-account:

Getting Started
###############

- Register with LF BB
- github user account

Register with LF BB
=================

Begin by registering with LF BB, this will create a
user account for you to access resources: jenkins, wiki, etc.

- https://lfbroadband.org/join/


Github user account
===================

Enable two-factor authentication
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
- https://github.com/settings/security

Generate and upload a public ssh key to interact with the repository:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
- https://github.com/settings/keys

.. sourcecode:: shell

   # Generate a new ssh key
   $ cd .ssh
   $ ssh-keygen -t ed25519 -f id_github -C 'tux@yourdomain.org'

   # Add the public key (~/.ssh/id_github.pub) at https://github.com/settings/keys

   # Verify your ssh access
   $ ssh-add ~/.ssh/id_github
   $ ssh -T git@github.com


Git config settings
===================

.. sourcecode:: shell

   ## Config required by git:
   $ git config --global user.name  'Tux Penguin'
   $ git config --global user.email 'tux@yourdomain.org'

   ## Convenience:
   $ git config --global alias.br    branch
   $ git config --global alias.ci    commit
   $ git config --global alias.co    checkout
   $ git config --global alias.st    status

   ## Optional configs:
   $ git config --global color.ui    auto
   $ git config --global pater.diff  false

.. note::

   VOLTHA previously required a Gerrit user account (gerrit.lfbroadband.org).
   Gerrit has been retired; a GitHub account is now all that's needed to contribute.
