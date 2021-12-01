Bandwidth Profiles in VOLTHA
=============================================

This document describes Bandwidth profiles iformat in Sadis, how they are configured to VOLTHA and
how they are mapped to physical configuration for the OLT and the ONU with Traffic Descriptors
and T-CONT configuration.


Bandwidth Profiles Representations in Sadis
===========================================
The ONOS Sadis application supports configuration of the bandwidth profiles in two formats, `IETF` and `MEF`.
The values contained are expressed in kilobits/second (kbps).

The `MEF` format is as follows:

.. code:: json

 {
   "id": "Default",
   "air": 100000,
   "cbs": 30,
   "cir": 600,
   "ebs": 30,
   "eir": 400
 }

and the `IETF` format:

.. code:: json

 {
   "id": "DT_downstream_default_bw_profile",
   "pir": 1168192,
   "pbs": 0,
   "cir": 0,
   "cbs": 0,
   "gir": 0
 }

Independently of the format the `olt` ONOS apps will generate a Meter per bandwidth profile.

An example of a meter in ONOS is:

.. code:: bash

 onos> meters
 DefaultMeter{device=of:00000a0a0a0a0a0a, cellId=1, appId=DefaultApplicationId{id=411, name=org.opencord.olt}, unit=KB_PER_SEC, isBurst=true, state=ADDED, bands=[DefaultBand{rate=600, burst-size=30, type=DROP, drop-precedence=null}, DefaultBand{rate=101000, burst-size=60, type=DROP, drop-precedence=null}, DefaultBand{rate=100000, burst-size=0, type=DROP, drop-precedence=null}], annotations={}}

note the different bands that map to the values of the `Default` bandwidth profile as well.

The `cellId=1` value is the identification of the meter and it will be used in flows for a subscriber that requires
the specific bandwidth profile corresponding to that meter.

We can check the bandwidthProfile associated with this meter:

.. code:: bash

 onos> volt-bpmeter-mappings
 bpInfo=Default deviceId=of:00000000c0a8646f meterId=1

From the above, we see that `meterId=1` corresponds to bandwidthProfile Default, configured in SADIS.

We can check the parameters of the configured bandwidthProfile with the following command:

.. code:: bash

 onos> bandwidthprofile Default
 BandwidthProfileInformation{id=Default, committedInformationRate=600, committedBurstSize=30, exceededInformationRate=400, exceededBurstSize=30

TCONT Mapping
-------------

Different Bandwidth profiles get mapped do different TCONT types:

- For TCONT Type-1: If GIR > 0, GIR = PIR, additional_bw_eligibility = none -> set guaranteed_bw
  = maximum_bw = CBR_RT_BW (or CBR_NRT_BW) = GIR and alloc_type=none and send these parameters to BAL.
  (alloc_type is inferred from the other parameters)
- For TCONT Type-2: If GIR = 0, CIR > 0, CIR = PIR, additional_bw_eligibility = none -> set guaranteed_bw
  = maximum_bw = CIR, CBR_RT_BW = 0 and CBR_NRT_BW = 0 and alloc_type = NSR and send these parameters to BAL.
  (alloc_type is set to NSR by default)
- For TCONT Type-3: If GIR = 0, CIR > 0, PIR > CIR,  additional_bw_eligibility = non_assured -> set guaranteed_bw
  = CIR, maximum_bw = PIR, CBR_RT_BW = 0 and CBR_NRT_BW = 0 and alloc_type = NSR and send these parameters to BAL.
  (alloc_type is set to NSR by default)
- For TCONT Type-4: if GIR = 0, CIR = 0, PIR > 0, additional_bw_eligibility = best_effort -> set guaranteed_bw = 0,
  maximum_bw = PIR, CBR_RT_BW = 0 and CBR_NRT_BW = 0 and alloc_type = NSR and send these parameters to BAL.
  (alloc_type is set to NSR by default)
- For TCONT Type-5: if GIR > 0, PIR >= GIR + CIR, additional_bw_eligibility = non_assured or best_effort -> set
  guaranteed_bw = GIR+CIR, maximum_bw = PIR, CBR_RT_BW (or CBR_NRT_BW) = GIR and alloc_type = NSR and send these
  parameters to BAL. (alloc_type is set to NSR by default)

The `additional_bw_eligibility` can take `None`, `BestEffort`, `NonAssured` as values.

Further information can be found in this `document <https://docs.google.com/document/d/1HipmsHD5LEQlOc-Y2tYV7DHD1fn7-_1lehBgp79sRwU/edit?usp=sharing>`_
that goes into depth about the T-CONT type support.

Traffic Descriptor (TD)
-----------------------
The `G.988 standard <https://www.itu.int/rec/T-REC-G.988-202109-I!Amd4/en>`_ at page 117 describes the mapping of values to Traffic Descriptor MEs.

Please note that the values for the elements in the Traffic Descriptor ME are in Bytes/second so a conversion from the
kilobits/second of the Sadis representation is done by multiplying the values by 125 (kbps --> bps --> Bps).


