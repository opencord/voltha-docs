GitHub SSH Access
##################

- `GitHub Login <https://github.com/login>`_

Generate an :ref:`SSH Key <github-user-account>` for access
==============================================================

.. sourcecode:: shell

   $ ssh-keygen -t ed25519 -f id_github -C 'tux@lfbroadband.org'

- Add the public key at https://github.com/settings/keys

- Verify your ssh connection (manual/explicit args)
   - ssh -T -i ~/.ssh/id_github git@github.com
      - -T # disable pseudo terminal access, simple verify
      - -i(dentity) # ssh key
   - Expect to see::

      Hi tux! You've successfully authenticated, but GitHub does not provide shell access.


Load your ssh key(s) to prompt for a passprase once
===================================================

.. sourcecode:: shell

   # ssh-add will prompt for the passphrase for your key.
   # This is a one-time operation per login session.
   $ ssh-add ~/.ssh/id_github
   $ ssh-add -l

Create ~/.ssh/config to simplify your connections
=================================================
.. sourcecode:: shell

   FILE: ~/.ssh/config
   # -----------------------------------------------------------------------
   # AddKeysToAgent yes      auto ssh-add key for reuse this login session.
   # IdentitiesOnly yes      only use identity provided, no fallback
   # -----------------------------------------------------------------------

   Host github.com
      IdentityFile ~/.ssh/github.com/id_ed25519
      IdentitiesOnly yes
      AddKeysToAgent yes
      # (default) Port 22
      User tux

With ~/.ssh/config setup simply connect to the target machine:
==============================================================
   - ssh -T github.com


Secure permissions on ~/.ssh
============================

.. sourcecode:: shell

  $ chown -R {my_login}:{my_login} ~/.ssh
  $ chmod -R ~/.ssh u+rwx,og-rwx
  $ find ~/.ssh -type d -print0 | xargs -0 chmod u=rwx
  $ find ~/.ssh -type f -print0 | xargs -0 chmod u=r
  $ find ~/.ssh -name '*.pub' -type f -print0 | xargs -0 chmod u=rw
  $ chmod u=rw ~/.ssh/config ~/.ssh/known_hosts* ~/.ssh/authorized_keys

Debugging connection problems
===============================
  - ssh [-v | -vv | -vvv ] to enable connection debugging.
  - For conneciton problems be explicit when specifying arguments:
     - ssh -p(ort) -i(dentity) {user}@{host}
  - Use ssh-add -D to clear your keyring and force passphrase prompting.

.. note::

   VOLTHA previously used Gerrit (gerrit.lfbroadband.org, port 29418) for code review,
   which required a separate SSH key and ``~/.ssh/config`` entry. Gerrit has been
   retired; only GitHub SSH access is needed now.
