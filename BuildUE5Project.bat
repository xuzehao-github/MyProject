:: Name:     BuildUE5Project.bat
:: Purpose:  Build the UE project without opening VS IDE.
:: Author:   EvenZHAng

:: This batch file is used to build the UE5 project in cureent folder.
:: For this bat to work correctly:
::   1. UE5 must be installed in the default path in C:\Program Files\Epic Games\UE_5.0.
::   2. This bat file should be in the same folder with the *.uproject file.
::   3. The build target is hardcoded to Win64 and Development. 

@echo off

SET CurrentPath=%cd%
echo Current Path: %CurrentPath%


echo.

:CHECK
for %%a in (*.uproject) do (
set FileName=%%a
Goto :BUILDPROJECT %FileName%
)
Goto :NOFILE


:BUILDPROJECT
echo Find UProject file: %FileName%
set FileNameNoSuffix=%FileName:.uproject=%
echo UProject Name: %FileNameNoSuffix%

:: Find UE5 install path

for /f "delims=" %%a in ('powershell -command "& { (Get-ItemProperty 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\EpicGames\Unreal Engine\5.0' -Name 'InstalledDirectory' ).'InstalledDirectory' }"') do set "UEInstalledPath=%%a"

echo %UEInstalledPath%



echo Start build project ...
echo.
powershell.exe "&\"%UEInstalledPath%\Engine\Build\BatchFiles\Build.bat\" -Target=\"%FileNameNoSuffix%Editor Win64 Development\"\" \"-Project=\"%CurrentPath%\%FileName%\""
echo.
Goto :DONE


:NOFILE
echo No uproject in this folder.


:DONE
echo Done!
echo.

pause