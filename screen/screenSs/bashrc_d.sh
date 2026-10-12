#!/usr/bin/bash

ls -al ~/dot/screen/screenSs/bashrc_d.sh
echo

nl ~/dot/screen/screenSs/bashrc_d.sh
echo

echo ~/dot/screen/bashrc_ds:
echo

for f in ~/dot/screen/bashrc_ds/*.{sh,rc} ; do
	ls -al $f
	nl $f
	echo
done

exec bash -l
