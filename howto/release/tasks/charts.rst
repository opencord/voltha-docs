.. _Release Task Helm Charts:

Helm Chart Update
=================

.. code-block:: shell-session
   :caption: Update helm charts for deployed VOLTHA and ONOS artifacts

   # clone repo:voltha-helm-charts
   % git clone "git@github.com:opencord/voltha-helm-charts.git"
   % cd voltha-helm-charts

   # Gather files to edit
   % vi $(grep -r 'adapter' . | cut -d: -f1 | sort -u)

   # Gather indirect dependencies to edit
   vi voltha/Chart.yaml voltha-infra/Chart.yaml voltha-stack/Chart.yaml

   # Sanity check edits
   % make lint-chart
   % make lint-helm
