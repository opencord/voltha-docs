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

Install BBSIM (Broad Band OLT/ONU Simulator)
--------------------------------------------

BBSIM provides a simulation of a BB device. It can be useful for
testing.

.. code:: bash

   helm install -f minimal-values.yaml --namespace voltha --name bbsim onf/bbsim

Create BBSIM Device
^^^^^^^^^^^^^^^^^^^

.. code:: bash

   voltctl device create -t openolt -H $(kubectl get -n voltha service/bbsim -o go-template='{{.spec.clusterIP}}'):50060

Enable BBSIM Device
^^^^^^^^^^^^^^^^^^^

.. code:: bash

   voltctl device enable $(voltctl device list --filter Type~openolt -q)


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
