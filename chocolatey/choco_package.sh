for p in subversion openssh znc screen git
	do /cygdrive/c/tools/cygwin/cygwinsetup.exe \
		--quiet-mode --no-desktop --no-startmenu \
		--root c:/tools/cygwin --local-package-dir \
		c:/tools/cygwin/packages --site \
		http://ftp.ntu.edu.tw/cygwin/ --packages $p
	done
p=weechat,lftp,vim,mutt,exim,lynx,weechat-perl,\
weechat-python,perl,gcc-g++,make,libcrypt-devel,libnsl-devel,\
perl-YAML,perl-List-MoreUtils,cron,perl-XML-DOM
/cygdrive/c/tools/cygwin/cygwinsetup.exe --quiet-mode --no-desktop \
	--no-startmenu --root c:/tools/cygwin --local-package-dir \
	c:/tools/cygwin/packages --site http://ftp.ntu.edu.tw/cygwin/ \
	--packages $p
