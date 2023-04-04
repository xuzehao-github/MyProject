:: Name:     InitProject.bat
:: Purpose:  Initialize the git submodules and build the project.
:: Author:   EvenZHAng

:: This batch file is used to Initialize the git submodules and build the UE5 project in cureent folder.
:: For this bat to work correctly:
::   1. UE5 must be installed in the default path in C:\Program Files\Epic Games\UE_5.0.
::   2. This bat file should be in the same folder with the *.uproject file.
::   3. The build target is hardcoded to Win64 and Development. 

@echo off

SET CurrentPath=%cd%
echo Current Path: %CurrentPath%

echo.

echo Initialize the submodules recursively.
git submodule update --init --recursive
echo Submodules updated.

echo.


echo Build.

CALL BuildUE5Project.bat

