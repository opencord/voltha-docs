Jenkins jobs: Unit testing
==========================

Intent
------

With each new VOLTHA LTS release (v2.11, v2.8) jenkins unit testing and
sandbox tooling must be branched for release to protect testing from
future enhancements on master branch.

JJB configs are maintained in a central repository and are not maintained
on a seprate branch within revision control.  Instead versioning is
implemented using naming conventions within the job configs.

WIP:
----
- Clone the ci-management repository

  - git clone ssh://gerrit.opencord.org:29418/ci-management.git


TODO
----
- Document the current testing setup.
