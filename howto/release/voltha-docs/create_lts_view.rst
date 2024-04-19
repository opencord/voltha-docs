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

- Visit `jenkins::Dashboard <https://jenkins.opencord.org>`_
- Click "New View" in the left margin.
- Name view for the current release VOLTHA-XXX
- Select type "List View"
- Accept basic values to begin configuring
- Add an appropriate job Description.
- Scroll down to "Job Filters"

  - Selelect individual jobs
  - Select "Use a regular expression to include jobs in the view", value: .*voltha-2.11.*

- The voltha-2.8 view deleted the "Coverage" and "Favorite" columns.
- The voltha-2.11 view is complete for now.
- Click the "create" button

Add job view in the LTS folder
------------------------------

- Visit `jenkins::Dashboard <https://jenkins.opencord.org>`_
- Click the `VOLTHA-LTS folder <https://jenkins.opencord.org/job/VOLTHA-LTS/>`_ in center.
- Click "New View" in the left margin.
- Add view name: VOLTHA-2.11
- Select "Include a global view"
- Click the "create" button
- Type in an appropriate Description.
- View name should contain the global view name VOLTHA-2.11
- Click "Apply"
- Click "OK"

Create job folder voltha-2.12 on the dashboard (not a view)
-----------------------------------------------------------

- Visit `jenkins::Dashboard <https://jenkins.opencord.org>`_
- Click "New View" in the left margin.
- Copy entry 'voltha-master'
- New name: voltha-2.12
- Click the "create" button
- Dashboard Folder ``jenkins::voltha-2.12``

Access LTS jobs
---------------
- Visit the `VOLTHA-LTS job folder <https://jenkins.opencord.org/job/VOLTHA-LTS/>`__
- Select or bookmark job view VOLTHA-2.11.
