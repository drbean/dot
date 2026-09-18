#!/usr/bin/bash

echo ~/dot/screen/screenS/premail.sh:
echo

nl ~/dot/screen/screenSs/premail.sh
echo

echo ~/dot/screen/premails:
echo

for f in ~/dot/screen/premails/*.{sh,rc} ; do
	echo -e $f:
	nl $f
	echo
done

exec bash -l
