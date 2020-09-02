.. _operate:

Operate a VOLTHA POD
====================

In this page we assume that you have a VOLTHA POD (either Physical or Virtual) up and running.

Provision an OLT
----------------

The first step in order to operate a VOLTHA POD is to add an OLT to it.

If you deployed a Virtual cluster you can create a BBSim based OLT in VOLTHA with:

.. code:: bash

    voltctl device create -t openolt -H bbsim0.voltha.svc:50060

*If you have deployed multiple BBSim instances using the ``NUM_OF_BBSIM`` variable
you can list all the available BBSim OLTs with ``kubectl get svc --all-namespaces | grep bbsim``*

If you are connecting to a Physical OLT:

.. code:: bash

    voltctl device create -t openolt -H <olt-management-ip>:9191

Regardless of the OLT the command to ``enable`` an OLT in VOLTHA is always the same:

.. code:: bash

    voltctl device enable <device-id>

*The ``device id`` is the output of the ``device create`` command, or can be retrieved
with ``voltctl device list``*

If you have just one OLT create you can use :

.. code:: bash

    voltctl device enable $(voltctl device list --filter Type~openolt -q)

Once the OLT is ``enabled`` in VOLTHA you should be able to see the ONU attached
to it by listing the devices:

.. code:: bash

    voltctl device list

Authentication
--------------

If the use-case you installed (e.g. AT&T) expects EAPOL based authentication you want to make
sure that is working. Visit :ref:`workflows` for more information.

In a **Physical POD** you need to trigger authentication on your client
(if it doesn't do so automatically). You can refer to :ref:`setting-up-a-client`.

In a **Virtual POD** installed with the ``WITH_EAPOL="yes"`` flag authentication
happens automatically.

You can check the authentication state for your subscribers via the ONOS cli:

.. code:: bash

    ssh -p 8101 karaf@localhost # (pwd: karaf)
    karaf@root > aaa-users
    of:00000a0a0a0a0a00/16: AUTHORIZED_STATE, last-changed=5m14s ago, mac=2E:60:70:00:00:01, subid=BBSM00000001-1, username=user

*Note that if ONOS was not installed as parted of VOLTHA the ``ssh`` command may differ*

Subscriber provisioning
-----------------------

*Note that, depending on the workflow, authentication is not a requirement of subscriber provisioning*

The process referred to as ``Subscriber provisioning`` causes traffic flows to be created in ONOS and
 data plane path to be configured in the device, enabling different services on a specific UNI port.

In order to provision a subscriber you need to identify it. In ONOS a subscriber
is viewed as an enabled port (UNI) on the logical switch that VOLTHA exposes, for example:

.. code:: bash

    ssh -p 8101 karaf@localhost # (pwd: karaf)
    karaf@root > ports -e
    id=of:00000a0a0a0a0a00, available=true, local-status=connected 8m27s ago, role=MASTER, type=SWITCH, mfr=VOLTHA Project, hw=open_pon, sw=open_pon, serial=BBSIM_OLT_0, chassis=a0a0a0a0a00, driver=voltha, channelId=10.244.2.7:53576, managementAddress=10.244.2.7, protocol=OF_13
      port=16, state=enabled, type=fiber, speed=0 , adminState=enabled, portMac=08:00:00:00:00:10, portName=BBSM00000001-1
      port=1048576, state=enabled, type=fiber, speed=0 , adminState=enabled, portMac=0a:0a:0a:0a:0a:00, portName=nni-1048576

Once the port number representing a subscriber has been retrieved, you can provision it via:

.. code:: bash

    ssh -p 8101 karaf@localhost # (pwd: karaf)
    karaf@root > volt-add-subscriber-access of:00000a0a0a0a0a00 16

Where ``of:00000a0a0a0a0a00`` is the OpenFlow ID of the Logical Device representing the OLT
and ``16`` is the port representing that particular subscriber.

To verify that the subscriber has been provisioned:

.. code:: bash

    ssh -p 8101 karaf@localhost # (pwd: karaf)
    karaf@root > volt-programmed-subscribers
    location=of:00000a0a0a0a0a00/16 tagInformation=UniTagInformation{uniTagMatch=0, ponCTag=900, ponSTag=900, usPonCTagPriority=-1, usPonSTagPriority=-1, dsPonCTagPriority=-1, dsPonSTagPriority=-1, technologyProfileId=64, enableMacLearning=false, upstreamBandwidthProfile='Default', downstreamBandwidthProfile='Default', serviceName='', configuredMacAddress='A4:23:05:00:00:00', isDhcpRequired=true, isIgmpRequired=false}

You can also verify that the expected flows have been created and ``ADDED`` to VOLTHA:

.. code:: bash

    ssh -p 8101 karaf@localhost # (pwd: karaf)
    karaf@root > flows -s
    deviceId=of:00000a0a0a0a0a00, flowRuleCount=8
      ADDED, bytes=0, packets=0, table=0, priority=10000, selector=[IN_PORT:16, ETH_TYPE:eapol, VLAN_VID:900], treatment=[immediate=[OUTPUT:CONTROLLER], meter=METER:1, metadata=METADATA:384004000000000/0]
      ADDED, bytes=0, packets=0, table=0, priority=10000, selector=[IN_PORT:16, ETH_TYPE:ipv4, VLAN_VID:900, IP_PROTO:17, UDP_SRC:68, UDP_DST:67], treatment=[immediate=[OUTPUT:CONTROLLER], meter=METER:1, metadata=METADATA:4000000000/0]
      ADDED, bytes=0, packets=0, table=0, priority=10000, selector=[IN_PORT:1048576, ETH_TYPE:lldp], treatment=[immediate=[OUTPUT:CONTROLLER]]
      ADDED, bytes=0, packets=0, table=0, priority=10000, selector=[IN_PORT:1048576, ETH_TYPE:ipv4, IP_PROTO:17, UDP_SRC:67, UDP_DST:68], treatment=[immediate=[OUTPUT:CONTROLLER]]
      ADDED, bytes=0, packets=0, table=0, priority=1000, selector=[IN_PORT:16, VLAN_VID:0], treatment=[immediate=[VLAN_ID:900], transition=TABLE:1, meter=METER:1, metadata=METADATA:384004000100000/0]
      ADDED, bytes=0, packets=0, table=0, priority=1000, selector=[IN_PORT:1048576, METADATA:384, VLAN_VID:900], treatment=[immediate=[VLAN_POP], transition=TABLE:1, meter=METER:1, metadata=METADATA:384004000000010/0]
      ADDED, bytes=0, packets=0, table=1, priority=1000, selector=[IN_PORT:1048576, METADATA:10, VLAN_VID:900], treatment=[immediate=[VLAN_ID:0, OUTPUT:16], meter=METER:1, metadata=METADATA:4000000000/0]
      ADDED, bytes=0, packets=0, table=1, priority=1000, selector=[IN_PORT:16, VLAN_VID:900], treatment=[immediate=[VLAN_PUSH:vlan, VLAN_ID:900, OUTPUT:1048576], meter=METER:1, metadata=METADATA:4000000000/0]

*The flows above may vary in form and number from workflow to workflow, the example is given for the ATT workflow*

Flows can also be checked in VOLTHA trhough `voltctl`:

.. code:: bash

    voltctl device flows 17bfa0c8-bd86-4ead-b755-d612bfda9c5b
    ID                  TABLEID    PRIORITY    COOKIE       INPORT       VLANID    ETHTYPE    IPPROTO    UDPSRC    UDPDST    METADATA              TUNNELID    SETVLANID    POPVLAN    PUSHVLANID    OUTPUT        WRITEMETADATA         METERID
    2e80b1ff53a75953    0          1000        ~986cca9a    536870912    900                                                                       16          900                     0x8100        1048576       0x0000004000000000    1
    37931e7d3cd25140    0          10000       ~ba31a4f2    536870912    900       0x0800     17         68        67                              16                                                CONTROLLER    0x0000004000000000    1
    6c4a02b93c22ba55    0          10000       ~ce6c3527    1048576                0x88cc                                                                                                            CONTROLLER
    2ba82605da4ff200    0          10000       ~f81586a7    1048576                0x0800     17         67        68                                                                                CONTROLLER
    3102d254d97eda94    0          10000       ~5eb48e6a    536870912    900       0x888e                                                          16                                                CONTROLLER    0x0384004000000000    1
    49f503c2f9f7203b    0          1000        ~531d5ec9    1048576      900                                                 0x0000000000000384    16                       yes                      536870912     0x0384004000000010    1

DHCP Allocation
---------------

If the use-case you installed expect DHCP to be handled by ONOS it's time to check
that an IP has correctly been allocated to the subscriber.

In a **Physical POD** you need to trigger a DHCP request on your client
(if it doesn't do so automatically). You can refer to :ref:`setting-up-a-client`.

In a **Virtual POD** installed with the ``WITH_DHCP="yes"`` flag a DHCP requests
happens automatically.

You can check the DHCP state for your subscribers via the ONOS cli:

.. code:: bash

    ssh -p 8101 karaf@localhost # (pwd: karaf)
    karaf@root > dhcpl2relay-allocations
    01SubscriberId=BBSM00000001-1,ConnectPoint=of:00000a0a0a0a0a00/16,State=DHCPACK,MAC=2E:60:70:00:00:01,CircuitId=BBSM00000001-1,IP Allocated=192.168.240.6,Allocation Timestamp=2020-07-27T22:39:24.140361Z

Data plane validation
---------------------

If you deployed a **Virtual POD** with a BBSim OLT you are done. BBSim does not support
data plane emulation at the moment.

If you deployed a **Physical POD** then you should now be able to reach the internet, from
your client attached to the UNI port you provisioned during the ``subscriber provisioning`` step.
