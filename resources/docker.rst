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
     -
     - All Docker images with prefix='voltha'
                      
   * - `voltha/bbsim <https://hub.docker.com/r/voltha/bbsim>`_
     - BroadBand Simulator (BBSim) is a tool to simulate a PON network with OLTs, ONUs and RGs.
   * - `voltha/bbsim-sadis-server <https://hub.docker.com/r/voltha/bbsim-sadis-server>`_
     - BBSim Sadis Server. 
       Designed to aggregate Sadis entries from multiple BBSim instances running on the same kubernetes cluster.
   * - `voltha/voltha-rw-core <https://hub.docker.com/r/voltha/voltha-rw-core>`_
     - Voltha Core
   * - `voltha/voltha-openolt-adapter <https://hub.docker.com/r/voltha/voltha-openolt-adapter>`_
     - Open OLT adapter
   * - `voltha/voltha-openonu-adapter-go <https://hub.docker.com/r/voltha/voltha-openonu-adapter-go>`_
     - Open ONU adapter
   * - `voltha/voltha-ci-tools <https://hub.docker.com/r/voltha/voltha-ci-tools>`_
     - Versioned containers for running CI process on VOLTHA codebase
   * - `voltha/voltha-cli <https://hub.docker.com/r/voltha/voltha-cli>`_
     - Provides SSH access to the VOLTHA CLI
   * - `voltha/voltha-ofagent-go <https://hub.docker.com/r/voltha/voltha-ofagent-go>`_
     - OpenFlow management interface for Voltha
   * - `voltha/voltha-onos <https://hub.docker.com/r/voltha/voltha-onos>`_
     - Provides a version of ONOS with the required VOLTHA control plane applications installed
