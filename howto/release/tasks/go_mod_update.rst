.. _Release Task Golang Mod Update:

GOLANG: Update go.mod opencord package versions
===============================================

Update go package version dependencies.

NOTE: Files in the vendor/ directory should not be modified

- Sources are checked in purely for bootstrapping.
- Ideally vendor/ will be deleted and populated dynamically by git submodules.

.. code-block:: shell-session
   :caption: Update copyrigth notice ending date.

   % git clone ssh://gerrit.opencord.org:29418/ofagent-go.git
   % cd ofagent-go

   # ---------------------------------------
   # Preview packages and versions to modify
   # ---------------------------------------
   % grep opencord $(find . ! -path 'vendor/*' -name '*.go' -print)

   # --------------------------------------------------------------
   # Edit go.mod and update dependencies as needed
   # --------------------------------------------------------------
   % ${EDITOR} $(find . ! -path 'vendor/*' -name '*.go' -print)

   % make distclean

   # ------------------------------
   # Bulk fix golang linting errors
   # ------------------------------
   % find . ! -path 'vendor/*' -name '*.go' -print0 | xargs -0 gofmt -s -e -w

   # ---------------------------
   # Invoke go mod vendor
   # Invoke go mod tidy
   # From within a local sandbox
   # ---------------------------
   % make mod-update LOCAL_FIX_PERMS=1

   # -------------------------
   # Check for syntax problems
   # -------------------------
   % make lint

   # -----------------------------------
   # Pre-screen for jenkins job problems
   # -----------------------------------
   % make build
   % make test
