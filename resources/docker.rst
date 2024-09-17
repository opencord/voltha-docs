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
   * - :vol-docker:`bbsim`
     - BroadBand Simulator (BBSim) is a tool to simulate a PON network with OLTs, ONUs and RGs.
   * - :vol-docker:`bbsim-sadis-server`
     - BBSim Sadis Server.
       Designed to aggregate Sadis entries from multiple BBSim instances running on the same kubernetes cluster.
   * - :vol-docker:`voltha-rw-core`
     - Voltha Core
   * - :vol-docker:`voltha-openolt-adapter`
     - Open OLT adapter
   * - :vol-docker:`voltha-openonu-adapter-go`
     - Open ONU adapter
   * - :vol-docker:`voltha-ci-tools`
     - Versioned containers for running CI process on VOLTHA codebase
   * - :vol-docker:`voltha-cli`
     - Provides SSH access to the VOLTHA CLI
   * - :vol-docker:`voltha-ofagent-go`
     - OpenFlow management interface for Voltha
   * - :vol-docker:`voltha-onos`
     - Provides a version of ONOS with the required VOLTHA control plane applications installed
