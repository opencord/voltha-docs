=================================
Product Certification with VOLTHA
=================================

VOLTHA is part fo the `continuous certification program at ONF <https://opennetworking.org/continuous-certification-program/>`_.
You can see the currently certified products in the `ONF marketplace <https://opennetworking.org/marketplace/?_product_project=voltha>`_.

The following document describes the procedure to include and certify an OLT or an ONU with VOLTHA.
The process of getting a product certified consists of several phases:

- testing and validation with VOLTHA at the vendor premises
- showcase of successful integration with VOLTHA to the TST
- shipment and integration of the product (OLT/ONU) at a community lab (e.g. Berlin with DT)
- Creation of automated CI jobs in Jenkins that start nightly automation tests.
- Test maintenance. It's the Vendors and the VOLTHA community responsibility to maintain the created tests.

Finally a brief Description of the device and a point of contact need to be sent to
`Michelle Roth @ ONF <michelle@opennetworking.org>`_
to be showcased in the `marketplace <https://opennetworking.org/marketplace/?_product_project=voltha>`_ after successful verification.

Once all these steps are completed the product will be certified for the next release of VOLTHA.
Let's describe each phase in detail.

Vendor's premises Testing
-------------------------
The first step is for the vendor to guarantee that the OLT or the ONU are VOLTHA compatible is complying got ONF's
automated sanity test.
To do so we suggest setting up a HW test pod according as described in the `physical setup guide <https://docs.voltha.org/master/overview/lab_setup.html>`_.

Once the setup is running the next step is running the Sanity tests, as described in the `testing documentation <https://docs.voltha.org/master/voltha-system-tests/README.html#running-tests-on-physical-pod>`_.
If those pass the hardware is ready to be shown to the VOLTHA TST.

Showcase to VOLTHA TST
----------------------
Once the OLT has passed tests in the Vendor lab it's ready to be showcased to the VOLTHA Technical Steering Team.
The request needs to be performed to the Technical TST leader or to `Timon Sloane <timon@opennetworking.org>`_ who will
forward the request appropriately.
During a scheduled TST meeting (Tuesday 8 AM PST) the vendor will showcase the OLT/ONU to the TST by starting from a
fresh VOLTHA instance, connecting the OLT and then performing the Sanity test.
With the test passing the TST will give approval for shipment of the device (ONU/OLT) to an ONF community lab.

ONF's community lab integration
-------------------------------

Once the TST has given approval for device integration in VOLTHA nighly tests the Vendor needs to ship the device to
any one of the ONF community lab, including a wiring diagram (if needed) Currently there are two locations:

- DT Office in Berlin, Germany. Address: Winterfeldtstraße 21, 10781 Berlin, Germany. Point of contact `Bjoern Nagel @ DT <NagelB@telekom.de>`_
- Radisys Laboratory in Hillsboro, Oregon

Once the OLT arrives the technicians will rack it and wire it according to the diagram shared.
For an OLT the NNI connection will be provided to the AGG switch and all the management will also be connected with
management IP assigned according to the network of the pod.
For an ONU it will be connected to one of the existing OLTs in the pod, according to space,
technology and topology requirements.
Once all the racking and wiring is complete the device will appear under the ONF network, accessible via VPN.

Automated CI Jobs
-----------------
Once the device in included in one of the community pods it's the responsibility of the vendor to integrate
it into the nightly VOLTHA tests. This process is done by submitting a series of patches to different repositories.
The process is different for ONUs and OLTs.
To create jenkins jobs see https://docs.voltha.org/master/testing/voltha_test_automation.html#hardware-or-physical-pod-jobs

OLT
+++
A new OLT needs a full new configuration, job and data.
The job can be created according to the desired workflow to be tested. Information can be found in the
`system tests information <https://docs.voltha.org/master/testing/voltha_test_automation.html#hardware-or-physical-pod-jobs>`_
The required patches are:

- ci-management. Creates the job that will run in jenkins. `Job Example <https://github.com/opencord/ci-management/blob/master/jjb/voltha-test/voltha-certification.yaml>`_
- pod configs. Inserts information about the OLT and target ONUs data. `Data example <https://github.com/opencord/pod-configs/blob/master/deployment-configs/menlo-certification-pod-radisys-1600g-DT.yaml>`_
  and `kubernetes example <https://github.com/opencord/pod-configs/blob/master/kubernetes-configs/menlo-certification-pod-radisys-1600g.conf>`_
- voltha-system-tests. Adds the sadis configuration for the OLT and the ONU. `Sadis Example <https://github.com/opencord/voltha-system-tests/blob/master/tests/data/menlo-certification-pod-radisys-1600g-sadis-DT.json>`_

Once these are created and merged the job will appear on jenkins and run accordingly.

ONU
+++
A new ONU it's attached to an existing OLT, so just the information for that ONU needs to be added to the proper
OLT files.

The required patches are:

- pod configs. Inserts information about the ONU into an existing pod. `Info and Target example <https://github.com/opencord/pod-configs/blob/master/deployment-configs/menlo-certification-pod-radisys-1600g-DT.yaml>`_
- voltha-system-tests. Adds the sadis configuration for the ONU. Example `Sadis ONU example <https://github.com/opencord/voltha-system-tests/blob/master/tests/data/menlo-certification-pod-radisys-1600g-sadis-DT.json>`_

Job maintenance
---------------

It's the responsibility of the Vendor, the VOLTHA TST and the community at large to mantain, manage and update the job
to make sure the OLT gets certified for each of the following VOLTHA releases.



ONF Contacts
------------
For any further information please contact:

- `Timon Sloane <timon@opennetworking.org>`_
- `Michelle Roth <michelle@opennetworking.org>`_
