#!/usr/bin/bash

echo ~/dot/screen/screenS/job.sh:
echo

nl ~/dot/screen/screenSs/job.sh
echo

echo ~/dot/screen/jobs:
echo

for f in ~/dot/screen/jobs/*.{sh,rc} ; do
	echo -e $f:
	nl $f
	echo
done

v ~/dot/screen/job.sh

exec bash -l
