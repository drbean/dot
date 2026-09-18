#!/usr/bin/bash

echo ~/dot/screen/screening/spec.sh:
echo

nl ~/dot/screen/screenings/spec.sh
echo

echo ~/dot/screen/specs:
echo

for f in ~/dot/screen/specs/*.{sh,rc} ; do
	echo -e $f:
	nl $f
	echo
done

exec bash -l
