#!/usr/bin/bash

ls -al ~/dot/screen/screenSs/stowit.sh
echo

nl ~/dot/screen/screenSs/stowit.sh
echo

echo ~/dot/screen/stowits:
echo

for f in ~/dot/screen/stowits/*.{sh,rc} ; do
	ls -al $f
	nl $f
	echo
done

exec bash -l
