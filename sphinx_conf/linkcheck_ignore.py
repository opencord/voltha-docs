# -*- coding: utf-8 -*-
# -----------------------------------------------------------------------
# Copyright 2017-2024 Open Networking Foundation Contributors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# -----------------------------------------------------------------------
# SPDX-FileCopyrightText: 2017-2024 Open Networking Foundation Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------
# Intent: Configuration file for the Sphinx documentation builder.
# -----------------------------------------------------------------------

# -- Options for linkcheck ---------------------------------------------------
# The link checker strips off .md from links and then complains
linkcheck_ignore=\
    [
        r'https://github.com/opencord/voltctl/blob/master/LICENSE',
        r'https://github.com/ciena/kind-voltha#voltha-up-configuration-options',
        r'https://www.sphinx-doc.org',
        r'https://github.com/opencord/bbsim/blob/master/docs/source/DMI_Server_README',
        r'https://github.com/opencord/voltha-helm-charts/blob/master/README',
        #
        r'https://github.com/atomix/atomix/releases/tag/atomix-3.1.9',
        r'https://github.com/atomix/atomix/releases/tag/atomix-3.1.8',
        #
        r'../voltha-helm-charts/README.html',
        r'https://mvnrepository.com/artifact/org.slf4j/slf4j-api',
        r'https://mvnrepository.com/artifact/org.mockito/mockito-all',
        r'https://mvnrepository.com/artifact/com.h3xstream.findsecbugs/findsecbugs-plugin',
        r'https://mvnrepository.com/artifact/com.github.spotbugs/spotbugs-maven-plugin',
        r'\s+/release_notes/voltha-2.12\s+',
        r'\s+/release_notes/voltha_2.12.rst',
    ]

linkcheck_ignore.extend([

    # [RELEASE: generated html from rst
    r'../release_notes/voltha_\d+.\d+.html',

    # [RELEASE: Maven artifacts]
    r'https://mvnrepository.com/artifact/org.opencord/\S+',
])

## [HACK] to get release notes edits in
linkcheck_ignore.extend([

    r'https://mvnrepository.com/artifact/org.apache.servicemix.bundles/org.apache.servicemix.bundles.kafka-clients',

    # conf.py#308 - Anchor '308' not found
    # Line numbers in source are valid, figure out why this was flagged
#    r'https://gerrit.opencord.org/plugins/gitiles/voltha-docs/+/refs/heads/master/conf.py\#\d+',
])

## -----------------------------------------------------------------------
## https://jira.opencord.org/browse/VOL-5079
## -----------------------------------------------------------------------
linkcheck_ignore.extend([

    # (voltha-openonu-adapter-go/docs/PM_Notes: line  287) broken    https://github.com/opencord/voltha-protos/blob/master/protos/voltha_protos/extensions.proto#L259 - Anchor 'L259' not found
    r'https://github.com/opencord/voltha-protos/blob/master/protos/voltha_protos/extensions.proto#L259',

    # (voltha-openonu-adapter-go/docs/PM_Notes: line  311) broken    https://github.com/opencord/voltha-protos/blob/master/protos/voltha_protos/extensions.proto#L157 - Anchor 'L157' not found
    r'https://github.com/opencord/voltha-protos/blob/master/protos/voltha_protos/extensions.proto#L157',

    # (voltha-openonu-adapter-go/docs/ONU_Upgrade_Notes: line   69) broken    https://github.com/opencord/voltha-protos/blob/v4.0.11/protos/voltha_protos/device.proto#L106 - Anchor 'L106' not found
    r'https://github.com/opencord/voltha-protos/blob/v4.0.11/protos/voltha_protos/device.proto#L106',

    # (voltha-openonu-adapter-go/docs/PM_Notes: line   15) broken    https://github.com/opencord/voltha-protos/blob/v4.0.11/protos/voltha_protos/device.proto#L61 - Anchor 'L61' not found
    r'https://github.com/opencord/voltha-protos/blob/v4.0.11/protos/voltha_protos/device.proto#L61',

    # (voltha-openonu-adapter-go/docs/ONU_Upgrade_Notes: line   70) broken    https://github.com/opencord/voltha-protos/blob/v4.0.11/protos/voltha_protos/device.proto#L125 - Anchor 'L125' not found
    r'https://github.com/opencord/voltha-protos/blob/v4.0.11/protos/voltha_protos/device.proto#L125',

    # (voltha-openonu-adapter-go/docs/ONU_Upgrade_Notes: line   71) broken    https://github.com/opencord/voltha-protos/blob/v4.0.11/protos/voltha_protos/device.proto#L116 - Anchor 'L116' not found
    r'https://github.com/opencord/voltha-protos/blob/v4.0.11/protos/voltha_protos/device.proto#L116',

    # (testing/voltha_test_automation: line   20) broken
    r'https://jenkins.opencord.org/view/voltha-soak/',

    # (testing/certification: line    5) broken
    # This page no longer exists. A note has been added to the page.
    r'https://opennetworking.org/marketplace/?_product_project=voltha',

    # (overview/contributing: line   51) broken
    # Page exists, but certificate is no longer good. This wiki is deprecated,
    # and doesn't seem to be in regular use anymore. References should be removed.
    r'https://wiki.onosproject.org/.*',

    ])

# [SEE ALSO]
# -----------------------------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-the-linkcheck-builder

# [EOF]
