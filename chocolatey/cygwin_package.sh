if [[ -x /cygdrive/c/tools/cygwin/cygwinsetup.exe ]]
then cyg_pack='/cygdrive/c/tools/cygwin/cygwinsetup.exe \
	--quiet-mode --no-desktop \
	--no-startmenu --root c:/tools/cygwin --local-package-dir \
	c:/tools/cygwin/packages --site http://ftp.ntu.edu.tw/cygwin/ \
	--packages'
else cyg_pack='/cygdrive/c/Users/owuser/Downloads/setup-x86_64.exe \
	--quiet-mode --no-desktop \
	--no-startmenu --root c:/cygwin64 --local-package-dir \
	c:/cygwin64/etc/setup --site http://ftp.ntu.edu.tw/cygwin/ \
	--packages'
fi
for p in subversion openssh znc screen git
	do  $cyg_pack $p
done
p=weechat,lftp,vim,mutt,exim,lynx,weechat-perl,\
weechat-python,perl,\
perl-YAML,perl-List-MoreUtils,cron,perl-XML-DOM,python37
$cyg_pack $p
