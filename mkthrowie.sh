#!/bin/bash

VERSION=0.02

set -o nounset

COLS=$(stty size)
COLS=${COLUMNS:-${COLS##* }}

echo "mkthrowie.sh version $VERSION"
echo "-------------------------"
echo "              vvvvvv--- start copy throwie below ---vvvvvv"
echo "base64 -d<<_EOF|tar xzv"
[[ $# -gt 0 ]] && {
	GZIP=-9 tar --numeric-owner --portability -czf - -- $@ | base64 -w $COLS
} || {
	GZIP=-9 tar --numeric-owner --portability -czf - -- $0 | base64 -w $COLS
}
echo "_EOF"
echo "              ^^^^^^--- end copy throwie above ---^^^^^^"
