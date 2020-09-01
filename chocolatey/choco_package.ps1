ForEach ($p in "cygwin") { choco install $p --params "/DesktopIcon /Site:http://ftp.ntu.edu.tw/sourceware/cygwin" }
$ps = "subversion", "openssh", "lftp", "vim", "screen", "mutt", "znc", "exim" 
ForEach ($p in $ps) { choco install $p --source=cygwin }
ForEach ($p in "qutebrowser") { choco install $p.install }
