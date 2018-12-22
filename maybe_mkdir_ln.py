#!/usr/bin/env python3

import os
import sys
from pathlib import Path

assert(len(sys.argv) == 3)

def main():
    try:
        os.makedirs(Path(sys.argv[2]).parent)
    except OSError as e:
        if e.errno == 17:
            print("Path exists: {}".format(e))
        else:
            print(e)
        return 1

    try:
        os.symlink(sys.argv[1], sys.argv[2])
    except OSError as e:
        if e.errno == 17:
            print("Symlink exists: {}".format(e))
        else:
            print(e)
        return 1


sys.exit(main())
