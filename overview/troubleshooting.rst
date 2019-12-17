Troubleshooting
===============

Here is a collection of useful commands and tools to troubleshoot VOLTHA.
The project is still in a very early phase, so this section of the guide is more focus
on how to collection information and packet dumps than it is on operations.

Trace Packets across components
-------------------------------

Given that ``VOLTHA`` is a collection of microservices we strongly suggest the usage of a log aggregator like
`stern <https://github.com/wercker/stern>`_. installed. You can then aggregate logs from multiple containers in a simple way,
for example to track all the ``packet-ins`` and ``packet-outs``:

.. code:: bash

    $ stern -n voltha "voltha|adapter" | grep -E "packet-out|packet-in" > packets.trace

Once you have captured the packets you need, you can see them in wireshark by transforming the logs with:

.. code:: bash

    sed -n 's/.*packet":"\(.*\)",.*$/\1/p' packets.trace | sed -e 's/.\{2\}/& /g' | sed -e 's/^/000000 /' > packets.hex

And then in wireshark select ``File -> Import from Hex Dump``

Or you can decode a single packet using this online tool: `https://hpd.gasmi.net <https://hpd.gasmi.net>`_

To get all the EAPOL packets: ``cat packets.trace | grep 888e``

or if you have `hl <https://github.com/mbornet-hl/hl>`__ installed you can highlight with:

.. code:: bash

    cat packets.trace | grep 888e | hl -m '.*packet-in.*' -g '.*packet-out.*'

To get all the DHCP packets: ``cat packets.trace | grep 8100``

or if you have `hl <https://github.com/mbornet-hl/hl>`__ installed you can highlight with:

.. code:: bash

    cat packets.trace | grep 8100 | hl -m '.*packet-in.*' -g '.*packet-out.*'

OMCI Packet Dump
----------------

In order to see OMCI packets in Wireshark you'll need to install ``omci.lua`` and ``BinDecHex.lua`` dissectors
`wiki.wireshark.org/Contrib <https://wiki.wireshark.org/Contrib#Protocol_Dissectors>`_.

To install them on Ubuntu:

.. code:: bash

    mkdir -p $(HOME)/.local/lib/wireshark/plugins
    cd $(HOME)/.local/lib/wireshark/plugins
    wget "https://wiki.wireshark.org/Contrib?action=AttachFile&do=get&target=omci.lua"
    wget "https://wiki.wireshark.org/Contrib?action=AttachFile&do=get&target=BinDecHex.lua"

IMPORTANT - Apply `this <https://ask.wireshark.org/question/4557/bindechexlua-error-bad-argument-to-module-packageseeall/?answer=4573#post-id-4573>`_ fix to BinDecHex.lua.

To capture the OMCI packets for all ONUs:

.. code:: bash

    cat openonu.logs | grep -E "receive_message|_send_next" | grep msg > omci.dump

To capture the OMCI packets for a particular ONU:

.. code:: bash

    cat openonu.logs | grep -E "receive_message|_send_next" | grep msg | grep [deviceId] > omci.dump

Once you have the ``omci.dump`` file you need to prepare it to be imported in wireshark with this command:

.. code:: bash

    sed -n "s/.*[omci_msg|msg]: b'\(.*\)',.*$/\1/p" omci.dump | sed -e 's/.\{2\}/& /g' | sed -e 's/^/000000 /' > omci.hex

And then in wireshark:

- select ``File -> Import from Hex Dump``
- select ``Encapsulation Type -> Ethernet``
- set ``Ethernet -> Ethertype (hex): 88b5``
