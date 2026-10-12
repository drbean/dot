#!/usr/bin/bash

ls -al ~/dot/screen/screenSs/mastodon.sh
echo

nl ~/dot/screen/screenSs/mastodon.sh
echo

echo ~/dot/screen/mastodons:
echo

for f in ~/dot/screen/mastodons/*.{sh,rc} ; do
	ls -al $f
	nl $f
	echo
done

exec bash -l
