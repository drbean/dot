for p in cygwin ; do choco install $p --params "/DesktopIcon /Site:http://ftp.ntu.edu.tw/sourceware/cygwin"
for p in subversion openssh lftp vim screen mutt znc exim ; do choco install $p --source=cygwin; done
for p in qutebrowser ; do choco install $p.install ; done
