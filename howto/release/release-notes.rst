Release Notes
=============

Intent
------
This page details howto create a release notes page on the docs.voltha.org website.


Cookbook: Patch #1
------------------
- `VOL-5009 <https://lf-broadband.atlassian.net/browse/VOL-5009>`_ - For tracking, create a jira ticket to create a release notes page.
- Clone repository `repo:voltha-docs <https://gerrit.opencord.org/plugins/gitiles/voltha-docs>`_
- Modify `VERSION <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/VERSION>`_ file to prevent publishing.

  - Specify a version string with a -dev suffix (2.11.55-dev)
  - The ``*-dev`` suffix will inhibit publishing release notes to https://docs.voltha.org.
  - Helpful but not required, avoid specifying the new release version until they are finalized.

  - This will help retain a logical initial version string like
    voltha-2.12.0 VS voltha-2.12.22 in case several edits are needed to
    finalize documentation.

- Copy the release notes template to create an empty release notes file:

  - Source: `release_notes/template.rst <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/release_notes>`__.
  - Examine the last release notes file and transfer any relevant generic text into template.rst.
  - % cp `release_notes/template.rst <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/release_notes>`__ `release_notes/voltha_2.12.rst <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/release_notes/voltha_2.11.rst>`_

- Add `release_notes/voltha_2.12.rst <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/release_notes/voltha_2.11.rst>`_ in the index file `release_notes/index.rst <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/release_notes/index.rst>`_

- Modify `config.py <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/conf.py>`_ so ``make linkcheck`` will not fail on yet-to-be-generated html release notes file.

- Release notes: content and hilights:

  - Ask `VOLTHA TST(s) <https://opennetworking.org/voltha/>`_ to write up the release notes documentation.
  - ONF will work on filling in the grid of dependent components and apps
    at the bottom as they are built during a release cycle.

- Pre-screen your patch for potential problems, ``make test`` failures will cause patch acceptance to fail.

.. code-block:: bash

    # pre-screen for checkin test problems
    % make sterile
    % make test

    # Summarize make test
    % make test-errors

    # Optional
    % make lint

- Create a patch, request code reviews and merge.
- Wait for the jenkins voltha-docs sync job to complete before continuing on.


Cookbook: Patch #2
------------------
- Once release notes are ready to publish update the version string.
- Modify `VERSION <https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/VERSION>`_ file.
- Remove any vresion suffix decorations such as -dev.
- Increment version string for the upcomign release:

.. code-block:: bash

    # For exmaple increment version string
    2.11.5-dev

    # To the new release version: voltha-2.12
    2.12

- After a code merge and jenkins job has run to generate documentation.
- `https://docs.voltha.org <https://docs.voltha.org/master/index.html>`_ will contain the new release documentation if your version string appears in the top left navigation box on the site.


Release independent changes
---------------------------
- Update `copyright notice dates <https://github.com/joey-onf/copyright/blob/origin/master/notice>`_

  - VALID: Copyright 2017-2023 Open Networking Foundation (ONF) and the ONF Contributors
  - Copyright notice must be inclusive of the date sources were last modified.
  - Use of strings like 2017-present are not valid syntax and can have legal implications.
