:: Define archive name(s)
set ArchiveName=ControlBarProZH_v1.0

:: Define big file name(s)
set BigName=340_ControlBarProZH

:: Setup work folders
set GameFilesDir=GameFilesEdited
set BigFilesUnpackedDir=.Generated\BigFilesUnpacked
set BigFilesDir=.Generated\BigFiles
set ReleaseUnpackedDir=ReleaseUnpacked
set ReleaseDir=Release

if not exist %BigFilesUnpackedDir% mkdir %BigFilesUnpackedDir%
if not exist %BigFilesDir% mkdir %BigFilesDir%
if not exist %ReleaseUnpackedDir% mkdir %ReleaseUnpackedDir%
if not exist %ReleaseDir% mkdir %ReleaseDir%

:: Free folders of big file contents
del /s /f /q %BigFilesUnpackedDir%
del /s /f /q %BigFilesDir%

setlocal enableextensions enabledelayedexpansion

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.tga %BigFilesUnpackedDir%\%BigName%\
xcopy /Y /S %GameFilesDir%\*.dds %BigFilesUnpackedDir%\%BigName%\
xcopy /Y /S %GameFilesDir%\*.ini %BigFilesUnpackedDir%\%BigName%\
xcopy /Y /S %GameFilesDir%\*.wnd %BigFilesUnpackedDir%\%BigName%\

:: Generate .big file(s)
set GeneralsBigCreatorExe=..\Tools\GeneralsBigCreator\GeneralsBigCreator.exe
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%BigName% -dest %BigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpackedDir%\%BigName%.big.bak*

:: Generate Archive(s)
tar.exe -a -c -C %ReleaseUnpackedDir% -f %ReleaseDir%\%ArchiveName%.zip *.*
