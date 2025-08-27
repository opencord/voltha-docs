Gerrit SSH Access
#################

- `Gerrit Login <https://gerrit.lfbroadband.org/login/%2Fq%2Fstatus%3Aopen%2B-is%3Awip>`_

Generate an :ref:`SSH Key <gerrit-user-account>` for access
============================================================

.. sourcecode:: shell

   $ ssh-keygen -t ed25519 -f id_gerrit -C 'tux@opennetworking.org'

- Login and configure gerrit

- Verify your ssh connection (manual/explicit args)
   - ssh -T -p 29418 -i ~/.ssh/id_gerrit tux@gerrit.lfbroadband.org
      - -T # disable pseudo terminal access, simple verify
      - -p(port)
      - -i(dentity) # ssh key
   - Expect to see::
      \*\*\*\*    Welcome to Gerrit Code Review    \*\*\*\*

      Hi tux, you have successfully connected over SSH.

      Unfortunately, interactive shells are disabled.


Load your ssh key(s) to prompt for a passprase once
===================================================

.. sourcecode:: shell

   # ssh-add will prompt for the passphrase for your key.
   # This is a one-time operation per login session.
   $ ssh-add ~/.ssh/id_gerrit
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

   Host gerrit.lfbroadband.org
      Hostname gerrit.lfbroadband.org
      IdentityFile ~/.ssh/gerrit.lfbroadband.org/id_ed25519
      IdentitiesOnly yes
      AddKeysToAgent yes
      Port 29418
      User tux@opennetworking.org

With ~/.ssh/config setup simply connect to the target machine:
==============================================================
   - ssh gerrit.lfbroadband.org


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
