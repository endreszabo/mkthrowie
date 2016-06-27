#!/bin/bash
#Endre Szabo, 2016 - https://github.com/endreszabo/mkthrowie/

V=0.03

set -ue

COLS=$(stty size)
COLS=$((${COLUMNS:-${COLS##* }}-3))
command -v xclip && XCLIP=1 || XCLIP=0

echo "mkthrowie.sh version $V"
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
		echo "#----- BEGIN THROWIE DATA BLOCK -----"
		cat
		echo "#----- END THROWIE DATA BLOCK -----"
	}
}

