Misc Todo Items
===============

- Baseline build

  - Update copyright notices :ref:`Release Task Copyright`

- Pre-branch build
  - make help
  - make lint

- Build

  - make help
  - make sterile
  - make lint
  - make build
  - make test

## Post editing on the release branch:

- Update VERSION file to contain X.Y.{1+Z}
- Update .gitreview, defaultbranch=votlha-X.Y

- `bbsim-tests.groovy <https://gerrit.opencord.org/plugins/gitiles/ci-management/+/refs/heads/master/jjb/pipeline/voltha/bbsim-tests.groovy#35>`_

.. code:: groovy

   // -----------------------------------------------------------------------
   // Intent: Return branch name for the script.  A hardcoded value is used
   //   as a guarantee release jobs are running in an expected sandbox.
   // -----------------------------------------------------------------------
   String branchName()
   {
       String br = 'master'  // <<----** Change to release branch

       // "${branch}" is assigned by jenkins
       if (br != branch)
       {
           String err = [
               'ERROR: Detected invalid branch',
               "(expected=[${br}] != found=[${branch}])"
           ].join(' ')
           throw new Exception(err) // groovylint-disable-line ThrowException
       }
       return (br)
   }

## TODO

- Tools bbsim and voltctl are versioned for release.
- Track down which test scripts contain hardcoded versions for checkout.

  - Command use is all over the place and not all are being frozen.
  - Abstract this into makefile targets (~voltctl) or a central script
    that simply returns version string for a package.  A standalone entity
    will simplify maintenance and can be generated/autoamtically frozen
    on a branch at release time.

- Consider tool versioning in general.  Planning for tool upgrades helps
  minimize unplanned breakage.

