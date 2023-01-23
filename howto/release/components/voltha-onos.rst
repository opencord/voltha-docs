VOLTHA Components: votlha-onos
==============================

voltha-onos is the last onos dependency to be released.

Release Steps
-------------

- After all ONOS component dependencies have been released.
- Clone the :vol-ger:`voltha-onos` repository.
- Modify `dependencies.xml <https://gerrit.opencord.org/plugins/gitiles/voltha-onos/+/refs/heads/master/dependencies.xml>`_

  - Update copyright notice.
  - Update released version for each component.

- Bump the VERSION file string

  - :vol-ger:`voltha-onos/+/refs/heads/master/VERSION`
  - This will release a new ONOS docker image.

- `release_notes <https://docs.voltha.org/master/release_notes/index.html>`_

  - Update all released component version strings in the grid.

