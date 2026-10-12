#!/usr/bin/bash

ls -al ~/dot/screen/screenSs/premail.sh
echo

nl ~/dot/screen/screenSs/premail.sh
echo

echo ~/dot/screen/premails:
echo

for f in ~/dot/screen/premails/*.{sh,rc} ; do
	ls -al $f
	nl $f
	echo
done

exec bash -l
