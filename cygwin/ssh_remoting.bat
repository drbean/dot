@ECHO OFF
SET USER=drbean
SET CYGWIN=c:\cygwin64
SET HOME=%CYGWIN%\home\%USER%
cd %HOME%
%CYGWIN%\bin\bash --login --rcfile %HOME%\.bashrc -i
REM pause
