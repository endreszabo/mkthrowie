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
echo "base64 -d<<_|tar xzv"
	[[ $# -gt 0 ]] && {
		tar --numeric-owner -cf - -- $@ | gzip -9 | base64 -w $COLS
	} || {
		tar --numeric-owner -cf - -- $0 | gzip -9 | base64 -w $COLS
	}
echo "_"
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

