$first="subversion,openssh,znc,screen,git"

 c:\Users\owuser\Downloads\setup-x86_64.exe --quiet-mode --root c:/cygwin64 --local-package-dir c:/Users/owuser/Downloads --site http://ftp.ntu.edu.tw/cygwin/ --packages $first
 cmd /c mklink /d c:\home c:\cygwin64\home
