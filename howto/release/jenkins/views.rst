Job Views
=========

LTS
---

With each major LTS voltha release (v2.11, v2.8) a new jenkins view will
need to be created.

- Navigate to `jenkins.opencord.org <https://jenkins.opencord.org>`_.
- Click "New View" from the jenkins UI.
- Name: VOLTHA-X.Y
- Job filters

  - Click "Use a regular expression to include jobs into the view"
  - Regular expression: .*voltha.*[_-]2\.11.*

    - Match branch name voltha-2.11 (job view)

      - ``verify_bbsim-sadis-server_sanity-test-voltha-2.11``

    - Match derived job name voltha_2.11

      - ``verify_berlin-community-pod-1-gpon-adtran_Default_DT_voltha_2.11_dmi``

    - Match derived job name: voltha.*2.11 (job view)

      - ``periodic-voltha-test-bbsim-2.11``
