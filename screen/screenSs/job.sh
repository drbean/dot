#!/usr/bin/bash

ls -al ~/dot/screen/screenSs/job.sh
echo

nl ~/dot/screen/screenSs/job.sh
echo

echo ~/dot/screen/jobs:
echo

for f in ~/dot/screen/jobs/*.{sh,rc} ; do
	ls -al $f
	nl $f
	echo
done

v ~/dot/screen/job.sh

exec bash -l
