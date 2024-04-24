Docker Images
=============

- VOLTHA images released to and hosted on Docker.
- Images are built by jenkins then consumed as dogfood by testing.

.. list-table:: VOLTHA Docker Images
   :widths: 20, 110
   :header-rows: 1

   * - Image
     - Description
   * - `Search=voltha* <https://hub.docker.com/search?q=voltha>`_
     - All Docker images with prefix='voltha'
   * - `bbsim <:vol-docker:'bbsim'>`_
     - BroadBand Simulator (BBSim) is a tool to simulate a PON network with OLTs, ONUs and RGs.
   * - `bbsim-sadis-server <:vol-docker:'bbsim-sadis-server'>`_
     - BBSim Sadis Server.
       Designed to aggregate Sadis entries from multiple BBSim instances running on the same kubernetes cluster.
   * - `voltha-rw-core <:vol-docker:'voltha-rw-core'>`_
     - Voltha Core
   * - `voltha-openolt-adapter <:vol-docker:'voltha-openolt-adapter'>`_
     - Open OLT adapter
   * - `voltha-openonu-adapter-go <:vol-docker:'voltha-openonu-adapter-go'>`_
     - Open ONU adapter
   * - `voltha-ci-tools <:vol-docker:'voltha-ci-tools'>`_
     - Versioned containers for running CI process on VOLTHA codebase
   * - `voltha-cli <:vol-docker:'voltha-cli'>`_
     - Provides SSH access to the VOLTHA CLI
   * - `voltha-ofagent-go <:vol-docker:'voltha-ofagent-go'>`_
     - OpenFlow management interface for Voltha
   * - `voltha-onos <:vol-docker:'voltha-onos'>`_
     - Provides a version of ONOS with the required VOLTHA control plane applications installed
