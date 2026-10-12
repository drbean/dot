#!/usr/bin/bash

echo ~/dot/screen/screenSs/pandoc.sh:
echo

nl ~/dot/screen/screenSs/pandoc.sh
echo

echo ~/dot/screen/pandocs:
echo

for f in ~/dot/screen/pandocs/*.{sh,rc} ; do
	echo -e $f:
	nl $f
	echo
done

exec bash -l
