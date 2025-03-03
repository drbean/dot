#!env bash

applist=perl-App-perlbrew

if [ -x /cygdrive/c/Users/$USER/Downloads/setup-x86_64.exe ] ; then
	/cygdrive/c/Users/$USER/Downloads/setup-x86_64.exe \
		--no-verify --quiet-mode --no-desktop --no-startmenu \
		--root c:/cygwin64 --local-package-dir \
		c:/Users/$USER/Desktop --site \
		http://drbean.sdf.org/cygwin \
		--packages $applist
fi
