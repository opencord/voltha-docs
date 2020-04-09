VOLTHA 2.2 Release Notes
========================

Highlights
----------

Started the SEBA Surge effort to get VOLTHA 2.x in production by AT&T, DT, and
TT. VOLTHA 2.2 release is a stepping stone towards that goal. Main highlights
of this release include the work done for stabilizing VOLTHA and creating test
infrastructure.

Core
----
- Simplified VOLTHA stack: https://docs.google.com/presentation/d/1pPJFG1NIDQGSla_Sn1Jx4xqDXO9uEEhwgTegZEB6JK0/edit

Development process
-------------------

- kind-voltha used to bring up development/testing
- voltctl CLI replaces CLI container
- Supports AT&T workflow
- Moved to BAL 3.1 (from BAL 2.6 in VOLTHA 1.7 and 2.1 releases)
- 7 active brigades

Testing
-------

- Expanded set of Test Cases: https://docs.google.com/spreadsheets/d/1TOSibGWXOAYOVeT0UwcivFRMm3oQzSdcpRG5E9_WTbQ/edit
- Patchset sanity testing with emulated hardware (BBSim)
- Ability to submit patchsets for test on physical hardware (hardware test keyword in gerrit)
- Nightly regression suite on hardware growing
- New BBSim used for functional testing and scale testing
- BBSim Reflector (BBR) to verify BBSim itself scales

Documentation
-------------

- Operator Workflows Defined: https://docs.google.com/presentation/d/1FP42UviD9Ln-Pjrho5cEOT4mxD1SjszjJUD1MA3jdKY/edit
- Several Design docs published: https://drive.google.com/drive/u/1/folders/1sNbD1oMA1twG4Kqn2e77ExzXR81qC6LK

Known Issues
------------

- | This release does not support Tech Profiles other than 1 TCONT,
  | 1 GEM port, due to issues in BAL 3.1 (VOL-2104, VOL-2105). A move to BAL 3.4 is required.
- A scenario in the AT&T workflow results in errors (see VOL-2395)

Component Versions
------------------

- ONOS: 1.13.9, with app versions:
    - olt: 3.0.1
    - sadis: 3.1.0
    - aaa: 1.9.0
    - dhcpl2relay: 1.6.1
    - kafka: 1.1.0

- VOLTHA component versions
    - helm charts
        - voltha: 2.2.0
        - adapter-openolt 2.2.0
        - adapter-openonu 2.2.0
        - onos: 1.1.4
    - Containers
        - voltha-rw-core: 2.2.3
        - voltha-of-agent: 2.2.3
        - voltha-openolt-adapter: 2.2.5
        - voltha-openonu-adapter: 2.2.6
        - voltha-onos: 2.2.0

- BBSim
    - helm charts: 3.0.7
    - container: 0.0.9

- OpenOLT Agent using BAL 3.1 (voltha-2.2)
    - openolt_2_2_0_asfvolt16.deb (available from EdgeCore site)
    - | Get access credentials for https://edgecore.quickconnect.to and then login and navigate to File_Station ->
      | EdgecoreNAS, and then the folder /ASXvOLT16/OpenOLT_Agent/From_ONF_Distribution/ and pick the version above

