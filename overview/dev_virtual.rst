.. _dev_virtual:

Developing code with a virtual VOLTHA POD
=========================================

A guide to install a virtual POD. This is generally used to gain familiarity with the
environment or for development purposes.

Most of the `helm` and `voltctl` commands found in the :ref:`pod_physical` also
apply in the virtual environment.

Quickstart
----------

Requires:

- ``docker`` and ``go`` installed on your machine
- `kind-voltha <https://gerrit.opencord.org/gitweb?p=kind-voltha.git>`_ cloned
  on your machine

.. code:: bash

    TYPE=minimal WITH_RADIUS=y CONFIG_SADIS=y ONLY_ONE=y WITH_BBSIM=y ./voltha up

For more information you can visit the `kind-voltha page <kind-voltha/README.md>`_.

Install BBSIM (Broad Band OLT/ONU Simulator)
--------------------------------------------

BBSIM provides a simulation of a BB device. It can be useful for
testing.

Create BBSIM Device
^^^^^^^^^^^^^^^^^^^

After having deployed BBSIM either through `kind-voltha` or manually `bbsim <bbsim/docs/source/index.rst>`_ you can create a similated OLT.

.. code:: bash

   voltctl device create -t openolt -H $(kubectl get -n voltha service/bbsim -o go-template='{{.spec.clusterIP}}'):50060

Enable BBSIM Device
^^^^^^^^^^^^^^^^^^^

.. code:: bash

   voltctl device enable $(voltctl device list --filter Type~openolt -q)

Observing the newly created device in ONOS
------------------------------------------

At this point you should be able to see a new device in ONOS.

You can SSH into ONOS via

.. code:: bash

    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p 8201 karaf@localhost

with password ``karaf``.

Now when issuing `ports` command you should see something along the lines of:

.. code:: bash

   karaf@root > ports
   id=of:00000a0a0a0a0a00, available=true, local-status=connected 29s ago, role=MASTER, type=SWITCH, mfr=VOLTHA Project, hw=open_pon, sw=open_pon, serial=BBSIM_OLT_0, chassis=a0a0a0a0a00, driver=voltha, channelId=10.244.2.7:48630, managementAddress=10.244.2.7, protocol=OF_13
   port=16, state=enabled, type=fiber, speed=0 , adminState=enabled, portMac=08:00:00:00:00:10, portName=BBSM00000001-1
   port=17, state=disabled, type=fiber, speed=0 , adminState=enabled, portMac=08:00:00:00:00:11, portName=BBSM00000001-2
   port=18, state=disabled, type=fiber, speed=0 , adminState=enabled, portMac=08:00:00:00:00:12, portName=BBSM00000001-3
   port=19, state=disabled, type=fiber, speed=0 , adminState=enabled, portMac=08:00:00:00:00:13, portName=BBSM00000001-4
   port=1048576, state=enabled, type=fiber, speed=0 , adminState=enabled, portMac=0a:0a:0a:0a:0a:00, portName=nni-1048576


Developing changes on a virtual pod
-----------------------------------

We assume you already have downloaded the git repository you want to modify and
your IDE is correctly set up.

In this tutorial we are going to use ``voltha-go`` as an example.

Make the required changes in the ``voltha-go`` repository (the process
is the same for all the VOLTHA repositories) to the code and build the
docker images and push them on your private dockerhub account:

.. code:: bash

   $ DOCKER_REGISTRY="matteoscandolo/" DOCKER_TAG="dev" make docker-build

Then push them to your docker hub account:

.. code:: bash

   $ DOCKER_REGISTRY="matteoscandolo/" DOCKER_TAG="dev" make docker-push

Deploy your changes on kind-voltha
----------------------------------

Create a copy of the `minimal-values.yaml` file:

.. code:: bash

    $ cp minimal-values.yaml dev-values.yaml

And edit that file so that it contains the appropriate values for the images you want to try,
for example uncomment and change these two lines (mind the indentation):

.. code:: yaml

    images:
      ro_core:
        repository: matteoscandolo/voltha-ro-core
        tag: dev
      rw_core:
        repository: matteoscandolo/voltha-rw-core
        tag: dev

Then redeploy `kind-voltha` using that the edited value file:

.. code:: bash

    $ DEPLOY_K8S=no ./voltha down && DEPLOY_K8S=no EXTRA_HELM_FLAGS="-f dev-values.yaml" ./voltha up

Create Kubernetes Cluster
-------------------------

Kind provides a command line control tool to easily create Kubernetes
clusters using just a basic Docker environment. The following commands
will create the desired deployment of Kubernetes and then configure your
local copy of ``kubectl`` to connect to this cluster.

.. code:: bash

   kind create cluster --name=voltha-$TYPE --config $TYPE-cluster.cfg
   export KUBECONFIG="$(kind get kubeconfig-path --name="voltha-$TYPE")"
   kubectl cluster-info

Initialize Helm
---------------

Helm provide a capability to install and manage Kubernetes applications.
VOLTHA’s default deployment mechanism utilized Helm. Before Helm can be
used to deploy VOLTHA it must be initialized and the repositories that
container the artifacts required to deploy VOLTHA must be added to Helm.

.. code:: bash

   # Initialize Helm and add the required chart repositories
   helm init
   helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com
   helm repo add stable https://kubernetes-charts.storage.googleapis.com
   helm repo add onf https://charts.opencord.org
   helm repo update

   # Create and k8s service account so that Helm can create pods
   kubectl create serviceaccount --namespace kube-system tiller
   kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
   kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

From this point follow the :ref:`physical VOLTHA POD installation instructions
<installation_steps>`. Come back here once done.
