ME%
@ECHO OFF
SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath=%ThisScriptsDirectory%spawn.ps1
C:\cygwin64\bin\bash -l c:\home\Azy4476\edit\trunk\email\open_faculty.sh %QUTE_FIFO%
@REM PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'" >> %QUTE_FIFO%
@REM echo open -t https://www.dict.cc >> %QUTE_FIFO%
@REM echo open -t https://www.dict.cc
