Jenkins job views: VOLTHA-LTS
=============================

Intent
------

With each new VOLTHA LTS release (v2.11, v2.8) a jenkins view will need
to be created to allow running regression tests.  This page will document
those instructions.

LTS Folder
----------
Visit `jenkins::Dashboard <https://jenkins.opencord.org>`_ and create a
VOLTHA-LTS folder if one does not exist.

- Click ``New Item`` in the left margin.
- For ``item name`` type in VOLTHA-LTS
- Click Folder or Copy from an existing folder.
- Uncheck "Add to current view"
- Click the OK button

Jenkins job view: global
------------------------

Two view creation options are available

- global - all jobs are selectable
- local  - simple list creation

Global job view creation
------------------------

This option will add a named view in the `jenkins::Dashboard soup <https://jenkins.opencord.org/>`__ at the top.

- Visit `jenkins::Dashboard <https://jenkins.opencord.org>`_
- Click "New View" in the left margin.
- Name view for the current release voltha-2.12
- Select type "List View"
- Click the "create" button
- Accept basic values to begin configuring
- Add an appropraite job Description.
- Scroll down to "Job Filters"

  - Selelect individual jobs to hardcode an explicit list.
  - Select "Use a regular expression to pattern match", value: .*voltha-2.12.*

- Removing voltha-2.8 view deleted the "Coverage" and "Favorite" columns.
- The voltha-2.12 view is complete for now.
- Click the [ok] button

Add new release job view in the LTS folder
------------------------------------------

- Visit `jenkins::Dashboard <https://jenkins.opencord.org>`_
- Click the `VOLTHA-LTS folder <https://jenkins.opencord.org/job/VOLTHA-LTS/>`_ in the center panel beneath job view soup at the top.
- Click "New View" in the left margin.
- Add view name: VOLTHA-2.12
- Select "Include a global view"
- Click the "create" button
- Type in an appropraite Description.
- View name should contain the global view name VOLTHA-2.12 created earlier
- Click "OK"

Access LTS jobs
---------------
- Visit the `VOLTHA-LTS job folder <https://jenkins.opencord.org/job/VOLTHA-LTS/>`__
- Select or bookmark job view `VOLTHA-2.12 <https://jenkins.opencord.org/job/VOLTHA-LTS/view/voltha-2.12/>`_
