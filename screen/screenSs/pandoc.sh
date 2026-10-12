#!/usr/bin/bash

ls -al ~/dot/screen/screenSs/pandoc.sh
echo

nl ~/dot/screen/screenSs/pandoc.sh
echo

echo ~/dot/screen/pandocs:
echo

for f in ~/dot/screen/pandocs/*.{sh,rc} ; do
	ls -al $f
	nl $f
	echo
done

exec bash -l
