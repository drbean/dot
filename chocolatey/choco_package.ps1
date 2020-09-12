choco feature enable -n allowGlobalConfirmation
ForEach ($p in "cygwin") { choco install $p --params "/DesktopIcon /Site:http://ftp.ntu.edu.tw/cygwin" }
$ps = "subversion", "openssh", "znc", "weechat", "lftp", "vim", "screen", "mutt", "exim", "lynx"
# ForEach ($p in $ps) { choco install $p --source=cygwin }
ForEach ($p in $ps) { c:/tools/cygwin/cygwinsetup.exe --quiet-mode --no-desktop --no-startmenu --root c:/tools/cygwin --local-package-dir c:/tools/cygwin/packages --site http://ftp.ntu.edu.tw/cygwin/ --packages $p }
$qs = "qutebrowser", "pandoc"
ForEach ($q in $qs) { choco install $q }
