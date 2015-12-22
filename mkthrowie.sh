#!/bin/bash

VERSION=0.01

set -o nounset

COLS=$(stty size)
COLS=${COLUMNS:-${COLS##* }}

echo "mkthrowie.sh version $VERSION"
echo "-------------------------"
echo "              vvvvvv--- copy throwie below ---vvvvvv"
echo "stty -echo;base64 -d<<_EOF|tar xzv;stty echo"
[[ $# -gt 0 ]] && {
	GZIP=-9 tar --numeric-owner --portability -czf - -- $@ | base64 -w $COLS
} || {
	GZIP=-9 tar --numeric-owner --portability -czf - -- $0 | base64 -w $COLS
}
echo "_EOF"
echo "              ^^^^^^--- copy throwie above ---^^^^^^"
