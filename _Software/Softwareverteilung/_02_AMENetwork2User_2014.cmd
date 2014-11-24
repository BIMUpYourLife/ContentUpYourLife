@ECHO OFF
Set root=D:\CAD-Sicherung
Set MEPVERSION=MEP 2014

ECHO Sollen die zentralen Daten auf den lokalen Rechner kopiert werden?
SET /P X=(J)a oder (N)ein?

IF /I "%X%"=="J" goto :JACOPY
IF /I "%X%"=="N" goto :NEINCOPY

:JACOPY
echo lokaler user content
robocopy /MIR "%root%\%MEPVERSION%\User" "%APPDATA%\Autodesk\%MEPVERSION%\deu\Support"

echo lokaler globaler content
robocopy /MIR "%root%\%MEPVERSION%\Global" "%ALLUSERSPROFILE%\Autodesk\%MEPVERSION%\deu"

echo application plugins
robocopy /MIR "%root%\Plugins" "%APPDATA%\Autodesk\ApplicationPlugins"

echo caddev application plugins settings
robocopy /MIR "%root%\CadDevLoader" "%APPDATA%\CadDev\CadDevLoader"

cls
echo Deleting the profile Reg key
REG DELETE "HKCU\Software\Autodesk\AutoCAD\R19.1\ACAD-D006:407\Profiles\AutoCAD MEP (D A CH)" /f

:NEINCOPY
 
:ENDE
pause