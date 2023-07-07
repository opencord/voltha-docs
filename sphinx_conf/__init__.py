# -*- python -*-
'''Augment searchpath for import.'''

##-------------------##
##---]  IMPORTS  [---##
##-------------------##
import sys
from pathlib import Path

## ---------------------------------------
## Artificial scope created for local vars
## ---------------------------------------
# pylint: disable=invalid-name
# pylint: disable=using-constant-test
if True:
    mod_path = Path('..').resolve().as_posix()
    if mod_path not in sys.path:
        sys.path.insert(0, mod_path)

# [EOF]
