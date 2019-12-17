Development Loop
================

Start with `kind-voltha <https://github.com/ciena/kind-voltha>`_. installed.

Make changes
------------

We assume you already have downloaded the repository you want to modify and your IDE is correctly set up.

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

Then redeploy `kind-voltha` using that value file:

.. code:: bash

    $ DEPLOY_K8S=no ./voltha down && DEPLOY_K8S=no EXTRA_HELM_FLAGS="-f dev-values.yaml" ./voltha up