Jenkins: Common job failures
============================

ERROR: Duplicate tag  (job: version-tag_wildcard)
-------------------------------------------------

.. code:: bash

   02:44:55 v4.3.3   Tagged by CORD Jenkins version-tag job: 384, for Gerrit patchset: 33916
   02:44:55 v4.3.4   Tagged by CORD Jenkins version-tag job: 388, for Gerrit patchset: 34359
   02:44:55 go-based project found, using v-prefixed version for git tags: v4.3.4
   02:44:55 Version string '4.3.4' in 'VERSION' is a SemVer released version!
   02:44:55 ERROR: Duplicate tag: v4.3.4
   02:44:55 Build step 'Execute shell' marked build as failure

FIX:
^^^^

Most VOLTHA repositories contain the file `VERISON <https://gerrit.opencord.org/plugins/gitiles/voltha-openolt-adapter/+/refs/heads/master/VERSION>`_ which contain a semantic version string for builds.

Content and use of the VERSION file is documented [`here <https://docs.voltha.org/master/overview/contributing.html#versioning>`_]

- Problem #1: No VERSION file included with a patch.

  - If a VERSION file was not included in your patch simply add it with an incremented version string.

- Problem #2: Development collision

  - Periodically two devs may work in a repository at the same time.
  - Jenkins job processing is on a first-come-first-serve-basis.
  - When two patches are submitted for inclusion

    - The first patch will be accepted.
    - The second patch will fail with a duplicate tag.

  - This is a normal development event, when it happens check the repository
    to determine the latest VERSION string, increment the value and include
    the VERSION file in your patch.
  - ie: git commit --amend; git rebase; git review



