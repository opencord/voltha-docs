======================
Contributing to VOLTHA
======================

We'd love to accept your patches and contributions to the VOLTHA project. There are
just a few small guidelines you need to follow.

Contributor License Agreement
-----------------------------

Contributions to this project must be accompanied by a Contributor License
Agreement. You (or your employer) retain the copyright to your contribution,
this simply gives us permission to use and redistribute your contributions as
part of the project. Head over to the `ONF CLA <https://cla.opennetworking.org/>`_ to see
your current agreements on file or to sign a new one.

You generally only need to submit a CLA once, so if you've already submitted one
(even if it was for a different project), you probably don't need to do it
again.

Guides, Rules and Best Practices
--------------------------------

VOLTHA follows `Google's Engineering Practices <https://google.github.io/eng-practices/>`_,
`Golang Formatting Guide <https://go.dev/doc/effective_go#formatting>`_. Use these documents as a guide when
writing, submitting or reviewing code.
VOLTHA uses gerrit to submit, review, tests and finally merge patches.

Submitting Code
+++++++++++++++

Some additional points for developers:

 - Submit your changes early and often. Input and
   corrections early in the process prevent huge changes later.

 - Please open a `jira ticket <https://jira.opencord.org/projects/VOL>`_ describing the issue/feature. During the patch please
   preface the commit message with `[VOL-<jira_number]` e.g. `[VOL-4550]` so it gets
   automatically linked to the Jira ticket. This keeps code review and design discussions clean.

Steps to successful PRs
+++++++++++++++++++++++

 1. Checkout the code and prepare your patch. The workflow to make changes to the VOLTHA code through gerrit is identical
    to the one from `onos-classic` and is described in the
    `Sample Gerrit Workflow page <https://wiki.onosproject.org/display/ONOS/Sample+Gerrit+Workflow>`_

 2. Before submitting the patch via `git review` please execute VOLTHA specific tests:
    `make test` and `make sca`. These commands run unit test, linting and other elements
    to assure the quality of your patch.

 3. Wait for sanity checks `jenkins <https://jenkins.opencord.org>`_ to pass.
    If the tests fail please fix your patch with step 3 an then repeat 2 and 3, as necessary.
    **Passing CI verification is mandatory.** If the CI check does not start or fails but you think the issue
    is un-related you can re-trigger by commenting on to the patch with `recheck`.

 4. When comments are made to your patch please make the appropriate fixes and then
    amend your commit with `git commit --amend` and re-upload to gerrit with `git review`.

 5. Await review. Everyone can comment on code changes, but only Core contributors
    can give final review approval. **All changes must get at least one
    approval**. Join one of the `communication channels <https://wiki.opennetworking.org/display/COM/VOLTHA>`_
    to request a review or to bring additional attention to your patch.

Versioning
++++++++++

All of the VOLTHA components and the charts include a VERSION file that specifies
the version of the service, library, protobuf, test suite included in the repository.
The VERSION is in the format and follows the `SemVer principles <https://semver.org>`_
VOLTHA also follows the guidelines on how to increment versions as described in the
`SemVer specification <https://semver.org/#semantic-versioning-specification-semver>`_.

Each increment of the VERSION file in a patch automatically triggers publishing of the repository
artifact, e.g. docker images, with that tag.
In VOLTHA we also use a `x.y.z-dev` format which identifies a non-released component (what is `master`).
When a patch is merged with the `-dev` suffix in the VERSION file no artifact is published except for `master`
docker images. The `-dev` suffix should be removed when a feature being worked on and the component
is ready for release.

We expect contributions to the VOLTHA codebase to follow these rules when submitting a patch
and the same rules to be enforced by reviewers during the core review process.


Core Contributors
-----------------

Anyone with a Gerrit account can open new issues, comment on existing issues, or
contribute code by opening a review.

A **“core contributor”** is someone who can manage, approve and
merge patches, and create new branches in the main repository.

Core contributors are responsible for maintaining the quality of contributions
to the codebase. The goal of this program is to have a diverse group of
individuals whose expertise in aggregate covers the entire project.

The benefits of being a core contributor include:
 - Increased influence of the direction of the project
 - The ability to create branches in the main repository and after others approve it
   merge your own code
 - Community recognition and visibility for their contributions and expertise.

Becoming a Core Contributor
+++++++++++++++++++++++++++

Core contributor candidates need to have a demonstrated proficiency with the
VOLTHA codebase and a track record of code reviews.  Members of the Technical
Steering Team (TST) and existing core contributors will regularly invite people
to become new core contributors. Nominations can also be made (including
self-nominations) to the VOLTHA TST (`voltha-tst@opennetworking.org`) at any time.

A good nomination will include details about who the person is (including their email
and Github and/or Gerrit username) and outline their experience with the VOLTHA codebase
and project at large.
Nominations are intended to start a conversation that results in a decision to
make the person a core contributor – anyone whose nomination is not initially
approved is encouraged to gain more experience with code submission and code
review in order to gain further mastery over the codebase. Partial approval is
also possible (e.g. a person may be granted the ability to handles patches only
on a certain repository), and full approval may be granted after the contributor
has gained more experience.

New core contributors will be assigned a mentor that is either a TST member or
existing core contributor. The mentor will serve as the primary point of contact
to help onboard the new core contributors and answer any questions they have
with their new responsibilities. The mentor is not the only point of contact,
and core contributors should feel free to reach out to others if and when they
have questions or concerns.

Guidelines for Core Contributors
++++++++++++++++++++++++++++++++

Contributions in VOLTHA can should be merged after two different +1 arrive on a
given patch-set that is verified by CI as well.
For your own contributions, you now have the ability to approve and merge your
own code, pending that you received two other positive reviews.
For larger or potentially controversial reviews, please give the
community an opportunity (at least a few business days) to review your
contribution. Please always ask for comments on the #voltha-dev Slack channel.
**With great power comes great responsibility; please don't abuse
this privilege.**

All Core Contributors have +2 and merge capabilities on all the repositories related
to the VOLTHA project, but we expect that they are responsible and exercise their
privilege **only** on patches and repositories they have expertise in and are comfortable reviewing and merging.

To help patchset verification the VOLTHA test infrastructure offers Per-Patchset Verification Jobs
triggered by specific keyword used in the patch. More information can be found in the
`testing automation page <https://docs.voltha.org/master/testing/voltha_test_automation.html#per-patchset-verification-jobs>`_
We suggest Core contributors to use these triggers when they would like more checks on a patch they are uncertain about
or that might have differences when applied to hardware pods.

VOLTHA follows `Google’s best practices for code review <https://google.github.io/eng-practices/review/reviewer/>`_.
You should apply these guidelines strictly and with confidence when reviewing
submissions.

If you are unsure about something in an issue or a review, leave a comment
that outlines your concerns. If a resolution is difficult to reach in the
comments section, the TST meetings are a good place to raise your concerns and
have a discussion.

Current Core Contributors
+++++++++++++++++++++++++++

This is a list of core contributors divided by area of expertise:

Adapter openonu and omci-lib-go:

 - `Holger Hildebrandt <holger.hildebrandt@adtran.com>`_
 - `Chip Boling <chip.boling@tibitcom.com>`_
 - `Michael Pagenkopf <michael.pagenkopf@adtran.com>`_
 - `Ozge Ayaz <ozge.ayaz@netsia.com>`_

Voltha-system-tests:

 - `Torsten Thieme <torsten.thieme@adtran.com>`_

Openolt agent:

 - `Thiyagarajan Subramani <Thiyagarajan.Subramani@radisys.com>`_
 - `Burak Gurdag <burak.gurdag@netsia.com>`_

ONOS apps:

 - `Gamze Abaka <gamze.abaka@netsia.com>`_
 - `Yasin Sapli <yasin.sapli@netsia.com>`_
 - `Tunahan Sezen <tunahan.sezen@netsia.com>`_

Olt adapter, rw-core:

 - `Abhilash Satish Laxmeshwar <abhilash.laxmeshwar@radisys.com>`_
 - `Gamze Abaka <gamze.abaka@netsia.com>`_

All of the codebase:

 - `Andrea Campanella <andrea@opennetworking.org>`_
 - `Matteo Scandolo <teo@opennetworking.org>`_
 - `Girish Gowdra <girish@opennetworking.org>`_
 - `Hardik Windlass <hardik@opennetworking.org>`_
 - `Suchitra Vemuri <suchitra@opennetworking.org>`_
 - `Saurav Das <saurav.das@opennetworking.org>`_
 - `Mahir Gunyel <mahir.gunyel@netsia.com>`_
 - `Serkant Uluderya <serkant.uluderya@netsia.com>`_
 - `Amit Ghosh <Amit.Ghosh@radisys.com>`_
 - `Khenaidoo Nursimulu <knursimu@ciena.com>`_
 - `David Bainbridge <dbainbri.ciena@gmail.com>`_

Community Guidelines
--------------------

This project follows `Google's Open Source Community Guidelines <https://opensource.google/conduct/>`_

and ONF's [Code of Conduct](CODE_OF_CONDUCT.md).
