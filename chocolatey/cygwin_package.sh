first=subversion,mosh,znc,screen,git
second=weechat,lftp,vim,mutt,exim,lynx,weechat-perl,\
weechat-python,perl,\
perl-YAML,perl-List-MoreUtils,cron,perl-XML-DOM,python37,\
python39,pjq,moreutils,perl-Term-ReadLine-Gnu,\
cygutils-extra
if [[ -x /cygdrive/c/tools/cygwin/cygwinsetup.exe ]]
	then for p in "$second"
		do /cygdrive/c/tools/cygwin/cygwinsetup.exe \
			--quiet-mode --no-desktop --no-startmenu \
			--root c:/tools/cygwin --local-package-dir \
			c:/tools/cygwin/packages --site \
			http://ftp.ntu.edu.tw/cygwin/ --packages $p
		done
elif [ -x /cygdrive/c/Users/$USER/Downloads/setup-x86_64.exe ]
	then for p in "$second" ; do
if [[ -d /cygdrive/c/Users/$USER/Downloads/ftp%3a%2f%2fftp.twaren.net%2fUnix%2fsourceware.org%2fcygwin%2f ]]
	then 
		/cygdrive/c/Users/$USER/Downloads/setup-x86_64.exe \
			--quiet-mode --no-desktop --no-startmenu \
			--root c:/cygwin64 --local-package-dir \
			c:/Users/$USER/Downloads --site \
			ftp://ftp.twaren.net/Unix/sourceware.org/cygwin \
			--packages $p
else
		/cygdrive/c/Users/$USER/Downloads/setup-x86_64.exe \
			--quiet-mode --no-desktop \
			--no-startmenu \
			--root c:/cygwin64 \
			--local-package-dir \
			c:/Users/$USER/Downloads --site \
			http://ftp.ntu.edu.tw/cygwin/ --packages $p
		fi
		done
elif [ -x /cygdrive/d/Users/$USER/Downloads/setup-x86_64.exe ]
	then for p in "$second"
		do /cygdrive/d/Users/$USER/Downloads/setup-x86_64.exe \
			--quiet-mode --no-desktop --no-startmenu \
			--root c:/cygwin64 --local-package-dir \
			c:/Users/$USER/Downloads --site \
			ftp://ftp.nuu.edu.tw/cygwin \
			--packages $p
		done
fi
