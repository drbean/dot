#!/usr/bin/bash

ls -al ~/dot/screen/screenSs/email.sh
echo

nl ~/dot/screen/screenSs/email.sh
echo

echo ~/dot/screen/emails:
echo

for f in ~/dot/screen/emails/*.{sh,rc} ; do
	ls -al $f
	nl $f
	echo
done

exec bash -l
