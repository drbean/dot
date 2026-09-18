#!/usr/bin/bash

echo ~/dot/screen/screenS/email.sh:
echo

nl ~/dot/screen/screenSs/email.sh
echo

echo ~/dot/screen/emails:
echo

for f in ~/dot/screen/emails/*.{sh,rc} ; do
	echo -e $f:
	nl $f
	echo
done

exec bash -l
