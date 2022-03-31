.. _jenkins_setup:

How to setup a node for CI intergration
=======================================

*NOTE that this guide has only been tested with Jenkins, but we assume a similar
set of tools would be required for different CI systems as well.*

This page is intended to provide pointers to useful instructions
that you need to setup your ``Jenkins`` executor and a list of tools install on it in order to
run the automated tests using the ``ci-management`` pipelines that are used on the `OpenCORD Jenkins <https://jenkins.opencord.org/>`_

.. _jenkins_node:

Connect an executor to Jenkins
------------------------------

A good guide to do this can be found at `<https://devopscube.com/setup-slaves-on-jenkins-2/>`_.
At ONF we setup one of the node in the Kubernetes cluster as Jenkins Agent, but that is not mandatory
as long as ``kubectl`` installed on the Jenkins Agent can interact with the cluster.

Prerequisites for this step are listed in the page, but reported here for your convenience:

* Ubuntu (our executors use 20.04, other versions/distros might work as well but they have not been tested)
* Java
* A valid Linux user account that can perform the required tasks on the agent server.
  (We suggest to use a dedicated ``jenkins`` user)

Once the executor is setup in as a Jenkins Agent there are a few other tools that the pipeline
will require in order to run the test cases:

* Kubectl - `<https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/>`_
* Helm - `<https://helm.sh/docs/intro/install/>`_
* Kail - `<https://github.com/boz/kail>`_
* Python3 - `<https://docs.python-guide.org/starting/install3/linux/>`_ (if you want to default ``python`` to ``python3``: `<https://webcache.googleusercontent.com/search?q=cache:uSzCWsWfCHsJ:https://linuxconfig.org/how-to-change-from-default-to-alternative-python-version-on-debian-linux+&cd=3&hl=en&ct=clnk>`_)
* pip3 - `<https://pip.pypa.io/en/latest/installation/>`_
* virtualenv - `<https://bootstrap.pypa.io/get-pip.py>`_
* repo - `<https://stackoverflow.com/questions/4350344/how-to-install-androids-repo-on-my-ubuntu-system>`_
* sshpass
* jq
* make

*NOTE that the tool without links are ``apt`` installable*
