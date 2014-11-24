@echo off
Set root=D:\CAD-Sicherung
Set MEPVERSION=MEP 2014

ECHO Sollen die lokalen Daten auf den zentralen Rechner kopiert werden?
SET /P X=(J)a oder (N)ein?

IF /I "%X%"=="J" goto :JACOPY
IF /I "%X%"=="N" goto :NEINCOPY

:JACOPY
echo lokaler user content
robocopy /MIR "%APPDATA%\Autodesk\%MEPVERSION%\deu\Support" "%root%\%MEPVERSION%\User"
echo lokaler globaler content
robocopy /MIR "%ALLUSERSPROFILE%\Autodesk\%MEPVERSION%\deu" "%root%\%MEPVERSION%\Global"

echo application plugins
robocopy /MIR "%APPDATA%\Autodesk\ApplicationPlugins" "%root%\Plugins"
echo application plugins
robocopy /MIR "%APPDATA%\CadDev\CadDevLoader" "%root%\CadDevLoader"

:NEINCOPY
cls
 
:ENDE
rem pause