REM https://darrengoossens.wordpress.com/2018/10/04/simple-way-to-launch-cygwin-programs-on-windows-start-up/

C:
chdir C:\cygwin64\home\drbean

REM @echo off
REM https://www.robvanderwoude.com/wait.php
REM TIMEOUT /T 15

REM C:\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c "cd; exec /usr/bin/startxwin"
REM C:\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c "cd; exec /usr/local/bin/mrxvt &"
REM C:\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c "cd; exec /usr/bin/kcharselect &"

REM C:\cygwin64\bin\run.exe -p bin --quote /usr/bin/bash -l -c "cd; exec /usr/bin/mintty bash -i -c \"tt Mo qb mastodon bash E Pr Po\""
REM C:\cygwin64\bin\bash.exe -l -c "tt dot qb mastodon bash Pr web"
REM C:\cygwin64\bin\bash.exe -l -c "tt dot qb mastodon bash web 'edit -s jasoncclu -f bunker'"
REM C:\cygwin64\bin\bash.exe -l -c "tt dot qb mastodon bash Pr web 'edit -s chinte -f manuscript_eng -r paper_light_positioning_using_KAN'"
REM C:\cygwin64\bin\bash.exe -l -c "mintie dot qb mastodon web"
REM C:\cygwin64\bin\bash.exe -l -c "mintie web dot qb 'mastodon -a drbean@duk.space' 'postmail -l tw -a all' 'premail -l jp -a kinki -c osaka -s osaka-u -u https://rd.iai.osaka-u.ac.jp/?m=home'"
C:\cygwin64\bin\bash.exe -l -c "mintie web dot qb 'mastodon -a drbean@duk.space' 'email -l kr -a eastwest' 'premail -l jp -a kinki -c osaka -s osaka-u -u https://rd.iai.osaka-u.ac.jp/?m=home'"
REM C:\cygwin64\bin\bash.exe -l -c "mintie web dot qb 'mastodon -a drbean@duk.space' perlbrew 'edit -s jasoncclu -f revision_scooter'"
REM C:\cygwin64\bin\bash.exe -l -c "mintie web dot qb 'mastodon -a drbean@duk.space' Perlbrew
REM C:\cygwin64\bin\bash.exe -l -c "mintie dot qb 'mastodon -a drbean@duk.space' 'email -l tw -a all' 'postmail -l tw -a all' 'edit -s chinte -r  Paper_FMEA_RSM_KAN_GA_improve_DRE -f manuscript'"

REM TIMEOUT /T 15
exit
