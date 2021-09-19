set ThisDir1=%~dp0
call %ThisDir1%SETUP_Folders.bat

setlocal enableextensions enabledelayedexpansion

:: Argument 1: Resolution Name
set ResolutionName=%1
set GeneratedReleaseUnpackedDirResX=%GeneratedReleaseUnpackedDir%%ResolutionName%

:: Copy base release files
xcopy /y /s %ReleaseUnpackedDir%\* %GeneratedReleaseUnpackedDirResX%\*

:: Define big file name(s)
set BigName=340_ControlBarPro%ResolutionName%ZH

:: Free folders of big file contents
del /f /q /s %GeneratedBigFilesUnpackedDir%\%BigName%
del /f /q    %GeneratedBigFilesDir%\%BigName%.big

:: Copy .big contents
xcopy /y /s %GameFilesDir%\*.wnd_resx %GeneratedBigFilesUnpackedDir%\%BigName%\*.wnd

:: Generate language ini files
for %%l in (Brazilian,Chinese,English,French,German,Italian,Korean,Polish,Spanish) do (
	set SourceDir=%GameFilesDir%\Data\%%l
	set DestDir=%GeneratedBigFilesUnpackedDir%\%BigName%\Data\%%l
	if exist !SourceDir! (
		if not exist !DestDir! mkdir !DestDir!
		py Scripts\MAKE_Language_Ini.py -resolution %ResolutionName% -source !SourceDir! -dest !DestDir!
	)
)

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDirResX%\%BigName%.big*
