choco feature enable -n allowGlobalConfirmation
ForEach ($p in "cygwin") { choco install $p --params "/DesktopIcon /Site:http://ftp.ntu.edu.tw/cygwin" }
$ps = "subversion", "openssh", "znc", "screen", "weechat", "lftp", "vim", "mutt", "exim", "lynx", "weechat-perl", "weechat-python", "perl", "make"
ForEach ($p in $ps) { choco install $p --source=cygwin }
# $pstring = ""
# ForEach ($p in $ps) { $pstring = $pstring + " " + $p }
# c:/tools/cygwin/cygwinsetup.exe --quiet-mode --no-desktop --no-startmenu --root c:/tools/cygwin --local-package-dir c:/tools/cygwin/packages --site http://ftp.ntu.edu.tw/cygwin/ --packages $pstring
$qs = "qutebrowser", "pandoc"
ForEach ($q in $qs) { choco install $q }