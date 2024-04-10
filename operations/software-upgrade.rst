=============================================
VOLTHA and ONOS software update procedures
=============================================

This document describes the software upgrade procedure for VOLTHA and ONOS
in a deployed system.  Distinction is made between a `minor` software upgrade,
which can be done in service, meaning with no dataplane service interruption
to existing customers, and a `major` software upgrade, which in turns requires
a full maintenance window during which service is impacted.

Changes to data-structures in storage (ETCD for VOLTHA and Atomix for ONOS)
are out of scope for in-service upgrades.  Such changes qualify as “major”
software upgrades that require a maintenance windows.  The KAFKA bus update
has its own section given that the procedure is different from the rest of
the components.  The following elements expect a fully working provisioned
VOLTHA and ONOS deployment on top of a Kubernetes cluster, with exposed ONOS
REST API ports.  It is also expected that new versions of the different
components are available to the operator that performs the upgrade.

Minor Software Version Update
=============================

The `minor` software upgrade qualifier refers to an upgrade that does not
involve API changes, which in VOLTHA, refers to either a change to the protos
or to voltha-lib-go, and in ONOS to a change in the Java interfaces, CLI
commands or REST APIs of either the Apps or the platform.  A `minor` software
update is intended for bug fixes and not for new features.  `Minor` software
update is supported only for ONOS apps and VOLTHA components. No in service
software update is supported for ETCD or Kafka.

VOLTHA services
---------------

VOLTHA components `minor` software upgrade leverages `helm` and `k8s`.
During this process is expected that no provision subscriber call is
executed from the northbound.  In process calls will be executed thanks to
the stored data and/or the persistence of messages over KAFKA.

After changes in the code are made and verified the following steps are needed:

#. Update Minor Version of the component
#. Build a new version of the needed component to update
#. update the component's minor version in the helm chart
#. | issue the helm upgrade command. If the changes have been already upstreamed to ONF the upstream chart
   | `onf/<component name>` can be used, otherwise a local copy of the chart is required.

Following is an example of the `helm` command to upgrade the openonu adapter.
Topics, kv store paths and kafka endpoints need to be adapted to the specific deployment.

.. code:: bash

    helm upgrade --install --create-namespace \
      -n voltha1 opeonu-adapter onf/voltha-adapter-openonu \
      --set global.stack_name=voltha1 \
      --set adapter_open_onu.kv_store_data_prefix=service/voltha/voltha1_voltha1 \
      --set adapter_open_onu.topics.core_topic=voltha1_voltha1_rwcore \
      --set adapter_open_onu.topics.adapter_open_onu_topic=voltha1_voltha1_brcm_openomci_onu \
      --set services.kafka.adapter.service=voltha-infra-kafka.infra.svc \
      --set services.kafka.cluster.service=voltha-infra-kafka.infra.svc \
      --set services.etcd.service=voltha-infra-etcd.infra.svc

ONOS apps
---------
`Minor` software update is also available for the following ONOS apps - `sadis`, `olt`, `aaa`, `kafka`, `dhcpl2relay`,
`mac-learning`, `igmpproxy`, and `mcast`. These apps can be thus updated with no impact on the dataplane of provisioned
subscribers. The `minor` software update for the ONOS apps leverage existing ONOS REST APIs.

During this process is expected that no provision subscriber call is
executed from the REST APIs.  In process calls will be executed thanks to
the Atomix stored flows.  Some metrics and/or packet processing might be
lost during this procedure, the system relies on retry mechanisms present in
the services and the dataplane protocols for converging to a stable stated
(e.g. DHCP retry).


After changes in the code of ONOS apps are made and verified the following steps are needed:

#. | obtain the .oar of the app, either via a local build with `mvn clean install` or, if the code has been upstreamed
   | by downloading it from `maven central <https://search.maven.org/search?q=g:org.opencord>`_ or sonatype.
#. Delete the old version of the ONOS app.
#. Upload install and activate the new `oar` file.

Following is an example of the different `curl` commands to upgrade the olt app. This assumes the .oar to be present in
the directory where the command is executed from/

.. code:: bash

    # download the app
    curl --fail -sSL https://oss.sonatype.org/content/groups/public/org/opencord/olt-app/4.5.0-SNAPSHOT/olt-app-4.5.0-20210504.162620-3.oar > org.opencord.olt-4.5.0.SNAPSHOT.oar
    # delete the app
    curl --fail -sSL -X DELETE http://karaf:karaf@127.0.0.1:8181/onos/v1/applications/org.opencord.olt
    # install and activate the new version of the app
    curl --fail -sSL -H Content-Type:application/octet-stream -X POST http://karaf:karaf@127.0.0.1:8181/onos/v1/applications?activate=true --data-binary @org.opencord.olt-4.5.0.SNAPSHOT.oar 2>&1

Minor Software Version Rollback Due To Failure
----------------------------------------------

A `Minor` software upgrade can incur in failures and broken functionality. There are two possible cases, 1. container
does not start, 2. broken functionality during operations

VOLTHA Component updated container does not start
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is automatically handled by Kubernetes. An old version of the pod does not get
terminated unless the new one is running and ready according to its readiness probe.
No system or data-plane functionality is impacted.

The operator will need to go in, manually delete the failing pod, fix the issue and re-deploy after
fixing the new `minor` version.

VOLTHA Component Broken functionality during operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this case the container started and became `ready` in Kubernetes but functionality of the system or data-plane
is broken, e.g. a subscriber can't be provisioned or no traffic is flowing.

In this case the operator needs to perform a manual intervention,
rolling back to the previous minor version of the container. The rollback operation is the same as a `minor` software
update via `helm` but instead of increasing the version number it's a decrement of it to the last known running one.

ONOS app not starting or broken functionality
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For ONOS apps a manual intervention is always necessary, both if the app does not start or if functionality is broken.
The rollback of an ONOS application is done by following the same procedure as the
update using the previous, or last known working, version of the `.oar` file.

Inter-dependency among changes submitted in different Components
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Even though it is expected that minor version upgrade should be seemless,
still there are chances that the changes that went in for a component are related with other component changes.
In this case the operator needs to perform a manual intervention,
and upgrade the components manually in desired order.

Major Software Version Update
=============================
A software update is qualified to be `major` where there are changes in the APIs or in the format of the
data stored by a component.

A major software update at the moment in VOLTHA and ONOS requires a maintenance window
during which the dataplane for the subscribers is going to be interrupted, thus no service will be provided.
There are several cases and they can be handled differently.

VOLTHA services API or Data format changes
------------------------------------------
A `major` update is needed because VOLTHA API between components have been changed or because format of the data being
stored is different, thus a complete-wipe out needs to be performed.
In such scenario each stack can be updated independently with no teardown required of the infrastructure of ONOS,
ETCD, KAFKA.
Different versions of Voltha can co-exists over the same infrastructure.

The procedure is iterative on each stack and is performed as follows:

#. un-provision all the subscribers via ONOS REST API.
#. delete all the OLTs managed by the stack via VOLTHA gRPC API.
#. upgrade the stack version via `helm` upgrade command and the correct version of the `voltha-stack` chart.

Details on the `helm` commands can be found in the voltha-helm-charts README file <voltha-helm-charts/README.md>_

If the API change is between the `openolt adapter` and the `openolt agent` on the OLT hardware please refer to section
:ref:`OpenOLT Agent Update <openolt-update>`.


ONOS, Atomix or ONOS apps
-------------------------
A `major` update is needed because of changes in the interfaces (Java APIs), REST APIs, of ONOS itself or in one
of the apps have been made, rendering incompatible the two subsequent implementations. A `major` software update is
also needed for changes made to the data stored in Atomix or for an update of the Atomix version iself.
In this scenario all the stacks connected to an ONOS instance need to be cleaned of data before moving them
over to a new ONOS cluster.

The procedure is as follows:

#. deploy a new ONOS cluster in a new namespace `infra1`
#. un-provision all the subscribers via ONOS REST API
#. delete the OLT device (not strictly required, but best to ensure clean state)
#. redeploy the of-agent with the new ONOS cluster endpoints
#. re-provision the OLT
#. re-provision the subscribers
#. iterate over steps 2,3,4,5,6 for each of the stack connected to the ONOS you want to update.

Following is an example on how to deploy ONOS:

.. code:: bash

    helm install --create-namespace \
      --set replicas=3,atomix.replicas=3 \
      --set atomix.persistence.enabled=false \
      --set image.pullPolicy=Always,image.repository=voltha/voltha-onos,image.tag=5.0.0 \
      --namespace infra1 onos onos/onos-classic

Following is an example on how to re-deploy the of-agent, using the `voltha-stack` chart,
pointing new controller endpoints. Only the `ofagent` pod will be restarted.

.. code:: bash

    helm upgrade --install --create-namespace \
    --set global.topics.core_topic=voltha1_voltha1_rwcore,defaults.kv_store_data_prefix=service/minimal \
    --set global.kv_store_data_prefix=service/voltha/voltha1_voltha1 \
    --set services.etcd.port=2379 --set services.etcd.address=etcd.default.svc:2379 \
    --set services.kafka.adapter.service=voltha-infra-kafka.infra.svc \
    --set services.kafka.cluster.service=voltha-infra-kafka.infra.svc \
    --set services.etcd.service=voltha-infra-etcd.infra.svc
    --set 'voltha.services.controller[0].service=voltha-infra1-onos-classic-0.voltha-infra1-onos-classic-hs.infra1.svc' \
    --set 'voltha.services.controller[0].port=6653' \
    --set 'voltha.services.controller[0].address=voltha-infra1-onos-classic-0.voltha-infra1-onos-classic-hs.infra1.svc:6653' \
    --set 'voltha.services.controller[1].service=voltha-infra1-onos-classic-1.voltha-infra1-onos-classic-hs.infra1.svc' \
    --set 'voltha.services.controller[1].port=6653' \
    --set 'voltha.services.controller[1].address=voltha-infra1-onos-classic-1.voltha-infra1-onos-classic-hs.infra1.svc:6653' \
    --set 'voltha.services.controller[2].service=voltha-infra1-onos-classic-2.voltha-infra1-onos-classic-hs.infra1.svc' \
    --set 'voltha.services.controller[2].port=6653' \
    --set 'voltha.services.controller[2].address=voltha-infra1-onos-classic-2.voltha-infra1-onos-classic-hs.infra1.svc:6653' \
    --set global.log_level=WARN --namespace voltha voltha onf/voltha-stack

ETCD
----
A `major` update is needed because tearing down the ETCD cluster means deleting the data stored,
thus requiring a rebuild by the different components.

The procedure is as follows:

#. deploy a new ETCD cluster.
#. un-provision all the subscribers via ONOS REST API
#. delete the OLT device (not strictly required, but best to ensure clean state)
#. redeploy the voltha stack with the `voltha-stack` `helm` chart pointing it to the new ETCD endpoints.
#. re-provision the OLT
#. re-provision the subscribers
#. iterate over steps 2,3,4,5,6 for each stack connected to the ETCD cluster you want to update.

Details on the `helm` commands for the voltha stack can be found in the `voltha-helm-charts README file <../voltha-helm-charts/README.md>`_

Following is an example on how to deploy a new 3 node ETCD cluster:

.. code:: bash

    helm install --create-namespace --set auth.rbac.enabled=false,persistence.enabled=false,statefulset.replicaCount=3 --namespace infra etcd bitnami/etcd

KAFKA Update
============
An update of Kafka is not considered to be a `major` software upgrade because it can be performed with
no service impact to the user.

.. code:: bash

    helm install --create-namespace --set global.log_level=WARN --namespace infra kafka bitnami/kafka

Following is an example on how to re-deploy the stack pods, using the `voltha-stack` chart,
pointing new kafka (`voltha-infra-kafka-2.infra.svc`) endpoints.
Each pod will be restarted but without dataplane interruption because it will be the same of a pod restart,
thus leveraging the data stored in ETCD.

.. code:: bash

    helm upgrade --install --create-namespace \
    --set global.topics.core_topic=voltha1_voltha1_rwcore,defaults.kv_store_data_prefix=service/minimal \
    --set global.kv_store_data_prefix=service/voltha/voltha1_voltha1 \
    --set services.etcd.port=2379 --set services.etcd.address=etcd.default.svc:2379 \
    --set services.kafka.adapter.service=voltha-infra-kafka-2.infra.svc \
    --set services.kafka.cluster.service=voltha-infra-kafka-2.infra.svc \
    --set services.etcd.service=voltha-infra-etcd.infra.svc
    --set 'voltha.services.controller[0].service=voltha-infra-onos-classic-0.voltha-infra-onos-classic-hs.infra.svc' \
    --set 'voltha.services.controller[0].port=6653' \
    --set 'voltha.services.controller[0].address=voltha-infra-onos-classic-0.voltha-infra-onos-classic-hs.infra.svc:6653' \
    --set 'voltha.services.controller[1].service=voltha-infra-onos-classic-1.voltha-infra-onos-classic-hs.infra.svc' \
    --set 'voltha.services.controller[1].port=6653' \
    --set 'voltha.services.controller[1].address=voltha-infra-onos-classic-1.voltha-infra-onos-classic-hs.infra.svc:6653' \
    --set 'voltha.services.controller[2].service=voltha-infra-onos-classic-2.voltha-infra-onos-classic-hs.infra.svc' \
    --set 'voltha.services.controller[2].port=6653' \
    --set 'voltha.services.controller[2].address=voltha-infra-onos-classic-2.voltha-infra-onos-classic-hs.infra.svc:6653' \
    --set global.log_level=WARN --namespace voltha voltha onf/voltha


.. _openolt-update:

OpenOLT Agent Update
====================

The `openolt agent` on the box can be upgrade without having to teardown all the VOLTHA stack to which the OLT was
connected. Again here we make the ditinction of a minor update and a major update of the openolt agent.
A minor update happens when there is no API change between the `openolt agent` and the `openolt adapter`, meaning the
`openolt.proto` has not been updated in either of those components.
A major update is required when there are changes to the `openolt.proto` API.

Both updates of the OpenOLT agent are service impacting for the customer.

Minor Update
------------
A minor update will be seen from VOLTHA as a reboot of the OLT.
During a minor update of the openolt agent no northbound should be done, in progress provision call will
reconcile upon OLT reboot. Events, metrics and performance measurements data can be lost and should not be expected
during this procedure.
The procedure is as follows:

#. place the new openolt agent `.deb` package on the desired OLT.
#. stop the running `openolt`, `dev_mgmnt_deamon` and optionally the `watchdog` processes on the OLT.
#. run the new openolt packages
#. reboot the OLT hardware.

After these steps are done VOLTHA will re-receive the OLT connection and re-provision data accordingly.

Major update
------------
A major update will require the OLT to be deleted from VOLTHA to ensure no inconsistent data is stored.
During a major update of the openolt agent and adapter no northbound should be done and
in progress call will fail. Events, metrics and performance measurements data will be lost.
The procedure is as follows:

#. Delete the OLT device from VOLTHA (e.g. voltctl device delete <olt_id>)
#. Upgrade the openolt-adapter to the new version via `helm upgrade`.
#. place the new openolt agent `.deb` package on the desired OLT.
#. stop the running `openolt`, `dev_mgmnt_deamon` and optionally the `watchdog` processes on the OLT.
#. run the new openolt packages
#. reboot the OLT hardware.
#. re-provision the OLT (e.g. `voltctl device provision <ip:port>`
#. re-enable the OLT (e.g. `voltctl device enable <olt_id>`
#. re-provision the subscribers.

After these steps VOLTHA effectively treats the OLT as a brand new one which it had no prior knowledge of.
