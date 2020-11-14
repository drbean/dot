if [[ -x /cygdrive/c/tools/cygwin/cygwinsetup.exe ]]
then cyg_pack=/cygdrive/c/tools/cygwin/cygwinsetup.exe
else cyg_pack=/cygdrive/c/cygwin64/setup.exe
fi
for p in subversion openssh znc screen git
	do  $cyg_pack\
		--quiet-mode --no-desktop --no-startmenu \
		--root c:/tools/cygwin --local-package-dir \
		c:/tools/cygwin/packages --site \
		http://ftp.ntu.edu.tw/cygwin/ --packages $p
	done
p=weechat,lftp,vim,mutt,exim,lynx,weechat-perl,\
weechat-python,perl,\
perl-YAML,perl-List-MoreUtils,cron,perl-XML-DOM,python37
$cyg_pack --quiet-mode --no-desktop \
	--no-startmenu --root c:/tools/cygwin --local-package-dir \
	c:/tools/cygwin/packages --site http://ftp.ntu.edu.tw/cygwin/ \
	--packages $p
