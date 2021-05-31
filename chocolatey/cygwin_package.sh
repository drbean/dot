first=subversion,openssh,znc,screen,git
second=weechat,lftp,vim,mutt,exim,lynx,weechat-perl,\
weechat-python,perl,\
perl-YAML,perl-List-MoreUtils,cron,perl-XML-DOM,python37,\
jq
if [[ -x /cygdrive/c/tools/cygwin/cygwinsetup.exe ]]
	then for p in "$second"
		do /cygdrive/c/tools/cygwin/cygwinsetup.exe \
			--quiet-mode --no-desktop --no-startmenu \
			--root c:/tools/cygwin --local-package-dir \
			c:/tools/cygwin/packages --site \
			http://ftp.ntu.edu.tw/cygwin/ --packages $p
		done
elif [ -x /cygdrive/c/Users/owuser/Downloads/setup-x86_64.exe ]
	then for p in "$second"
		do /cygdrive/c/Users/owuser/Downloads/setup-x86_64.exe \
			--quiet-mode --no-desktop --no-startmenu \
			--root c:/cygwin64 --local-package-dir \
			c:/Users/owuser/Downloads --site \
			http://ftp.ntu.edu.tw/cygwin/ --packages $p
		done
fi
