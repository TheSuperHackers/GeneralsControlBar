call SETUP_Folders.bat

:: Argument 1: Resolution Name
set ResolutionName=%1
set GeneratedReleaseUnpackedDirResX=%GeneratedReleaseUnpackedDir%%ResolutionName%

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\* %GeneratedReleaseUnpackedDirResX%\*

:: Define big file name(s)
set BigName=340_ControlBarPro%ResolutionName%ZH

:: Free folders of big file contents
del /s /f /q %GeneratedBigFilesUnpackedDir%\%BigName%
del /s /f /q %GeneratedBigFilesDir%\%BigName%.big

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.ini_%ResolutionName% %GeneratedBigFilesUnpackedDir%\%BigName%\*.ini

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDirResX%\%BigName%.big*
