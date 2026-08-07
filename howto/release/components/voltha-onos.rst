VOLTHA Components: voltha-onos
==============================

voltha-onos is the last onos dependency to be released.

Release Steps
-------------

- After all ONOS component dependencies have been released.
- Clone the `voltha-onos <https://github.com/opencord/voltha-onos>`_ repository.
- Modify `dependencies.xml <https://github.com/opencord/voltha-onos/blob/master/dependencies.xml>`_

  - Update copyright notice.
  - Update released version for each component.

- Bump the VERSION file string

  - `voltha-onos <https://github.com/opencord/voltha-onos/blob/master/VERSION>`_
  - This will release a new ONOS docker image.

- `release_notes <https://docs.voltha.org/master/release_notes/index.html>`_

  - Update all released component version strings in the grid.

