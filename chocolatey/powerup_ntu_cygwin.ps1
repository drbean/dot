$first="subversion,openssh,znc,screen,git"
$user="owuser"

& $HOME\Downloads\setup-x86_64.exe --quiet-mode --root c:/cygwin64 --local-package-dir c:/Users/$user/Downloads --site http://ftp.ntu.edu.tw/pub/cygwin/ --packages $first
 cmd /c mklink /d c:\home c:\cygwin64\home
