@ECHO OFF
SET CYGWIN=c:\cygwin64
SET HOME=%CYGWIN%\home\Azy4476
cd %HOME%
%CYGWIN%\bin\bash --login --rcfile %HOME%\.bashrc -i
REM pause
