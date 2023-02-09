gitreview branch update
-----------------------

After a release has been created and repositories have been branched & tagged:

- voltha-helm-charts
- voltha-system-tests

Update the .gitreview file on the voltha-x.y release branch so commits are
directed to branch=voltha-x.y rather than the default voltha=master

.. code-block::
   :emphasize-lines: 6

   [gerrit]
   host=gerrit.opencord.org
   port=29418
   project=voltha-helm-charts.git
   defaultremote=origin
   defaultbranch=master

.. code-block::
   :emphasize-lines: 6

   [gerrit]
   host=gerrit.opencord.org
   port=29418
   project=voltha-helm-charts.git
   defaultremote=origin
   defaultbranch=voltha-2.11
