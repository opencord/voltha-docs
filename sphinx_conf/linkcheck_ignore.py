# -*- coding: utf-8 -*-
#
# Configuration file for the Sphinx documentation builder.
#
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
    ])

# [SEE ALSO]
# -----------------------------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-the-linkcheck-builder

# [EOF]
