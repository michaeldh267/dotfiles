#!/usr/bin/env bash
# a stub bash file, for any occassion


set -e # exit if any command has non-zero return value
set -u # exit if undefined reference found
set -o pipefail # do not mask pipeline errors
set -x # debug mode 
IFS=$'\n\t'

echo "Hello $(whoami)"
