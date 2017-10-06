

import sys
import os
import re

# get the mirror
with open('/etc/slackpkg/mirrors', 'r') as f:
    for line in f:
        print(":::{}".format(line.strip()))
