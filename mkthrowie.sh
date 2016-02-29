#!/bin/bash

VERSION=0.02

set -o nounset
set -o errexit

COLS=$(stty size)
COLS=${COLUMNS:-${COLS##* }}
echo -n | xclip -i && XCLIP=1 || XCLIP=0

echo "mkthrowie.sh version $VERSION"
echo "-------------------------"
{
echo "base64 -d<<_EOF|tar xzv"
	[[ $# -gt 0 ]] && {
		GZIP=-9 tar --numeric-owner --portability -czf - -- $@ | base64 -w $COLS
	} || {
		GZIP=-9 tar --numeric-owner --portability -czf - -- $0 | base64 -w $COLS
	}
echo "_EOF"
} | {
	[[ $XCLIP == 1 ]] && {
		xclip -i
		echo 'Copied onto clipboard.'
	} || {
		echo "              vvvvvv--- start copy throwie below ---vvvvvv"
		cat
		echo "              ^^^^^^--- end copy throwie above ---^^^^^^"
	}
}

