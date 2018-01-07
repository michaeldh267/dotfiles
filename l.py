

import sys
# import os
# import re
# import sys

if __name__ == '__main__':
    if len(sys.argv) > 1:
        with open(sys.argv[1], 'r') as f:
            for char in f.read(1):
                print(char)
