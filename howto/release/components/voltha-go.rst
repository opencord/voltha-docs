VOLTHA Components: voltha-go
============================

Dependencies
------------

- update go.mod

  - grep '/opencord/' go.mod
  - omci-lib-go
  - voltha-protos
  - voltha-lib-go


Validate
--------

Versioning
----------

- Based on VERSION file contents in root directory of the repository.

Release
-------

- Update project copyright notice ending date.
- Bump /opencord/ component version(s) in go.mod
- make distclean
- make lint
  - if go.mod and go.sum are the only deltas
  - git commit -F {commit_message_file}
- make mod-update
  - git add --all
  - avoid running 'make lint' prior to git commit --amend
  - vendor/ files modified, git status reports delta w/o content (file touch?)
- Review and commit changes.
- make lint lint-mod
- If docker is configured
  - make build test
- When ready to release a new component version of voltha-openolt-adapter

  - Bump VERSION file to a non-dev semantic version.

- Commit changes and create a pull request.
- Once approved a jenkins job will launch.

