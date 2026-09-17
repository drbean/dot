#!/usr/bin/bash

echo ~/dot/screen/screening/email.sh:
echo

nl ~/dot/screen/screenings/email.sh
echo

echo ~/dot/screen/emails:
echo

for f in ~/dot/screen/emails/*.{sh,rc} ; do
	echo -e $f:
	nl $f
	echo
done

exec bash -l
