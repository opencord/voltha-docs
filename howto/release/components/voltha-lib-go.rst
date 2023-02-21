VOLTHA Components: voltha-protos
================================

Dependencies
------------

- update go.mod

  - voltha-protos


Validate
--------

Versioning
----------

- Based on VERSION file contents in root directory of the repository.

Release
-------

- Bump VERSION file to a non-dev semantic version.
- See Validate above
- Commit and approve to trigger a build
- Bump /opencord/ component versions in go.mod
- make distclean
- make mod-update
- Review and commit changes.
- make lint-mod
- When ready to release a new component version of voltha-lib-go

  - Bump VERSION file to a non-dev semantic version.

- Commit changes and create a pull request.
- Once approved a jenkins job will launch.
