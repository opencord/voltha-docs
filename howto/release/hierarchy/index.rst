VOLTHA Components
=================

voltha-onos
^^^^^^^^^^^

- `dependencies.xml <https://github.com/opencord/voltha-onos/blob/master/dependencies.xml>`_

Dependencies.xml is the last step of the release of ONOS + APPS, it's in
the voltha-onos repo and it's the last element you need to update so that
the voltha-onos docker image can be built with all the released apps on top
of the selected ONOS image.

Use dependencies.xml to populate the release notes version grid for ONOS.

ofagent-go
^^^^^^^^^^
- `deps: go.mod <https://gerrit.opencord.org/plugins/gitiles/ofagent-go/+/refs/heads/master/go.mod>`_

  - voltha-lib-go
  - voltha-protos

Relase: voltctl

   - update: repo:ci-management:vars/installVoltctl.groovy

voltha-protos
^^^^^^^^^^^^^
- `deps: go.mod <https://gerrit.opencord.org/plugins/gitiles/ofagent-go/+/refs/heads/master/go.mod>`_

  - voltha-lib-go
  - voltha-protos

Relase: voltctl

   - update: repo:ci-management:vars/installVoltctl.groovy

See Also
========
- `VOLTHA Release Process <https://docs.voltha.org/master/overview/release_process.html?highlight=charts%20yaml>`_
- `release_notes: Release Process <https://docs.voltha.org/master/release_notes/release_process.html>`_
- `VOLTHA and ONOS Software Update Procedure <https://docs.voltha.org/master/operations/software-upgrade.html?highlight=set%20global%20image>`_
- `Helm Chart Deployment <https://docs.voltha.org/master/voltha-helm-charts/README.html?highlight=voltctl>`_
