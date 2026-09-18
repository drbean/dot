#!/usr/bin/bash

echo ~/dot/screen/screenS/mastodon.sh:
echo

nl ~/dot/screen/screenSs/mastodon.sh
echo

echo ~/dot/screen/mastodons:
echo

for f in ~/dot/screen/mastodons/*.{sh,rc} ; do
	echo -e $f:
	nl $f
	echo
done

exec bash -l
