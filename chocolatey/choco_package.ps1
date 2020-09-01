ForEach ($p in "cygwin") { choco install $p --params "/DesktopIcon /Site:http://ftp.ntu.edu.tw/cygwin" }
$ps = "subversion", "openssh", "lftp", "vim", "screen", "mutt", "znc", "exim", "weechat", "znc", "lynx"
ForEach ($p in $ps) { choco install $p --source=cygwin }
$qs = "qutebrowser", "qutebrowser.install"
ForEach ($q in $qs) { choco install $q }
