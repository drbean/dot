#!/usr/bin/bash

echo ~/dot/screen/screenS/bashrc_d.sh:
echo

nl ~/dot/screen/screenSs/bashrc_d.sh
echo

echo ~/dot/screen/bashrc_ds:
echo

for f in ~/dot/screen/bashrc_ds/*.{sh,rc} ; do
	echo -e $f:
	nl $f
	echo
done

exec bash -l
