Deploy a virtual VOLTHA POD
===========================

A guide to install a virtual POD. This is generally used to gain familiarity with the
environment or to do development.

Quickstart
----------

Requires:

- ``docker`` and ``go`` installed on your machine
- `kind-voltha <https://github.com/ciena/kind-voltha>`_ cloned on your machine

.. code:: bash

    TYPE=minimal WITH_RADIUS=y CONFIG_SADIS=y ONLY_ONE=y WITH_BBSIM=y ./voltha up

TLDR;
-----

Below are the complete steps to install a physical cluster.
Most of the steps are the same as :ref:`deploy_physical`.

Create Kubernetes Cluster
-------------------------

Kind provides a command line control tool to easily create Kubernetes
clusters using just a basic Docker envionrment. The following commands
will create the desired deployment of Kubernetes and then configure your
local copy of ``kubectl`` to connect to this cluster.

.. code:: bash

   kind create cluster --name=voltha-$TYPE --config $TYPE-cluster.cfg
   export KUBECONFIG="$(kind get kubeconfig-path --name="voltha-$TYPE")"
   kubectl cluster-info

Initialize Helm
---------------

Helm provide a capabilty to install and manage Kubernetes applications.
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

From this point follow the :ref:`physical VOLTHA POD installation instructions <installation_steps>`. Come back here once done.

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