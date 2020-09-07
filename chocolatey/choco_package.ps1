choco feature enable -n allowGlobalConfirmation
ForEach ($p in "cygwin") { choco install $p --params "/DesktopIcon /Site:http://ftp.ntu.edu.tw/cygwin" }
$ps = "subversion", "openssh", "znc", "weechat", "lftp", "vim", "screen", "mutt", "exim", "lynx"
ForEach ($p in $ps) { choco install $p --source=cygwin }
$qs = "qutebrowser pandoc", "qutebrowser.install"
ForEach ($q in $qs) { choco install $q }
