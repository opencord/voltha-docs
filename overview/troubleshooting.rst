Troubleshooting
===============

Here is a collection of useful commands and tools to troubleshoot VOLTHA.
The project is still in a very early phase, so this section of the guide is more focus
on how to collection information and packet dumps than it is on operations.

Depending on your issue useful tips and tricks can be found:

- `No ONUs are discovered <https://guide.opencord.org/master/profiles/seba/troubleshoot/no-onus.html>`_
- `Can't authenticate <https://guide.opencord.org/master/profiles/seba/troubleshoot/no-aaa.html>`_
- `DHCP is not working <https://guide.opencord.org/master/profiles/seba/troubleshoot/no-dhcp.html>`_
- `No Ping <https://guide.opencord.org/master/profiles/seba/troubleshoot/no-ping.html>`_


Trace Packets across components
-------------------------------

Given that ``VOLTHA`` is a collection of microservices we strongly suggest the usage of a log aggregator like
`stern <https://github.com/stern/stern>`_.  Stern is able to aggregate logs from multiple containers in
a simple way, for example to track all the ``packet-ins`` and ``packet-outs``:

.. code:: bash

    # Capture to a file
    $ stern -n voltha "voltha|adapter" | grep -E "packet-out|packet-in" > packets.trace

    # Live streaming packet capture using the tee command:
    $ stern -n voltha "voltha|adapter" | grep -E "packet-out|packet-in" | tee packets.trace

Once you have captured the packets you need, you can see them in wireshark by transforming the logs with:

.. code:: bash

    sed -n 's/.*packet":"\(.*\)",.*$/\1/p' packets.trace | sed -e 's/.\{2\}/& /g' | sed -e 's/^/000000 /' > packets.hex

And then in wireshark select ``File -> Import from Hex Dump``

Or you can decode a single packet using this online tool: ``http://hpd.gasmi.net``.

To get all the EAPOL packets: ``grep -e '888e' packets.trace``

or if you have the colorization program `hl <https://github.com/mbornet-hl/hl>`__ installed you can highlight with:

.. code:: bash

    cat packets.trace | grep 888e | hl -m '.*packet-in.*' -g '.*packet-out.*'

To get all the DHCP packets: ``cat packets.trace | grep 8100``

or if you have `hl <https://github.com/mbornet-hl/hl>`__ installed you can highlight with:

.. code:: bash

    cat packets.trace | grep 8100 | hl -m '.*packet-in.*' -g '.*packet-out.*'

OMCI Packet Dump
----------------

In order to see OMCI packets in Wireshark you'll need to install ``omci.lua`` and ``BinDecHex.lua`` dissectors
`wiki.wireshark.org/Contrib` ``http://wiki.wireshark.org/Contrib#protocol-dissectors``

To install them on Ubuntu:

.. code:: bash

    mkdir -p "${HOME}/.local/lib/wireshark/plugins"
    cd "${HOME}/.local/lib/wireshark/plugins"
    wget "https://wiki.wireshark.org/Contrib?action=AttachFile&do=get&target=omci.lua"
    wget "https://wiki.wireshark.org/Contrib?action=AttachFile&do=get&target=BinDecHex.lua"

- IMPORTANT - Apply `this <http://ask.wireshark.org/question/4557/bindechexlua-error-bad-argument-to-module-packageseeall/?answer=4573#post-id-4573>`_ fix to BinDecHex.lua.

- TODO NOTE - The BinDecHex.lua thread is 4 years old, is the patch still
  required or has it been incorporated into the code base ?

To capture the OMCI packets for all ONUs:

.. code:: bash

    cat openonu.logs | grep -E "TxOmciMessage|RxOmciMessage" | grep msg > packets.trace

To capture the OMCI packets for a particular ONU:

.. code:: bash

    cat openonu.logs | grep -E "TxOmciMessage|RxOmciMessage" | grep msg | grep [deviceId] > packets.trace

Once you have the ``omci.dump`` file you need to prepare it to be imported in wireshark with this command:

.. code:: bash

    awk -F"OmciMessage" '/OmciMessage/{print $2}' packets.trace | cut -f3 -d'"' > rawdump
    cat rawdump | sed -e 's/.\{2\}/& /g' | sed -e 's/^/000000 /' > omci.hex

And then in wireshark:

- select ``File -> Import from Hex Dump``
- select ``Encapsulation Type -> Ethernet``
- set ``Ethernet -> Ethertype (hex): 88b5``
