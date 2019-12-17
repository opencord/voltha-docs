VOLTHA development loop
=======================

Start with `kind-voltha <https://github.com/ciena/kind-voltha>`_. installed.

Make changes
------------

We assume you already have downloaded the repository you want to modify and your IDE is correctly set up.

In this tutorial we are going to use ``voltha-go`` as an example.

Make the required changes to the code and build the docker images and push them on your private dockerhub account:

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

Then bring up `kind-voltha` with using that value file:

.. code:: bash

    $ EXTRA_HELM_FLAGS="-f dev-values.yaml" ./voltha up

Explore VOLTHA logs
-------------------

Given that ``VOLTHA`` is a collection of microservices we strongly suggest the usage of a log aggregator like
`stern <https://github.com/wercker/stern>`_. installed. You can then aggregate logs from multiple containers in a simple way, for example you can track
all the ``packet-in`` and ``packet-outs`` in the ``rw-cores``:

.. code:: bash

    $ stern -n voltha "voltha|adapter" | grep -E "packet-out|packet-in" > packets.trace

    $ stern -n voltha rw-core | grep "packet-out-error"

    $ stern -n voltha "rw-core|open-olt|ofagent"

Once you have captured the packets you need, you can see them in wireshark by transforming the logs with:

.. code:: bash

    sed -n 's/.*packet":"\(.*\)",.*$/\1/p' packets.trace | sed -e 's/.\{2\}/& /g' | sed -e 's/^/000000 /' > packets.hex

And then in wireshark select ``Import from Hex Dump``

Or you can decode a single packet using this online tool: `https://hpd.gasmi.net <https://hpd.gasmi.net>`_

To get all the EAPOL packets: ``cat packets.trace | grep 888e``

or if you have `hl <https://github.com/mbornet-hl/hl>`_ installed you can highlight with: ``cat packets.trace | grep 888e | hl -m '.*packet-in.*' -g '.*packet-out.*'``

To get all the DHCP packets: ``cat packets.trace | grep 8100``

# TODO repeat the test with EAPOL and DHCP logs to trace in ONOS

cat voltha.logs | grep -E "packet-in|packet-out|packet-out-error" | hl -c '.*packet-in.*' -g '.*packet-out[",].*' -r '.*packet-out-error.*'

cat voltha.logs | grep -E "packet-in|packet-out|packet-out-error" | grep 8100 | hl -c '.*packet-in.*' -g '.*packet-out[",].*' -r '.*packet-out-error.*'


OMCI Packet Dump
================

### Install omci wireshark dissectors
Install omci.lua and BinDecHex.lua dissectors [wiki.wireshark.org/Contrib](https://wiki.wireshark.org/Contrib#Protocol_Dissectors):

Ubuntu

    mkdir -p $(HOME)/.local/lib/wireshark/plugins
    cd $(HOME)/.local/lib/wireshark/plugins
    wget "https://wiki.wireshark.org/Contrib?action=AttachFile&do=get&target=omci.lua"
    wget "https://wiki.wireshark.org/Contrib?action=AttachFile&do=get&target=BinDecHex.lua"

IMPORTANT - Apply [this](https://ask.wireshark.org/question/4557/bindechexlua-error-bad-argument-to-module-packageseeall/?answer=4573#post-id-4573) fix to BinDecHex.lua.

// for all ONUs
cat openonu.logs | grep -E "receive_message|_send_next" | grep msg > omci.dump

// for one ONU
cat openonu.logs | grep -E "receive_message|_send_next" | grep msg | grep [deviceId] > omci.dump

sed -n "s/.*[omci_msg|msg]: b'\(.*\)',.*$/\1/p" omci.dump | sed -e 's/.\{2\}/& /g' | sed -e 's/^/000000 /' > omci.hex

Load omci hexdump into wireshark
File -> Import from Hex Dump
Browse -> omci.hex
Encapsulation Type -> Ethernet
Ethernet -> Ethertype (hex): 88b5
