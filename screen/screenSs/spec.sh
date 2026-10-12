#!/usr/bin/bash

ls -al ~/dot/screen/screenSs/spec.sh
echo

nl ~/dot/screen/screenSs/spec.sh
echo

echo ~/dot/screen/specs:
echo

for f in ~/dot/screen/specs/*.{sh,rc} ; do
	ls -al $f
	nl $f
	echo
done

exec bash -l
