#!/usr/bin/bash

echo ~/dot/screen/screenS/stowit.sh:
echo

nl ~/dot/screen/screenSs/stowit.sh
echo

echo ~/dot/screen/stowits:
echo

for f in ~/dot/screen/stowits/*.{sh,rc} ; do
	echo -e $f:
	nl $f
	echo
done

exec bash -l
